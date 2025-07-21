import 'package:ecf_dgii/ecf_dgii.dart';

/// Generador de URIS de la DGII
class GeneratorEndPoint {
  /// Entorno de ejecucion
  static EnvEcfType envEcfType = EnvEcfType.testEcf;

  /// Entorno de ejecucion en formato [String]
  static String envName = 'testecf';
  GeneratorEndPoint._();

  /// Generar URI de la DGII

  static Uri getEndPoint(String endPointName, {bool esResumen = false}) {
    String baseUrl = kBaseEcfUrl;

    if (esResumen) {
      baseUrl = kBaseUrlFc;
    }

    if (envEcfType == EnvEcfType.testEcf) {
      envName = 'TesteCF';
    }
    if (envEcfType == EnvEcfType.cert) {
      envName = 'CerteCF';
    }
    if (envEcfType == EnvEcfType.ecf) {
      envName = 'Ecf';
    }

    return Uri.parse('$baseUrl/$envName$endPointName');
  }
}
