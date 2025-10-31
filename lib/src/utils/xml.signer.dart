import 'dart:io';
import 'dart:convert';
import 'dart:typed_data';
import 'package:crypto/crypto.dart';
import 'package:ecf_dgii/src/utils/directories.dart';
import 'package:xml/xml.dart';
import 'package:xml_crypto/xml_crypto.dart';
import 'package:path/path.dart' as path;

/// Creacion de un [XmlSignerModel]
class XmlSignerModel {
  /// XmlData en formato [String]
  final String xmlStr;

  /// Xml Archivo en formato [File]
  final File xmlFile;

  /// Codigo de seguridad del [EcfModel] en formato [String]
  final String codigoSeguridad;

  /// Inicio de un [XmlSignerModel]

  XmlSignerModel({
    required this.xmlStr,
    required this.xmlFile,
    required this.codigoSeguridad,
  });
}

/// Creacion de un [X509KeyInfoProvider]

class X509KeyInfoProvider implements KeyInfoProvider {
  /// Certificado publico en formato [String]
  final String certBase64;

  /// Clave privada en formato [String]
  final String key;

  /// Inicio de un [X509KeyInfoProvider]
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
    return File(path.join(tempDirPath, 'temp', 'systemp', 'key.pem'))
        .readAsBytesSync();
  }

  @override
  Map<String, dynamic>? get attrs => {};
}

/// Cargar clave privada
Uint8List loadPrivateKeyDer(String pem) {
  final cleaned = pem
      .replaceAll('-----BEGIN PRIVATE KEY-----', '')
      .replaceAll('-----END PRIVATE KEY-----', '')
      .replaceAll(RegExp(r'\s+'), '');

  return utf8.encode(cleaned); // ✅ esto sí devuelve Uint8List válido
}

/// Remover declaracion xml inicial
String removeXmlDeclaration(String xml) {
  return xml.replaceFirst(RegExp(r'^<\?xml.*?\?>\s*'), '');
}

/// Escape de datos del xml
String escapeXmlEntities(String input) {
  return input.replaceAll('&', '&amp;');
}

/// Creacion de un [XmlSignerService]
class XmlSignerService {
  /// Clave privada
  String rsaPrivateKey;

  /// Certificado publico
  String certBase64;

  /// Inicio de un [XmlSignerService]
  XmlSignerService({required this.rsaPrivateKey, required this.certBase64});

  /// Firmar xml

  Future<XmlSignerModel> firmarXml(String xmlOriginal, File outFile) async {
    try {
      var sanitizedXml = escapeXmlEntities(xmlOriginal);
      var canonical = (await canonicalXml(removeXmlDeclaration(sanitizedXml)))
          .replaceAll('\n', '')
          .replaceAll(RegExp(r'>\s+<'), '><');

      var digestValue = await calcularDigest(canonical);

      // 2) Construye el SignedXml
      final signer = SignedXml()
        // URI="" -> referencia al documento completo
        ..addReference(
          null, // no XPath
          ['http://www.w3.org/2000/09/xmldsig#enveloped-signature'],
          'http://www.w3.org/2001/04/xmlenc#sha256',
          '', // URI vacío
          digestValue, // digestValue (se calculará)
          null, // inclusiveNamespacesPrefixList
          true, // isEmptyUri = true para que use URI=""
        )
        ..keyInfoProvider = X509KeyInfoProvider(certBase64, rsaPrivateKey)
        ..canonicalizationAlgorithm =
            'http://www.w3.org/TR/2001/REC-xml-c14n-20010315'
        ..signatureAlgorithm =
            'http://www.w3.org/2001/04/xmldsig-more#rsa-sha256'

        // Y computa la firma sobre el XML sin la cabecera <?xml…?>
        ..computeSignature(canonical);

      // 3) Escribe el resultado
      await outFile.writeAsString(
          '<?xml version="1.0" encoding="utf-8"?>${signer.signedXml}');

      print('FIRMA: ${signer.signatureValue}');

      return XmlSignerModel(
          xmlStr: signer.signedXml,
          xmlFile: outFile,
          codigoSeguridad: obtenerCodigoSeguridad(signer.signatureValue));
    } catch (e) {
      rethrow;
    }
  }
}

/// Obtener codigo de seguridad desde la firma del xml
String obtenerCodigoSeguridad(String signatureValueBase64) {
  // Just take the first 6 characters (not only digits)
  return signatureValueBase64.substring(0, 6);
}

/// Verificar valor digest
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

/// Calcular Digest Value
Future<String> calcularDigest(String xml) async {
  final sha256Digest = sha256.convert(utf8.encode(xml));
  return base64.encode(sha256Digest.bytes);
}

/// Aplicar C14 al xml
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
