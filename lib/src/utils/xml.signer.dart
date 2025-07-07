import 'dart:convert';
import 'dart:io';
import 'package:crypto/crypto.dart';
import 'package:ecf_dgii/src/utils/directories.dart';
import 'package:pointycastle/asymmetric/api.dart';
import 'package:xml/xml.dart';
import 'package:path/path.dart' as path;

class XmlSignerService {
  final RSAPrivateKey privateKey;
  final String certificateBase64;

  XmlSignerService({
    required this.privateKey,
    required this.certificateBase64,
  });
  String removeXmlDeclaration(String xml) {
    return xml.replaceFirst(RegExp(r'^<\?xml.*?\?>\s*'), '');
  }

  Future<XmlSignerModel> signXml(
    String xmlOriginal,
    File fileOutPath,
    File certFile,
    String password,
  ) async {
    final tempDir = path.join(dirProject.path, 'temp');
    final tempSeedFile = File(path.join(tempDir, 'semilla.xml'));
    final c14nFile = File(path.join(tempDir, 'c14n.xml'));
    final signedInfoFile = File(path.join(tempDir, 'signed_info.xml'));

    var canonDigestResult = await canonicalFile(tempSeedFile);

    var canonicalXml = canonDigestResult;
    await c14nFile.writeAsString(canonicalXml);
    canonicalXml = await c14nFile.readAsString();

    final digestBase64 = await calcularDigest(canonicalXml);

    print(canonicalXml);
    print(digestBase64);

    // 2️⃣ Construir SignedInfo
    final signedInfoXml = '''
<SignedInfo>
  <CanonicalizationMethod Algorithm="http://www.w3.org/TR/2001/RECxml-c14n-20010315"/>
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

    final signatureValue = base64.encode(firmaBytes);

    print(certificadoBase64);

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

    finalXmlStr = await fileOutPath.readAsString();

    await verificarDigestCorrecto(
        canonicalXmlOriginal: canonicalXml, signedXmlFinal: finalXmlStr);

    print(fileOutPath);

    return XmlSignerModel(
      xmlStr: finalXmlStr,
      xmlFile: fileOutPath,
      codigoSeguridad: '', // Puedes obtenerlo según sea necesario
    );
  }
}

String insertarFirmaXml(String xmlOriginal, String signatureXmlStr) {
  // Parseamos el documento original
  final document = XmlDocument.parse(xmlOriginal);
  final root = document.rootElement;

  // Parseamos el XML de la firma como fragmento
  final frag = XmlDocument.parse('<Fragment>$signatureXmlStr</Fragment>');

  // Clonamos cada elemento hijo del fragmento y lo insertamos
  for (final node in frag.rootElement.children) {
    // .copy() crea un clon sin padre
    root.children.add(node.copy());
  }

  // Reconstruimos el string completo con encabezado
  return '<?xml version="1.0" encoding="utf-8"?>\n${document.toXmlString(pretty: true, indent: '  ')}';
}

Future<List<dynamic>> firmarSignedInfoConP12({
  required String p12Path,
  required String p12Password,
  required String signedInfoXmlPath,
}) async {
  final tempDir = Directory(path.join(dirProject.path, 'temp', 'systemp'));
  await tempDir.create(recursive: true);

  final pemFile = File(path.join(tempDir.path, 'key_and_cert.pem'));
  final keyFile = File(path.join(tempDir.path, 'key.pem'));
  final sigBin = File(path.join(tempDir.path, 'signature.bin'));
  final certOutPem = File(path.join(tempDir.path, 'cert.crt'));
  //final c14nFile = File(path.join(tempDir.path, 'signed_info.c14n'));

  try {
    // 1️⃣ Extraer PEM completo desde el .p12
    final extract = await Process.run('openssl', [
      'pkcs12',
      '-in',
      p12Path,
      '-nodes',
      '-passin',
      'pass:$p12Password',
      '-out',
      pemFile.path,
      '-legacy',
    ]);

    if (extract.exitCode != 0) {
      throw Exception('❌ Error extrayendo PEM del .p12: ${extract.stderr}');
    }

    // 2️⃣ Extraer solo el certificado (sin clave)
    final extractCert = await Process.run('openssl', [
      'pkcs12',
      '-in',
      p12Path,
      '-clcerts',
      '-nokeys',
      '-passin',
      'pass:$p12Password',
      '-out',
      certOutPem.path,
      '-legacy',
    ]);

    if (extractCert.exitCode != 0) {
      throw Exception(
          '❌ Error extrayendo CERT del .p12: ${extractCert.stderr}');
    }

    // 3️⃣ Leer y limpiar el certificado en formato PEM
    final pemContent = await certOutPem.readAsString(encoding: latin1);
    final cleanPem = pemContent
        .split('-----BEGIN CERTIFICATE-----')
        .last
        .split('-----END CERTIFICATE-----')
        .first
        .replaceAll(RegExp(r'\s+'), '')
        .trim();

    // 4️⃣ Extraer solo la clave privada en key.pem
    final extractKey = await Process.run('openssl', [
      'pkey',
      '-in',
      pemFile.path,
      '-out',
      keyFile.path,
    ]);

    if (extractKey.exitCode != 0) {
      throw Exception('❌ Error extrayendo clave privada: ${extractKey.stderr}');
    }

    // 5️⃣ Firmar el archivo canonicalizado con clave RSA + SHA256
    final firmar = await Process.run('openssl', [
      'dgst',
      '-sha256',
      '-sign',
      keyFile.path,
      '-out',
      sigBin.path,
      signedInfoXmlPath,
    ]);

    if (firmar.exitCode != 0) {
      throw Exception('❌ Error generando la firma: ${firmar.stderr}');
    }

    // 6️⃣ Validar que los archivos existen
    if (!(await pemFile.exists()) ||
        !(await keyFile.exists()) ||
        !(await sigBin.exists()) ||
        !(await certOutPem.exists())) {
      throw Exception('❌ Archivos de firma no generados correctamente.');
    }

    return [await sigBin.readAsBytes(), cleanPem];
  } finally {}
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

Future<String> canonicalFile(File file) async {
  final result = await Process.run('xmllint', ['--exc-c14n', file.path]);
  if (result.exitCode != 0) {
    throw Exception('❌ Error canonicalizando: ${result.stderr}');
  }

  return result.stdout;
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

/// Canonicaliza el XML con xmllint, guarda el resultado y calcula digest sha256
Future<String> calcularDigestConC14nYGuardar({
  required String inputXmlPath,
  required String outputC14nPath,
}) async {
  // Ejecutar xmllint para canonicalizar (exclusive c14n)
  final result = await Process.run('xmllint', ['--exc-c14n', inputXmlPath]);

  if (result.exitCode != 0) {
    throw Exception('Error canonicalizando XML: ${result.stderr}');
  }

  final canonicalXml = result.stdout as String;

  // Guardar el XML canonicalizado en el archivo de salida
  final outputFile = File(outputC14nPath);
  await outputFile.writeAsString(canonicalXml);

  // Calcular digest SHA256 del XML canonicalizado
  final sha256Digest = sha256.convert(utf8.encode(canonicalXml));

  // Retornar digest en base64
  return base64.encode(sha256Digest.bytes);
}
