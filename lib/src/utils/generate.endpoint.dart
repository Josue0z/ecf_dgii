import 'package:ecf_dgii/ecf_dgii.dart';

class GeneratorEndPoint {
  static EnvEcfType envEcfType = EnvEcfType.testEcf;
  static String envName = 'testecf';
  GeneratorEndPoint._();

  static Uri getEndPoint(String endPointName, {EcfType ecfType = EcfType.e31}) {
    String baseUrl = kBaseEcfUrl;

    if (ecfType == EcfType.e32) {
      baseUrl = kBaseUrlFc;
    }

    if (envEcfType == EnvEcfType.testEcf) {
      envName = 'testecf';
    }
    if (envEcfType == EnvEcfType.cert) {
      envName = 'certecf';
    }
    if (envEcfType == EnvEcfType.ecf) {
      envName = 'ecf';
    }

    return Uri.parse('$baseUrl/$envName$endPointName');
  }
}
