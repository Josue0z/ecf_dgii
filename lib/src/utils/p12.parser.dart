import 'dart:convert';
import 'dart:io';
import 'package:path/path.dart' as path;
import 'package:ecf_dgii/src/utils/directories.dart';

/// Creacion de un [AuthCertModel]
class AuthCertModel {
  /// Clave Privada
  String privateKey;

  /// Certificado Publico
  String certBase64;

  /// Inicio de un [AuthCertModel]
  AuthCertModel({required this.privateKey, required this.certBase64});
}

/// Extraer primer cert
String? extraerPrimerCert(String fullPem) {
  try {
    final regex = RegExp(
      r'-----BEGIN CERTIFICATE-----(.*?)-----END CERTIFICATE-----',
      dotAll: true,
    );
    final match = regex.firstMatch(fullPem);
    var group = match?.group(0);

    if (group == null) {
      throw '❌ No se pudo extraer el certificado del archivo .p12 ya que no contiene un grupo valido';
    }
    return group.trim();
  } catch (e) {
    rethrow;
  }
}

/// Autenticar certificado y retornar un [AuthCertModel]
Future<AuthCertModel> getAuthP12(
    {required File cert, required String password}) async {
  try {
    var resultCerts =
        await extraerCertYKeyComoString(p12Path: cert.path, password: password);
    if (resultCerts == null || resultCerts.length < 2) {
      throw '❌ No se pudo extraer certificado y clave privada';
    }
    final privateKeyPem = resultCerts[1];

    final certBase64 = (resultCerts[0])
        .replaceAll('-----BEGIN CERTIFICATE-----', '')
        .replaceAll('-----END CERTIFICATE-----', '')
        .replaceAll('\n', '');
    return AuthCertModel(privateKey: privateKeyPem, certBase64: certBase64);
  } catch (e) {
    rethrow;
  }
}

/// Extrear certificado
Future<List<String>?> extraerCertYKeyComoString({
  required String p12Path,
  required String password,
}) async {
  try {
    final pemTemp = 'exportado_temp.pem';

    var pemFile = File(path.join(tempDirPath, pemTemp));

    await pemFile.create(recursive: true);

    final result = await Process.run('openssl', [
      'pkcs12',
      '-in',
      p12Path,
      '-nodes',
      '-passin',
      'pass:$password',
      '-out',
      pemFile.path,
      '-legacy',
    ]);

    if (result.exitCode != 0) {
      throw '❌ Error al ejecutar OpenSSL:\n${result.stderr}';
    }

    final pemContent = await pemFile.readAsString(encoding: latin1);
    await pemFile.delete();

    final lines = pemContent.split('\n');
    final certBuffer = StringBuffer();
    final keyBuffer = StringBuffer();

    String? current;
    for (final line in lines) {
      if (line.contains('BEGIN CERTIFICATE')) {
        current = 'cert';
      } else if (line.contains('BEGIN PRIVATE KEY') ||
          line.contains('BEGIN RSA PRIVATE KEY')) {
        current = 'key';
      }

      if (current == 'cert') certBuffer.writeln(line);
      if (current == 'key') keyBuffer.writeln(line);

      if (line.contains('END CERTIFICATE') ||
          line.contains('END PRIVATE KEY') ||
          line.contains('END RSA PRIVATE KEY')) {
        current = null;
      }
    }

    final certPem = certBuffer.toString().trim();
    final keyPem = keyBuffer.toString().trim();

    if (certPem.isEmpty || keyPem.isEmpty) {
      throw '⚠️ No se pudieron extraer cert o key desde el archivo .p12';
    }

    // 📂 Guardar key.pem en el path esperado
    final keyPath = path.join(tempDirPath, 'temp', 'systemp', 'key.pem');
    await Directory(path.dirname(keyPath)).create(recursive: true);
    await File(keyPath).writeAsString(keyPem, encoding: latin1);
    var certExtracted = extraerPrimerCert(certPem);

    if (certExtracted == null) {
      throw '⚠️ No se pudo extraer el certificado del archivo .p12';
    }

    return [certExtracted.trim(), keyPem.trim()];
  } catch (e) {
    rethrow;
  }
}
