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
          cantidad: '20.00',
          unidadMedida: '46',
          codigos: [],
          indicadorFacturacion: '4',
          indicadorBienOServ: '1',
          nombreItem: 'ARROZ LA GARZA',
          descripcionItem: '',
          precioUnitario: '1500.0000',
          descuentoMonto: '',
          subDescuentos: [],
          impuestosAdicionales: [],
          otraMonedaDetalles: [],
          montoItem: '30000.00'),
      EcfDetailsModel(
          cantidad: '40.00',
          unidadMedida: '46',
          codigos: [],
          indicadorFacturacion: '2',
          indicadorBienOServ: '1',
          nombreItem: 'AZUCAR CREMA',
          descripcionItem: '',
          precioUnitario: '1300.0000',
          descuentoMonto: '',
          subDescuentos: [],
          impuestosAdicionales: [],
          otraMonedaDetalles: [],
          montoItem: '52000.00'),
      EcfDetailsModel(
          cantidad: '50.00',
          unidadMedida: '14',
          codigos: [],
          indicadorFacturacion: '1',
          indicadorBienOServ: '1',
          nombreItem: 'ESPAGUETIS MILANO',
          descripcionItem: '',
          precioUnitario: '900.0000',
          descuentoMonto: '',
          subDescuentos: [],
          impuestosAdicionales: [],
          otraMonedaDetalles: [],
          montoItem: '45000.00'),
      EcfDetailsModel(
          cantidad: '25.00',
          unidadMedida: '47',
          codigos: [],
          indicadorFacturacion: '4',
          indicadorBienOServ: '1',
          nombreItem: 'LECHE MILEX',
          descripcionItem: '',
          precioUnitario: '450.0000',
          descuentoMonto: '',
          subDescuentos: [],
          impuestosAdicionales: [],
          otraMonedaDetalles: [],
          montoItem: '11250.00'),
      EcfDetailsModel(
          cantidad: '35.00',
          unidadMedida: '47',
          codigos: [],
          indicadorFacturacion: '1',
          indicadorBienOServ: '1',
          nombreItem: 'SALSA LA FAMOSA',
          descripcionItem: '',
          precioUnitario: '200.0000',
          descuentoMonto: '',
          subDescuentos: [],
          impuestosAdicionales: [],
          otraMonedaDetalles: [],
          montoItem: '7000.00'),
      EcfDetailsModel(
          cantidad: '55.00',
          unidadMedida: '14',
          codigos: [],
          indicadorFacturacion: '1',
          indicadorBienOServ: '1',
          nombreItem: 'GALLETAS SALADAS GUARINA',
          descripcionItem: '',
          precioUnitario: '95.0000',
          descuentoMonto: '',
          subDescuentos: [],
          impuestosAdicionales: [],
          otraMonedaDetalles: [],
          montoItem: '5225.00'),
      EcfDetailsModel(
          cantidad: '60.00',
          unidadMedida: '14',
          codigos: [],
          indicadorFacturacion: '4',
          indicadorBienOServ: '1',
          nombreItem: 'SALAMI INDUVECA',
          descripcionItem: '',
          precioUnitario: '115.0000',
          descuentoMonto: '',
          subDescuentos: [],
          impuestosAdicionales: [],
          otraMonedaDetalles: [],
          montoItem: '6900.00'),
      EcfDetailsModel(
          cantidad: '65.00',
          unidadMedida: '15',
          codigos: [],
          indicadorFacturacion: '1',
          indicadorBienOServ: '1',
          nombreItem: 'JUGO DE NARANJA RICA',
          descripcionItem: '',
          precioUnitario: '100.0000',
          descuentoMonto: '',
          subDescuentos: [],
          impuestosAdicionales: [],
          otraMonedaDetalles: [],
          montoItem: '6500.00'),
      EcfDetailsModel(
          cantidad: '25.00',
          unidadMedida: '47',
          codigos: [],
          indicadorFacturacion: '1',
          indicadorBienOServ: '1',
          nombreItem: 'ACEITE CRISOL',
          descripcionItem: '',
          precioUnitario: '250.0000',
          descuentoMonto: '',
          subDescuentos: [],
          impuestosAdicionales: [],
          otraMonedaDetalles: [],
          montoItem: '6250.00'),
      EcfDetailsModel(
          cantidad: '55.00',
          unidadMedida: '20',
          codigos: [],
          indicadorFacturacion: '4',
          indicadorBienOServ: '1',
          nombreItem: 'HUEVOS CASCARON',
          descripcionItem: '',
          precioUnitario: '300.0000',
          descuentoMonto: '',
          subDescuentos: [],
          impuestosAdicionales: [],
          otraMonedaDetalles: [],
          montoItem: '16500.00'),
      EcfDetailsModel(
          cantidad: '20.00',
          unidadMedida: '46',
          codigos: [],
          indicadorFacturacion: '4',
          indicadorBienOServ: '1',
          nombreItem: 'MAIZ EL MAIZAL',
          descripcionItem: '',
          precioUnitario: '350.0000',
          descuentoMonto: '',
          subDescuentos: [],
          impuestosAdicionales: [],
          otraMonedaDetalles: [],
          montoItem: '7000.00'),
      EcfDetailsModel(
          cantidad: '30.00',
          unidadMedida: '46',
          codigos: [],
          indicadorFacturacion: '2',
          indicadorBienOServ: '1',
          nombreItem: 'CAF¿ SANTO DOMINGO',
          descripcionItem: '',
          precioUnitario: '400.0000',
          descuentoMonto: '',
          subDescuentos: [],
          impuestosAdicionales: [],
          otraMonedaDetalles: [],
          montoItem: '12000.00'),
    ];

    EcfModel ecf = EcfModel(
        tipoEcf: EcfType.e31,
        tempDirName: 'sailyn',
        indicadorMontoGravado: '0',
        indicadorNotaCredito: '',
        rncOtroContribuyente: '',
        numeroComprobante: 'E310000000007',
        numeroComprobanteModificado: '',
        codigoModificacion: '',
        fechaEmision: fechaEmision,
        fechaVencimiento: '31-12-2025',
        fechaEmisionNcfModificado: '',
        razonModificacion: '',
        tipoIngreso: '01',
        tipoPago: '1',
        formasDePagos: [FormaDePago('1', '228460.50')],
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
        totalGravado: '133975.00',
        totalGravado18: '69975.00',
        totalGravado16: '64000.00',
        totalGravadoTasa0: '',
        montoExento: '71650.00',
        totalItbis: '22835.50',
        totalItbis18: '12595.50',
        totalItbis16: '10240.00',
        totalItbisTasa0: '',
        itbis1: '18',
        itbis2: '16',
        itbis3: '',
        montoTotal: '228460.50',
        montoNoFacturable: '',
        montoPeriodo: '228460.50',
        montoAvancePago: '',
        valorPagar: '228460.50',
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
