import 'dart:convert';
import 'dart:io';
import 'package:crypto/crypto.dart';
import 'package:ecf_dgii/src/utils/directories.dart';
import 'package:flutter/services.dart';
import 'package:xml/xml.dart';
import 'package:xml_crypto/xml_crypto.dart';
import 'package:path/path.dart' as path;

Uint8List loadPrivateKeyDer(String pem) {
  final cleaned = pem
      .replaceAll('-----BEGIN PRIVATE KEY-----', '')
      .replaceAll('-----END PRIVATE KEY-----', '')
      .replaceAll(RegExp(r'\s+'), '');

  return utf8.encode(cleaned); // ✅ esto sí devuelve Uint8List válido
}

String removeXmlDeclaration(String xml) {
  return xml.replaceFirst(RegExp(r'^<\?xml.*?\?>\s*'), '');
}

class XmlSignerService {
  String rsaPrivateKey;
  String certBase64;
  XmlSignerService({required this.rsaPrivateKey, required this.certBase64});

  /*Future<XmlSignerModel> signXml(String xmlOriginal, File fileOutPath) async {
    final tempDir = path.join(dirProject.path, 'temp');
    final c14nFile = File(path.join(tempDir, 'c14n.xml'));
    final signedInfoFile = File(path.join(tempDir, 'signed_info.xml'));
    final tempSeed = File(path.join(tempDir, 'semilla.xml'));

    // Asegúrate que aquí no haya ningún nodo <Signature>, ni siquiera vacío
    var canonicalXml = await canonicalFile(tempSeed); // c14n (no firma aún)

    await c14nFile.writeAsBytes(utf8.encode(canonicalXml));

    canonicalXml = utf8.decode(await c14nFile.readAsBytes());

    final digestBase64 = await calcularDigest(canonicalXml);

    final signedInfoXml = '''
<SignedInfo xmlns="http://www.w3.org/2000/09/xmldsig#">
  <CanonicalizationMethod Algorithm="http://www.w3.org/TR/2001/REC-xml-c14n-20010315"/>
  <SignatureMethod Algorithm="http://www.w3.org/2001/04/xmldsig-more#rsa-sha256"/>
  <Reference URI="">
    <Transforms>
      <Transform Algorithm="http://www.w3.org/2000/09/xmldsig#enveloped-signature"/>
    </Transforms>
    <DigestMethod Algorithm="http://www.w3.org/2001/04/xmlenc#sha256"/>
    <DigestValue>$digestBase64</DigestValue>
  </Reference>
</SignedInfo>
''';

    // Guardar SignedInfo antes de Canonicalizar
    await signedInfoFile.create(recursive: true);
    await signedInfoFile.writeAsString(signedInfoXml);

    // 3️⃣ Canonicalizar SignedInfo
    var canonicalSignedInfoResult = await canonicalFile(signedInfoFile);

    var canonicalSignedInfo = canonicalSignedInfoResult;
    await signedInfoFile.writeAsString(canonicalSignedInfo);
    canonicalSignedInfo = await signedInfoFile.readAsString();

    // 4️⃣ Firmar SignedInfo con el certificado P12
    final result = await firmarSignedInfoConP12(
      p12Path: certFile.path,
      p12Password: password,
      signedInfoXmlPath: signedInfoFile.path,
    );
    var firmaBytes = result[0];

    var certificadoBase64 = result[1].trim();

    final signatureValue = base64Encode(firmaBytes);

    // 5️⃣ Construir nodo Signature
    final signatureXml = '''
<Signature xmlns="http://www.w3.org/2000/09/xmldsig#">
$canonicalSignedInfo
<SignatureValue>$signatureValue</SignatureValue>
<KeyInfo>
  <X509Data>
    <X509Certificate>$certificadoBase64</X509Certificate>
  </X509Data>
</KeyInfo>
</Signature>
''';

    final xmlSinDeclaracion = removeXmlDeclaration(xmlOriginal);
    var finalXmlStr = insertarFirmaXml(xmlSinDeclaracion, signatureXml);

    await fileOutPath.writeAsString(finalXmlStr);

    await verificarDigestCorrecto(
        canonicalXmlOriginal: canonicalXml, signedXmlFinal: finalXmlStr);

    String code = getSecurityCode(signatureValue);

    return XmlSignerModel(
      xmlStr: finalXmlStr,
      xmlFile: fileOutPath,
      codigoSeguridad: code, // Puedes obtenerlo según sea necesario
    );
  }*/

