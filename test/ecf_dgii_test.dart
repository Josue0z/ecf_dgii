import 'dart:io';

import 'package:ecf_dgii/ecf_dgii.dart';

import 'package:ecf_dgii/src/utils/directories.dart';
import 'package:intl/intl.dart';
import 'package:path/path.dart' as path;

void main() async {
  try {
    //GeneratorEndPoint.envEcfType = EnvEcfType.cert;
    final cert = File(path.join(dirProject.path, 'CERTIFICADO-JPU-URESA.p12'));

    String password = 'INES1037';

    AuthCertModel authModel = await getAuthP12(cert: cert, password: password);

    final now = DateTime.now();
    final fechaHora = DateFormat('dd-MM-yyyy').format(now);

    EcfModel ecf = EcfModel(
        tipoEcf: EcfType.e31,
        tipoIngreso: '01',
        tipoPago: '1',
        formaPago: '2',
        rncEmisor: '101675489',
        razonSocialEmisor: 'DOCUMENTOS ELECTRONICOS DE 02',
        nombreComercial: 'DOCUMENTOS ELECTRONICOS DE 02',
        sucursal: '#e',
        direccionEmisor:
            'AVE. ISABEL AGUIAR NO. 269, ZONA INDUSTRIAL DE HERRERA',
        municipio: '010100',
        provincia: '010000',
        telefonoEmisor1: '809-472-7676',
        telefonoEmisor2: '809-491-1918',
        telefonoEmisor3: '',
        correoEmisor: 'DOCUMENTOSELECTRONICOSDE0612345678969789@123.COM',
        website: 'www.facturaelectronica.com',
        codigoVendedor: 'AA00000001000000050000000006',
        numeroFacturaInterna: '123456789016',
        numeroPedidoInterno: '123456789016',
        zonaVenta: 'NORTE',
        informacionAdicionalEmisor: 'string',
        rncComprador: '124003091',
        razonSocialComprador: 'KENTUCKY FOODS GROUP LIMITED',
        nombreComprador: 'KENTUCKY FOODS GROUP LIMITED',
        contactoComprador: 'MARCOS LATIPLOL',
        correoComprador: 'MARCOSLATIPLOL@KKKK.COM',
        direccionComprador:
            'CALLE JACINTO DE LA CONCHA FELIZ ESQUINA 27 DE FEBRERO,FRENTE A DOMINO',
        municipioComprador: '010100',
        provinciaComprador: '010000',
        fechaEntrega: fechaHora,
        fechaOrdenCompra: fechaHora,
        numeroOrdenCompra: '4500352238',
        codigoInternoComprador: '10633440',
        fechaEmision: fechaHora,
        fechaVencimiento: '31-12-2025',
        numeroComprobante: 'E310000000057',
        montoTotal: '139787.78',
        totalItbis: '21323.56',
        totalItbis16: '0.00',
        totalItbis18: '21323.56',
        montoNeto: '118464.21',
        montoNeto18: '118464.21',
        montoNeto16: '0.00',
        montoExento: '0.00',
        montoPagado: '139787.78',
        bancoPago: 'Banco Popular Dominicano',
        montoRetenidoIsr: '0.00',
        porcentajeRetencionIsr: '0',
        baseImponibleIsr: '0.00',
        montoRetenidoItbis: '0.00',
        porcentajeRetencionItbis: '0',
        baseImponibleItbis: '0.00',
        indicadorMontoGravado: '0',
        actividadEconomica: 'LEGALES',
        terminoPago: '4',
        formasDePagos: [FormaDePago('2', '139787.77')],
        privateKey: authModel.privateKey,
        certBase64: authModel.certBase64);

    List<EcfDetailsModel> items = [
      EcfDetailsModel(
          cantidad: '1',
          tipoCodigo: 'S',
          codigoItem: '01',
          indicadorBienOServ: '2',
          unidadMedida: '1',
          tipoImpuesto: '1',
          tasaImpuesto: '18',
          descripcion: 'IGUALA R LOPEZ 04-2025',
          precioUnitario: '118464.21',
          montoItem: '118464.21',
          itbis: '21323.56'),
    ];
    ecf.items.addAll(items);
    await ecf.downloadEcfSeed();
    await ecf.validarSign();
    await ecf.signer();
    await ecf.sendEcfSigned();
    //await ecf.getEcfStatusData();
    //await ecf.sendAprobacionComercialEcf();
    print(ecf.uriEcf);
  } catch (e) {
    print('⚠️ Error: $e');
  }
}
