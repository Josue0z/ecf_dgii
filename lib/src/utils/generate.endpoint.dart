import 'package:ecf_dgii/ecf_dgii.dart';

class GeneratorEndPoint {
  static EnvEcfType envEcfType = EnvEcfType.testEcf;
  static String envName = 'testecf';
  GeneratorEndPoint._();

  static Uri getEndPoint(String endPointName) {
    if (envEcfType == EnvEcfType.testEcf) {
      envName = 'testecf';
    }
    if (envEcfType == EnvEcfType.cert) {
      envName = 'certecf';
    }
    if (envEcfType == EnvEcfType.ecf) {
      envName = 'ecf';
    }
    return Uri.parse('$kBaseEcfUrl/$envName$endPointName');
  }
}
