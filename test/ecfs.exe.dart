import 'dart:io';
import 'package:ecf_dgii/codes/E310000000003.dart';
import 'package:ecf_dgii/codes/E310000000005.dart';
import 'package:ecf_dgii/codes/E310000000006.dart';
import 'package:ecf_dgii/codes/E310000000007.dart';
import 'package:ecf_dgii/codes/E310000000010.dart';
import 'package:ecf_dgii/codes/E310000000034.dart';
import 'package:ecf_dgii/codes/E320000000001.dart';
import 'package:ecf_dgii/codes/E320000000002.dart';
import 'package:ecf_dgii/codes/E320000000006.dart';
import 'package:ecf_dgii/codes/E320000000011.dart';
import 'package:ecf_dgii/codes/E320000000012.dart';
import 'package:ecf_dgii/codes/E320000000014.dart';
import 'package:ecf_dgii/codes/E320000000015.dart';
import 'package:ecf_dgii/codes/E330000000001.dart';
import 'package:ecf_dgii/codes/E340000000002.dart';
import 'package:ecf_dgii/codes/E340000000015.dart';
import 'package:ecf_dgii/codes/E340000000016.dart';
import 'package:ecf_dgii/codes/E410000000001.dart';
import 'package:ecf_dgii/codes/E410000000010.dart';
import 'package:ecf_dgii/codes/E430000000001.dart';
import 'package:ecf_dgii/codes/E430000000009.dart';
import 'package:ecf_dgii/codes/E430000000010.dart';
import 'package:ecf_dgii/codes/E440000000007.dart';
import 'package:ecf_dgii/codes/E440000000008.dart';
import 'package:ecf_dgii/codes/E440000000009.dart';
import 'package:ecf_dgii/codes/E450000000001.dart';
import 'package:ecf_dgii/codes/E450000000002.dart';
import 'package:ecf_dgii/codes/E450000000009.dart';
import 'package:ecf_dgii/codes/E460000000001.dart';
import 'package:ecf_dgii/codes/E460000000009.dart';
import 'package:ecf_dgii/codes/E470000000001.dart';
import 'package:ecf_dgii/codes/E470000000007.dart';
import 'package:ecf_dgii/settings.dart';
import 'package:ecf_dgii/codes/E310000000001.dart';
import 'package:ecf_dgii/codes/E310000000002.dart';
import 'package:ecf_dgii/src/models/ecf.model.dart';
import 'package:ecf_dgii/src/types/ecf.dart';
import 'package:ecf_dgii/src/utils/directories.dart';
import 'package:ecf_dgii/src/utils/generate.endpoint.dart';
import 'package:ecf_dgii/src/utils/p12.parser.dart';
import 'package:ecf_dgii/src/utils/xml.signer.dart';
import 'package:path/path.dart' as path;

void main() async {
  try {
    GeneratorEndPoint.envEcfType = EnvEcfType.cert;
    // Sustitución de valores estáticos
    final cert = File(path.join(dirProject.path, kCertName)); // antes: 'monalisa.p12'
    String password = kCertPassword;                          // antes: 'URESA624'
    AuthCertModel authModel = await getAuthP12(cert: cert, password: password);

    List<EcfModel> ecfs = [
       kE310000000006,
       kE310000000007,
       kE310000000010,
       kE310000000034,
       kE320000000002,
       kE320000000006,
       kE320000000011,
       kE320000000012,
       kE320000000014,
       kE320000000015,
       kE410000000001,
       kE410000000010,
       kE430000000009,
       kE430000000010,
       kE440000000008,
       kE440000000009,
       kE450000000002,
       kE450000000009,
       kE460000000001,
       kE460000000009,
       kE470000000001,
       kE470000000007,
       kE330000000001,
       kE340000000002,
       kE340000000015

    ];

    for(int i = 0; i < ecfs.length;i++){
      var ecf = ecfs[i];
      ecf.privateKey = authModel.privateKey;
      ecf.certBase64 = authModel.certBase64;
      ecf.signerService = XmlSignerService(rsaPrivateKey: ecf.privateKey, certBase64: ecf.certBase64);
     var estado;
      await ecf.descargarSemilla();
      await ecf.validarSemilla();
      await ecf.firmar();
      estado = await ecf.enviarEcf();

    var doc = await ecf.generarPdfFactura();
    var filePdf = File(path.join(tempDirPath, kTempDirName, 'pdfs',
        '${ecf.rncEmisor}${ecf.numeroComprobante}.PDF'));

    await filePdf.create(recursive: true);
    await filePdf.writeAsBytes(await doc.save());
  

    if(ecf.esResumenE32 == false){
       estado = await ecf.obtenerEcfEstadoDatos();
    }

    print(ecf.uriEcf);
    print(ecf.trackId);
    print(ecf.token);
    print(estado);
    print(ecf.ecfFile?.path);
    print(filePdf.path);
    await Future.delayed(const Duration(seconds: 5));
    }

  
  } catch (e) {
    print('⚠️ Error: $e');
  }
}
