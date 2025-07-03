import 'dart:io';
import 'package:ecf_dgii/ecf_dgii.dart';
import 'package:ecf_dgii/src/utils/directories.dart';
import 'package:path/path.dart' as path;

void main() async {
  try {
    final cert = File(path.join(dirProject.path, 'certificado.p12'));

    AuthCertModel authModel =
        await getAuthP12(cert: cert, password: 'INES1037');

    EcfModel ecf = EcfModel(
        tipoEcf: EcfType.e31,
        rncEmisor: '101675489',
        razonSocialEmisor: 'UREÑA LORENZO &amp; ASOC',
        rncComprador: '131111111',
        fechaEmision: DateTime.now(),
        numeroComprobante: 'E310000000031',
        montoTotal: '52500.00',
        totalItbis: '2500.00',
        privateKey: authModel.privateKey,
        certBase64: authModel.certBase64);

    List<EcfDetailsModel> items = [
      EcfDetailsModel(
          cantidad: '1',
          descripcion: 'IGUALA R LOPEZ 04-2025',
          precioUnitario: '17500.00',
          itbis: '833.33'),
      EcfDetailsModel(
          cantidad: '1',
          descripcion: 'IGUALA R LOPEZ 05-2025',
          precioUnitario: '17500.00',
          itbis: '833.33'),
      EcfDetailsModel(
          cantidad: '1',
          descripcion: 'IGUALA R LOPEZ 06-2025',
          precioUnitario: '17500.00',
          itbis: '833.33')
    ];
    ecf.items.addAll(items);
    await ecf.downloadEcfSeed();
    await ecf.sendEcfSeed();
    await ecf.signer();
    await ecf.sendEcfSigned();

    print(ecf.ecfSignXml);

    await ecf.seedFile?.delete();
    await ecf.ecfFile?.delete();
  } catch (e) {
    print('⚠️ Error: $e');
  }
}
