import 'package:ecf_dgii/src/types/endpoints.dart';
import 'package:ecf_dgii/src/types/ecf.dart';

class GeneratorEndPoint {
  static EnvEcfType envEcfType = EnvEcfType.testEcf;
  static String envName = 'testecf';
  GeneratorEndPoint._();

  static Uri getEndPoint(String endPointName) {
    if (envEcfType == EnvEcfType.testEcf) {
      envName = 'testecf';
    }
    if (envEcfType == EnvEcfType.cert) {
      envName = 'cert';
    }
    if (envEcfType == EnvEcfType.ecf) {
      envName = 'ecf';
    }
    return Uri.parse('$kBaseEcfUrl/$envName$endPointName');
  }
}
