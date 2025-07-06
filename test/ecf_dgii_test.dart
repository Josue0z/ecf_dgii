import 'dart:io';

import 'package:ecf_dgii/ecf_dgii.dart';

import 'package:ecf_dgii/src/utils/directories.dart';
import 'package:path/path.dart' as path;

void main() async {
  try {
    GeneratorEndPoint.envEcfType = EnvEcfType.cert;
    final cert =
        File(path.join(dirProject.path, '20250609-1517569-ATBJZGHSK.p12'));

    String password = 'INES1037';

    AuthCertModel authModel = await getAuthP12(cert: cert, password: password);

    EcfModel ecf = EcfModel(
        tipoEcf: EcfType.e31,
        tipoIngreso: '01',
        tipoPago: '1',
        rncEmisor: '101675489',
        razonSocialEmisor: 'DOCUMENTOS ELECTRONICOS DE 02',
        rncComprador: '131880681',
        nombreComprador: 'DOCUMENTOS ELECTRONICOS DE 03',
        fechaEmision: '01-04-2020',
        numeroComprobante: 'E310000000003',
        montoTotal: '139787.77',
        totalItbis: '21323.56',
        totalItbis16: '0.00',
        totalItbis18: '21323.56',
        montoNeto: '118464.21',
        montoNeto18: '118464.21',
        montoNeto16: '0.00',
        montoExento: '0.00',
        montoPagado: '139787.77',
        privateKey: authModel.privateKey,
        certBase64: authModel.certBase64,
        certFile: cert,
        password: password);

    List<EcfDetailsModel> items = [
      EcfDetailsModel(
          cantidad: '1',
          descripcion: 'IGUALA R LOPEZ 04-2025',
          precioUnitario: '118464.21',
          itbis: '21323.56'),
    ];
    ecf.items.addAll(items);
    await ecf.downloadEcfSeed();
    await ecf.validarSign();
    await ecf.signer();
    await ecf.sendEcfSigned();
    //await ecf.sendAprobacionComercialEcf();

    print(ecf.ecfSignXml);
    print(ecf.codigoSeguridad);
  } catch (e) {
    print('⚠️ Error: $e');
  }
}
