import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';
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

  Future<XmlSignerModel> signXml(
    String xmlOriginal,
    File fileOutPath,
    File certFile,
    String password,
  ) async {
    final tempDir = path.join(dirProject.path, 'temp');
    final tempSeedFile = File(path.join(tempDir, 'semilla_sin_firmar.xml'));
    final signedInfoFile = File(path.join(tempDir, 'signed_info.xml'));

    final xmlSinFirma = xmlOriginal;
    await tempSeedFile.create(recursive: true);
    await tempSeedFile.writeAsString(xmlSinFirma);

    final canonDigestResult = await canonicalFile(tempSeedFile);

    final canonicalXml = canonDigestResult;
    final canonicalBytes = utf8.encode(canonicalXml);
    final digestValue = sha256.convert(canonicalBytes);
    final digestBase64 = base64.encode(digestValue.bytes);

    // 2️⃣ Construir SignedInfo
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
    final canonicalSignedInfoResult = await canonicalFile(signedInfoFile);

    var canonicalSignedInfo = canonicalSignedInfoResult;
    await signedInfoFile.writeAsString(canonicalSignedInfo);

    // 4️⃣ Firmar SignedInfo con el certificado P12
    final firmaBytes = await firmarSignedInfoConP12(
      p12Path: certFile.path,
      p12Password: password,
      signedInfoXmlPath: signedInfoFile.path,
    );

    final signatureValue = base64.encode(firmaBytes);

    // 5️⃣ Construir nodo Signature
    final signatureXml = '''
<Signature xmlns="http://www.w3.org/2000/09/xmldsig#">
$canonicalSignedInfo
<SignatureValue>$signatureValue</SignatureValue>
<KeyInfo>
  <X509Data>
    <X509Certificate>$certificateBase64</X509Certificate>
  </X509Data>
</KeyInfo>
</Signature>
''';

    var finalXmlStr = xmlSinFirma.replaceFirst(
      '</SemillaModel>',
      '$signatureXml</SemillaModel>',
    );

    // Guardar el XML final con la firma
    await fileOutPath.writeAsString(finalXmlStr);

    //finalXmlStr = await canonicalFile(fileOutPath);

    await fileOutPath.writeAsString(finalXmlStr);

    // 🔐 Verificar digest para depuración
    await verificarDigestCorrecto(
      canonicalXmlOriginal: canonicalXml,
      signedXmlFinal: finalXmlStr,
    );

    return XmlSignerModel(
      xmlStr: finalXmlStr,
      xmlFile: fileOutPath,
      codigoSeguridad: '', // Puedes obtenerlo según sea necesario
    );
  }
}

Future<Uint8List> firmarSignedInfoConP12({
  required String p12Path,
  required String p12Password,
  required String signedInfoXmlPath,
}) async {
  final tempDir = Directory(path.join(dirProject.path, 'temp', 'systemp'));
  await tempDir.create(recursive: true);
  final pemFile = File(path.join(tempDir.path, 'key_and_cert.pem'));
  final keyFile = File(path.join(tempDir.path, 'key.pem'));
  final sigBin = File(path.join(tempDir.path, 'signature.bin'));

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

    // 2️⃣ Extraer solo la clave privada en key.pem
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

    // 3️⃣ Firmar el archivo canonicalizado con clave RSA + SHA256
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

    // Verificar que los archivos se generaron correctamente
    if (!(await pemFile.exists()) ||
        !(await keyFile.exists()) ||
        !(await sigBin.exists())) {
      throw Exception('❌ Archivos de firma no generados correctamente.');
    }

    return await sigBin.readAsBytes();
  } finally {
    // Limpiar archivos temporales
    // await tempDir.delete(recursive: true);
  }
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
  // 3️⃣ Canonicalizar SignedInfo
  final canonicalSignedInfoResult = await Process.run(
    'xmllint',
    ['--c14n', file.path],
    runInShell: true,
  );
  if (canonicalSignedInfoResult.exitCode != 0) {
    throw Exception(
        '❌ Error canonicalizando XML base: ${canonicalSignedInfoResult.stderr}');
  }
  return canonicalSignedInfoResult.stdout;
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
