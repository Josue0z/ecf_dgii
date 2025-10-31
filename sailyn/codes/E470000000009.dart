import 'dart:io';
import 'package:ecf_dgii/src/models/ecf.model.dart';
import 'package:ecf_dgii/src/types/ecf.dart';
import 'package:ecf_dgii/src/utils/directories.dart';
import 'package:ecf_dgii/src/utils/generate.endpoint.dart';
import 'package:ecf_dgii/src/utils/p12.parser.dart';
import 'package:intl/intl.dart';
import 'package:path/path.dart' as path;

void main() async {
  try {
    GeneratorEndPoint.envEcfType = EnvEcfType.cert;
    final cert = File(path.join(dirProject.path, 'sailyn.p12'));

    String password = 'URESA812';

    AuthCertModel authModel = await getAuthP12(cert: cert, password: password);
  final now = DateTime.now();
    final dateFormat = DateFormat('dd-MM-yyyy');
    final fechaEmision = '01-04-2020';

    List<EcfDetailsModel> items = [
      EcfDetailsModel(
          cantidad: '60.00',
          unidadMedida: '19',
          indicadorFacturacion: '4',
          indicadorBienOServ: '2',
          nombreItem: 'Asesoria Legal P/H',
          descripcionItem: '',
          precioUnitario: '450.0000',
          descuentoMonto: '',
          subDescuentos: [],
          impuestosAdicionales: [],
          retencion: Retencion(
              indicadorAgenteRetencionoPercepcion: '1',
              montoITBISRetenido: '',
              montoISRRetenido: '7290.00'),
          otraMonedaDetalles: [],
          montoItem: '27000.00'),
      EcfDetailsModel(
          cantidad: '70.00',
          unidadMedida: '19',
          indicadorFacturacion: '4',
          indicadorBienOServ: '2',
          nombreItem: 'Asesoria Legal P/H',
          descripcionItem: '',
          precioUnitario: '200.0000',
          descuentoMonto: '',
          subDescuentos: [],
          impuestosAdicionales: [],
          retencion: Retencion(
              indicadorAgenteRetencionoPercepcion: '1',
              montoITBISRetenido: '',
              montoISRRetenido: '3780.00'),
          otraMonedaDetalles: [],
          montoItem: '14000.00'),
      EcfDetailsModel(
          cantidad: '100.00',
          unidadMedida: '19',
          indicadorFacturacion: '4',
          indicadorBienOServ: '2',
          nombreItem: 'Asesoria Legal P/H',
          descripcionItem: '',
          precioUnitario: '250.0000',
          descuentoMonto: '',
          subDescuentos: [],
          impuestosAdicionales: [],
          retencion: Retencion(
              indicadorAgenteRetencionoPercepcion: '1',
              montoITBISRetenido: '',
              montoISRRetenido: '6750.00'),
          otraMonedaDetalles: [],
          montoItem: '25000.00'),
    ];

    EcfModel ecf = EcfModel(
        tipoEcf: EcfType.e47,
        tempDirName: 'sailyn',
        indicadorMontoGravado: '',
        numeroComprobante: 'E470000000009',
        codigoModificacion: '',
        fechaEmision: fechaEmision,
        fechaVencimiento: '31-12-2025',
        fechaEmisionNcfModificado: '',
        razonModificacion: '',
        tipoIngreso: '',
        tipoPago: '1',
        formasDePagos: [FormaDePago('1', '66000.00')],
        sucursal: '',
        direccionEmisor:
            'AVE. ISABEL AGUIAR NO. 269, ZONA INDUSTRIAL DE HERRERA',
        municipio: '010100',
        provincia: '010000',
        telefonoEmisor1: '809-472-7676',
        telefonoEmisor2: '809-491-1918',
        telefonoEmisor3: '',
        totalPaginas: '',
        rncEmisor: '130262812',
        razonSocialEmisor: 'DOCUMENTOS ELECTRONICOS DE 02',
        nombreComercial: 'DOCUMENTOS ELECTRONICOS DE 02',
        correoEmisor:
            'DOCUMENTOSELECTRONICOSDE0612345678969789+9000000000000000000000000000001@123.COM',
        website: 'www.facturaelectronica.com',
        actividadEconomica: '',
        codigoVendedor: '',
        informacionAdicionalEmisor: '',
        rncComprador: '',
        identificadorExtranjero: '350555123',
        razonSocialComprador: 'DOCUMENTOS ELECTRONICOS DE 03',
        nombreComprador: '',
        contactoComprador: '',
        correoComprador: '',
        telefonoAdicional: '',
        direccionComprador: '',
        municipioComprador: '',
        provinciaComprador: '',
        codigoInternoComprador: '',
        fechaEntrega: '',
        fechaOrdenCompra: '',
        numeroOrdenCompra: '',
        numeroFacturaInterna: '123456789016',
        numeroPedidoInterno: '123456789016',
        zonaVenta: '',
        rutaVenta: '',
        paisDestino: '',
        conductor: '',
        documentoTransporte: '',
        ficha: '',
        placa: '',
        rutaTransporte: '',
        zonaTransporte: '',
        numeroAlbaran: '',
        totalGravado: '',
        totalGravado18: '',
        totalGravado16: '',
        totalGravadoTasa0: '',
        montoExento: '66000.00',
        totalItbis: '',
        totalItbis18: '',
        totalItbis16: '',
        totalItbisTasa0: '',
        itbis1: '',
        itbis2: '',
        itbis3: '',
        montoTotal: '66000.00',
        montoPeriodo: '66000.00',
        montoAvancePago: '',
        valorPagar: '66000.00',
        tipoMoneda: '',
        tipoCambio: '',
        montoGravadoTotalOtraMoneda: '',
        montoGravadoTotalOtraMoneda1: '',
        montoGravadoTotalOtraMoneda2: '',
        montoGravadoTotalOtraMoneda3: '',
        totalItbisOtraMoneda: '',
        totalItbis1OtraMoneda: '',
        totalItbis2OtraMoneda: '',
        totalItbis3OtraMoneda: '',
        montoExentoOtraMoneda: '',
        montoTotalOtraMoneda: '',
        totalItbisRetencion: '',
        totalIsrRetencion: '17820.00',
        montoImpuestoAdicional: '',
        impuestosAdicionales: [],
        terminoPago: '',
        bancoPago: '',
        paginas: [],
        items: items,
        privateKey: authModel.privateKey,
        certBase64: authModel.certBase64);
    await ecf.descargarSemilla();
    await ecf.validarSemilla();
    await ecf.firmar();
    await ecf.enviarEcf();

    var doc = await ecf.generarPdfFactura();
    var filePdf = File(path.join(tempDirPath, 'sailyn', 'pdfs',
        '${ecf.rncEmisor}${ecf.numeroComprobante}.PDF'));

    await filePdf.create(recursive: true);
    await filePdf.writeAsBytes(await doc.save());
    print(ecf.uriEcf);
    print(ecf.trackId);
    print(ecf.token);
    print(filePdf.path);
    print(ecf.ecfFile?.path);

    /* var pathFile =
        '/Users/josue/development/proyectos/ecf_dgii/temp_4/101675489E310000000950.xml';
    var fileName = path.basenameWithoutExtension(pathFile);
    var doc = await generarPdfDesdeXmlFirmado(pathFile,
        items: [],
        fechaVencimiento: '31-12-2025',
        url:
            'https://ecf.dgii.gov.do/CerteCF/ConsultaTimbre?RncEmisor=101675489&RncComprador=131880681&ENCF=E310000000950&FechaEmision=23-07-2025&MontoTotal=154003.47&FechaFirma=23-07-2025%2011:51:23&CodigoSeguridad=an6Kc0');

    fileName = fileName.replaceFirst('ECF_', '');
    var filePdf =
        File(path.join(dirProject.path, 'temp_6', 'pdfs', '$fileName.PDF'));

    await filePdf.create(recursive: true);
    await filePdf.writeAsBytes(await doc.save());*/
  } catch (e) {
    print('⚠️ Error: $e');
  }
}