  Future<XmlSignerModel> signXml(String xmlOriginal, File file) async {
    final unsignedXml = removeXmlDeclaration(xmlOriginal);

    // 2) Construye el SignedXml
    final signer = SignedXml()
      // URI="" -> referencia al documento completo
      ..addReference(
        null, // no XPath
        ['http://www.w3.org/2000/09/xmldsig#enveloped-signature'],
        'http://www.w3.org/2001/04/xmlenc#sha256',
        '', // URI vacío
        null, // digestValue (se calculará)
        null, // inclusiveNamespacesPrefixList
        true, // isEmptyUri = true para que use URI=""
      )
      ..keyInfoProvider = X509KeyInfoProvider(certBase64, rsaPrivateKey)
      ..canonicalizationAlgorithm =
          'http://www.w3.org/TR/2001/REC-xml-c14n-20010315'
      ..signatureAlgorithm = 'http://www.w3.org/2001/04/xmldsig-more#rsa-sha256'

      // Y computa la firma sobre el XML sin la cabecera <?xml…?>
      ..computeSignature(unsignedXml);

    // 3) Escribe el resultado
    await file.writeAsString(signer.signedXml);

    return XmlSignerModel(
        xmlStr: signer.signedXml,
        xmlFile: file,
        codigoSeguridad: getSecurityCode(signer.signatureValue));
  }
}

String getSecurityCode(String signatureValueBase64) {
  // Decodificar la firma desde Base64 a bytes reales
  final signatureBytes = base64.decode(signatureValueBase64);

  // Obtener hash SHA256 de los bytes
  final hash = sha256.convert(signatureBytes);

  // Codificar el hash en Base64 y tomar los primeros 6 caracteres
  return base64.encode(hash.bytes).substring(0, 6);
}

class XmlSignerModel {
  final String xmlStr;
  final File xmlFile;
  final String codigoSeguridad;

  XmlSignerModel({
    required this.xmlStr,
    required this.xmlFile,
    required this.codigoSeguridad,
  });
}

Future<String> canonicalXml(String xmlText) async {
  final process = await Process.start('xmllint', ['--c14n', '-']);

  // Escribimos el XML al stdin del proceso
  process.stdin.write(xmlText);
  await process.stdin.close();

  // Esperamos la salida del proceso
  final output =
      await process.stdout.transform(SystemEncoding().decoder).join();
  final errors =
      await process.stderr.transform(SystemEncoding().decoder).join();

  final exitCode = await process.exitCode;

  if (exitCode != 0) {
    throw Exception('❌ Error canonicalizando XML: $errors');
  }

  return output;
}

Future<void> verificarDigestCorrecto({
  required String canonicalXmlOriginal,
  required String signedXmlFinal,
}) async {
  final doc = XmlDocument.parse(signedXmlFinal);
  final digestNode = doc
      .findAllElements('DigestValue',
          namespace: 'http://www.w3.org/2000/09/xmldsig#')
      .firstOrNull;

  if (digestNode == null) {
    print('❌ No se encontró DigestValue.');
    return;
  }

  final embeddedDigest = digestNode.innerText.trim();
  final expectedDigest =
      base64.encode(sha256.convert(utf8.encode(canonicalXmlOriginal)).bytes);

  print('📄 Digest embebido: $embeddedDigest');
  print('📦 Digest esperado: $expectedDigest');

  if (embeddedDigest == expectedDigest) {
    print('✅ Digest coincide. Firma válida.');
  } else {
    print('❌ Digest NO coincide. Firma inválida.');
  }
}

Future<String> calcularDigest(String xml) async {
  final sha256Digest = sha256.convert(utf8.encode(xml));
  return base64.encode(sha256Digest.bytes);
}

class X509KeyInfoProvider implements KeyInfoProvider {
  final String certBase64;
  final String key;
  X509KeyInfoProvider(this.certBase64, this.key);

  @override
  String getKeyInfo(Uint8List? signingKey, String? prefix) {
    // Si xml_crypto le pasa un prefijo (p.ej. "ds"), lo respetamos:
    final p = (prefix != null && prefix.isNotEmpty) ? '$prefix:' : '';
    return '<${p}X509Data>'
        '<${p}X509Certificate>'
        '$certBase64'
        '</${p}X509Certificate>'
        '</${p}X509Data>';
  }

  @override
  Uint8List? getKey(String? keyInfo) {
    return File(path.join(dirProject.path, 'temp', 'systemp', 'key.pem'))
        .readAsBytesSync();
  }

  @override
  Map<String, dynamic>? get attrs => {};
}
