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
       kE310000000034.copyWith(numeroComprobante: 'E310000000400',razonSocialEmisor: kEmisorNombre, nombreComercial: kEmisorNombre),
       kE310000000034.copyWith(numeroComprobante: 'E310000000401',razonSocialEmisor: kEmisorNombre, nombreComercial: kEmisorNombre),
       kE310000000034.copyWith(numeroComprobante: 'E310000000402',razonSocialEmisor: kEmisorNombre, nombreComercial: kEmisorNombre),
       kE310000000034.copyWith(numeroComprobante: 'E310000000403',razonSocialEmisor: kEmisorNombre, nombreComercial: kEmisorNombre),
       kE320000000006.copyWith(numeroComprobante: 'E320000000400',razonSocialEmisor: kEmisorNombre, nombreComercial: kEmisorNombre),
       kE320000000006.copyWith(numeroComprobante: 'E320000000401',razonSocialEmisor: kEmisorNombre, nombreComercial: kEmisorNombre),
       kE320000000011.copyWith(numeroComprobante: 'E320000000500',razonSocialEmisor: kEmisorNombre, nombreComercial: kEmisorNombre),
       kE320000000011.copyWith(numeroComprobante: 'E320000000501',razonSocialEmisor: kEmisorNombre, nombreComercial: kEmisorNombre),
       kE320000000011.copyWith(numeroComprobante: 'E320000000502',razonSocialEmisor: kEmisorNombre, nombreComercial: kEmisorNombre),
       kE320000000011.copyWith(numeroComprobante: 'E320000000503',razonSocialEmisor: kEmisorNombre, nombreComercial: kEmisorNombre),
       kE410000000001.copyWith(numeroComprobante: 'E410000000400',razonSocialEmisor: kEmisorNombre, nombreComercial: kEmisorNombre),
       kE410000000001.copyWith(numeroComprobante: 'E410000000401',razonSocialEmisor: kEmisorNombre, nombreComercial: kEmisorNombre),
       kE430000000009.copyWith(numeroComprobante: 'E430000000400',razonSocialEmisor: kEmisorNombre, nombreComercial: kEmisorNombre),
       kE430000000009.copyWith(numeroComprobante: 'E430000000401',razonSocialEmisor: kEmisorNombre, nombreComercial: kEmisorNombre),
       kE440000000008.copyWith(numeroComprobante: 'E440000000400',razonSocialEmisor: kEmisorNombre, nombreComercial: kEmisorNombre),
       kE440000000008.copyWith(numeroComprobante: 'E440000000401',razonSocialEmisor: kEmisorNombre, nombreComercial: kEmisorNombre),
       kE450000000002.copyWith(numeroComprobante: 'E450000000400',razonSocialEmisor: kEmisorNombre, nombreComercial: kEmisorNombre),
       kE450000000002.copyWith(numeroComprobante: 'E450000000401',razonSocialEmisor: kEmisorNombre, nombreComercial: kEmisorNombre),
       kE460000000001.copyWith(numeroComprobante: 'E460000000400',razonSocialEmisor: kEmisorNombre, nombreComercial: kEmisorNombre),
       kE460000000001.copyWith(numeroComprobante: 'E460000000401',razonSocialEmisor: kEmisorNombre, nombreComercial: kEmisorNombre),
       kE470000000001.copyWith(numeroComprobante: 'E470000000400',razonSocialEmisor: kEmisorNombre, nombreComercial: kEmisorNombre),
       kE470000000001.copyWith(numeroComprobante: 'E470000000401',razonSocialEmisor: kEmisorNombre, nombreComercial: kEmisorNombre),
       kE330000000001.copyWith(numeroComprobante: 'E330000000400',numeroComprobanteModificado: 'E320000000400',razonSocialEmisor: kEmisorNombre, nombreComercial: kEmisorNombre),
       kE340000000002.copyWith(numeroComprobante: 'E340000000400',numeroComprobanteModificado: 'E310000000400',razonSocialEmisor: kEmisorNombre, nombreComercial: kEmisorNombre),
       kE340000000002.copyWith(numeroComprobante: 'E340000000401',numeroComprobanteModificado: 'E310000000401',razonSocialEmisor: kEmisorNombre, nombreComercial: kEmisorNombre),

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
