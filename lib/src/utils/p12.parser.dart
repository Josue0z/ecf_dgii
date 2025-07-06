import 'dart:convert';
import 'dart:io';
import 'package:basic_utils/basic_utils.dart';

class AuthCertModel {
  RSAPrivateKey privateKey;
  String certBase64;
  AuthCertModel({required this.privateKey, required this.certBase64});
}

String? extraerPrimerCert(String fullPem) {
  final regex = RegExp(
    r'-----BEGIN CERTIFICATE-----(.*?)-----END CERTIFICATE-----',
    dotAll: true,
  );
  final match = regex.firstMatch(fullPem);
  return match?.group(0)!.trim();
}

Future<AuthCertModel> getAuthP12(
    {required File cert, required String password}) async {
  var resultCerts =
      await extraerCertYKeyComoString(p12Path: cert.path, password: password);

  final privateKeyPem = resultCerts?[1];

  var key = CryptoUtils.rsaPrivateKeyFromPem(privateKeyPem!);

  final certBase64 = (resultCerts?[0])
          ?.replaceAll('-----BEGIN CERTIFICATE-----', '')
          .replaceAll('-----END CERTIFICATE-----', '')
          .replaceAll('\n', '') ??
      '';
  return AuthCertModel(privateKey: key, certBase64: certBase64);
}

Future<List<String>?> extraerCertYKeyComoString({
  required String p12Path,
  required String password,
}) async {
  final pemTemp = 'exportado_temp.pem';

  final result = await Process.run('openssl', [
    'pkcs12',
    '-in',
    p12Path,
    '-nodes',
    '-passin',
    'pass:$password',
    '-out',
    pemTemp,
    '-legacy',
  ]);

  if (result.exitCode != 0) {
    print('❌ Error al ejecutar OpenSSL:\n${result.stderr}');
    return null;
  }

  final pemContent = await File(pemTemp).readAsString(encoding: latin1);
  await File(pemTemp).delete();

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
    print('⚠️ No se pudieron extraer cert o key desde el archivo .p12');
    return null;
  }

  return [extraerPrimerCert(certPem)!.trim(), keyPem.trim()];
}
