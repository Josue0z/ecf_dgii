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
    final cert = File(path.join(dirProject.path, 'ruiz.p12'));

    String password = 'URESA030';
    AuthCertModel authModel = await getAuthP12(cert: cert, password: password);

    final now = DateTime.now();
    final dateFormat = DateFormat('dd-MM-yyyy');

    final fechaEmision = '';

    List<EcfDetailsModel> items = [
      EcfDetailsModel(
          cantidad: '120.00',
          unidadMedida: '47',
          indicadorFacturacion: '4',
          indicadorBienOServ: '1',
          nombreItem: 'LECHE MILEX',
          descripcionItem: '',
          precioUnitario: '450.0000',
          descuentoMonto: '',
          subDescuentos: [],
          recargoMonto: '',
          subRecargos: [],
          otraMonedaDetalles: [],
          impuestosAdicionales: [],
          montoItem: '54000.00'),
      EcfDetailsModel(
          cantidad: '80.00',
          unidadMedida: '47',
          indicadorFacturacion: '1',
          indicadorBienOServ: '1',
          nombreItem: 'SALSA LA FAMOSA',
          descripcionItem: '',
          precioUnitario: '200.0000',
          descuentoMonto: '',
          subDescuentos: [],
          recargoMonto: '',
          subRecargos: [],
          otraMonedaDetalles: [],
          impuestosAdicionales: [],
          montoItem: '16000.00'),
      EcfDetailsModel(
          cantidad: '14.00',
          unidadMedida: '31',
          indicadorFacturacion: '1',
          indicadorBienOServ: '1',
          nombreItem: 'ACEITE CRISOL',
          descripcionItem: '',
          precioUnitario: '55.0000',
          descuentoMonto: '',
          subDescuentos: [],
          recargoMonto: '',
          subRecargos: [],
          otraMonedaDetalles: [],
          impuestosAdicionales: [],
          montoItem: '770.00'),
      EcfDetailsModel(
          cantidad: '25.00',
          unidadMedida: '47',
          indicadorFacturacion: '4',
          indicadorBienOServ: '1',
          nombreItem: 'LECHE',
          descripcionItem: '',
          precioUnitario: '65.0000',
          descuentoMonto: '',
          subDescuentos: [],
          recargoMonto: '',
          subRecargos: [],
          otraMonedaDetalles: [],
          impuestosAdicionales: [],
          montoItem: '1625.00'),
      EcfDetailsModel(
          cantidad: '35.00',
          unidadMedida: '47',
          indicadorFacturacion: '2',
          indicadorBienOServ: '1',
          nombreItem: 'SALSA',
          descripcionItem: '',
          precioUnitario: '25.0000',
          descuentoMonto: '',
          subDescuentos: [],
          recargoMonto: '',
          subRecargos: [],
          otraMonedaDetalles: [],
          impuestosAdicionales: [],
          montoItem: '875.00'),
      EcfDetailsModel(
          cantidad: '2.00',
          unidadMedida: '43',
          indicadorFacturacion: '1',
          indicadorBienOServ: '1',
          nombreItem: 'TV LG 57"',
          descripcionItem: '',
          precioUnitario: '57000.0000',
          descuentoMonto: '',
          subDescuentos: [],
          recargoMonto: '',
          subRecargos: [],
          otraMonedaDetalles: [],
          impuestosAdicionales: [],
          montoItem: '114000.00'),
      EcfDetailsModel(
          cantidad: '1.00',
          unidadMedida: '43',
          indicadorFacturacion: '1',
          indicadorBienOServ: '1',
          nombreItem: 'LAVADORA-SECADORA  WESTINGHOUSE',
          descripcionItem: '',
          precioUnitario: '75000.0000',
          descuentoMonto: '',
          subDescuentos: [],
          recargoMonto: '',
          subRecargos: [],
          otraMonedaDetalles: [],
          impuestosAdicionales: [],
          montoItem: '75000.00'),
      EcfDetailsModel(
          cantidad: '1.00',
          unidadMedida: '43',
          indicadorFacturacion: '1',
          indicadorBienOServ: '1',
          nombreItem: 'ESTUFA MABE',
          descripcionItem: '',
          precioUnitario: '45000.0000',
          descuentoMonto: '',
          subDescuentos: [],
          recargoMonto: '',
          subRecargos: [],
          otraMonedaDetalles: [],
          impuestosAdicionales: [],
          montoItem: '45000.00'),
      EcfDetailsModel(
          cantidad: '1.00',
          unidadMedida: '43',
          indicadorFacturacion: '1',
          indicadorBienOServ: '1',
          nombreItem: 'LAPICES',
          descripcionItem: '',
          precioUnitario: '35000.0000',
          descuentoMonto: '',
          subDescuentos: [],
          recargoMonto: '',
          subRecargos: [],
          otraMonedaDetalles: [],
          impuestosAdicionales: [],
          montoItem: '35000.00'),
    ];

    EcfModel ecf = EcfModel(
        tipoEcf: EcfType.e32,
        tempDirName: 'ruiz',
        indicadorMontoGravado: '0',
        indicadorNotaCredito: '',
        rncOtroContribuyente: '',
        numeroComprobante: 'E320000000002',
        numeroComprobanteModificado: '',
        codigoModificacion: '',
        fechaEmision: '02-04-2020',
        fechaVencimiento: '',
        fechaEmisionNcfModificado: '',
        razonModificacion: '',
        tipoIngreso: '01',
        tipoPago: '1',
        formasDePagos: [FormaDePago('1', '476150.00')],
        sucursal: '',
        municipio: '010100',
        provincia: '010000',
        telefonoEmisor1: '809-472-7676',
        telefonoEmisor2: '809-491-1918',
        telefonoEmisor3: '',
        totalPaginas: '',
        rncEmisor: '00108998030',
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
        totalGravado: '266500.00',
        totalGravado18: '150500.00',
        totalGravado16: '116000.00',
        totalGravadoTasa0: '',
        montoExento: '164000.00',
        totalItbis: '45650.00',
        totalItbis18: '27090.00',
        totalItbis16: '18560.00',
        totalItbisTasa0: '',
        itbis1: '18',
        itbis2: '16',
        itbis3: '',
        montoTotal: '476150.00',
        montoNoFacturable: '',
        montoPeriodo: '476150.00',
        montoAvancePago: '',
        valorPagar: '476150.00',
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
    var filePdf = File(path.join(tempDirPath, 'ruiz', 'pdfs',
        '${ecf.rncEmisor}${ecf.numeroComprobante}.PDF'));

    await filePdf.create(recursive: true);
    await filePdf.writeAsBytes(await doc.save());
    print(ecf.uriEcf);
    print(ecf.trackId);
    print(ecf.token);

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
