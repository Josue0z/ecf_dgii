import 'package:ecf_dgii/ecf_dgii.dart';

class GeneratorEndPoint {
  static EnvEcfType envEcfType = EnvEcfType.testEcf;
  static String envName = 'testecf';
  GeneratorEndPoint._();

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
