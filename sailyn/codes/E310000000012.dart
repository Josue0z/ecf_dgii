import 'dart:io';
import 'package:ecf_dgii/src/models/ecf.model.dart';
import 'package:ecf_dgii/src/types/ecf.dart';
import 'package:ecf_dgii/src/utils/directories.dart';
import 'package:ecf_dgii/src/utils/generate.endpoint.dart';
import 'package:ecf_dgii/src/utils/p12.parser.dart';
import 'package:path/path.dart' as path;

void main() async {
  try {
    GeneratorEndPoint.envEcfType = EnvEcfType.cert;
    final cert = File(path.join(dirProject.path, 'sailyn.p12'));

    String password = 'URESA812';

    AuthCertModel authModel = await getAuthP12(cert: cert, password: password);

   
    //final now = DateTime.now();
    final fechaEmision = '01-04-2020';

    List<EcfDetailsModel> items = [
      EcfDetailsModel(
          cantidad: '5.00',
          unidadMedida: '43',
          codigos: [],
          indicadorFacturacion: '1',
          indicadorBienOServ: '2',
          nombreItem: 'Servicio domiciliario',
          descripcionItem: '',
          precioUnitario: '2000.00',
          descuentoMonto: '1000.00',
          subDescuentos: [
            SubDescuento(
                tipoSubDescuento: '\$',
                subDescuentoPorcentaje: '',
                montoSubDescuento: '500.00'),
            SubDescuento(
                tipoSubDescuento: '\$',
                subDescuentoPorcentaje: '',
                montoSubDescuento: '500.00')
          ],
          impuestosAdicionales: [],
          otraMonedaDetalles: [],
          montoItem: '9000.00'),
      EcfDetailsModel(
          cantidad: '10.00',
          unidadMedida: '43',
          codigos: [],
          indicadorFacturacion: '1',
          indicadorBienOServ: '2',
          nombreItem: 'Servicio presencial',
          descripcionItem: '',
          precioUnitario: '3000.00',
          descuentoMonto: '700.00',
          subDescuentos: [
            SubDescuento(
                tipoSubDescuento: '\$',
                subDescuentoPorcentaje: '',
                montoSubDescuento: '700.00'),
          ],
          recargoMonto: '50.00',
          subRecargos: [
            SubRecargo(
                tipoSubRecargo: '\$',
                subRecargoPorcentaje: '',
                montoSubRecargo: '50.00')
          ],
          impuestosAdicionales: [],
          otraMonedaDetalles: [],
          montoItem: '29350.00'),
    ];

    EcfModel ecf = EcfModel(
        tipoEcf: EcfType.e31,
        tempDirName: 'sailyn',
        indicadorMontoGravado: '0',
        indicadorNotaCredito: '',
        rncOtroContribuyente: '',
        numeroComprobante: 'E310000000012',
        numeroComprobanteModificado: '',
        codigoModificacion: '',
        fechaEmision: fechaEmision,
        fechaVencimiento: '31-12-2025',
        fechaEmisionNcfModificado: '',
        razonModificacion: '',
        tipoIngreso: '01',
        tipoPago: '1',
        formasDePagos: [FormaDePago('1', '45253.00')],
        sucursal: '',
        municipio: '010100',
        provincia: '010000',
        telefonoEmisor1: '809-472-7676',
        telefonoEmisor2: '809-491-1918',
        telefonoEmisor3: '',
        totalPaginas: '',
        rncEmisor: '130262812',
        razonSocialEmisor: 'DOCUMENTOS ELECTRONICOS DE 02',
        nombreComercial: 'DOCUMENTOS ELECTRONICOS DE 02',
        direccionEmisor:
            'AVE. ISABEL AGUIAR NO. 269, ZONA INDUSTRIAL DE HERRERA',
        correoEmisor:
            'DOCUMENTOSELECTRONICOSDE0612345678969789+9000000000000000000000000000001@123.COM',
        website: 'www.facturaelectronica.com',
        actividadEconomica: '',
        codigoVendedor:
            'AA0000000100000000010000000002000000000300000000050000000006',
        informacionAdicionalEmisor: '',
        rncComprador: '131880681',
        identificadorExtranjero: '',
        razonSocialComprador: 'DOCUMENTOS ELECTRONICOS DE 03',
        nombreComprador: '',
        contactoComprador: 'MARCOS LATIPLOL',
        correoComprador: 'MARCOSLATIPLOL@KKKK.COM',
        telefonoAdicional: '',
        direccionComprador:
            'CALLE JACINTO DE LA CONCHA FELIZ ESQUINA 27 DE FEBRERO,FRENTE A DOMINO',
        municipioComprador: '010100',
        provinciaComprador: '010000',
        codigoInternoComprador: '10633440',
        numeroContenedor: '',
        numeroReferencia: '',
        fechaEntrega: '10-10-2020',
        fechaOrdenCompra: '10-11-2018',
        numeroOrdenCompra: '4500352238',
        numeroFacturaInterna: '123456789016',
        numeroPedidoInterno: '123456789016',
        zonaVenta: 'NORTE',
        rutaVenta: '',
        paisDestino: '',
        conductor: '',
        documentoTransporte: '',
        ficha: '',
        placa: '',
        rutaTransporte: '',
        zonaTransporte: '',
        numeroAlbaran: '',
        totalGravado: '38350.00',
        totalGravado18: '38350.00',
        totalGravado16: '',
        totalGravadoTasa0: '',
        montoExento: '',
        totalItbis: '6903.00',
        totalItbis18: '6903.00',
        totalItbis16: '',
        totalItbisTasa0: '',
        itbis1: '18',
        itbis2: '',
        itbis3: '',
        montoTotal: '45253.00',
        montoNoFacturable: '',
        montoPeriodo: '',
        montoAvancePago: '',
        valorPagar: '',
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
        totalIsrRetencion: '',
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
