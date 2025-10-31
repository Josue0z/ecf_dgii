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

    final fechaEmision = '';

    List<EcfDetailsModel> items = [
      EcfDetailsModel(
          cantidad: '100.00',
          unidadMedida: '23',
          indicadorFacturacion: '1',
          indicadorBienOServ: '1',
          nombreItem: 'BLOCK',
          descripcionItem: '',
          precioUnitario: '450.0000',
          descuentoMonto: '',
          subDescuentos: [],
          recargoMonto: '',
          subRecargos: [],
          otraMonedaDetalles: [],
          impuestosAdicionales: [],
          montoItem: '45000.00'),
      EcfDetailsModel(
          cantidad: '300.00',
          unidadMedida: '23',
          indicadorFacturacion: '1',
          indicadorBienOServ: '1',
          nombreItem: 'VARILLAS',
          descripcionItem: '',
          precioUnitario: '350.0000',
          descuentoMonto: '',
          subDescuentos: [],
          recargoMonto: '',
          subRecargos: [],
          otraMonedaDetalles: [],
          impuestosAdicionales: [],
          montoItem: '105000.00'),
      EcfDetailsModel(
          cantidad: '200.00',
          unidadMedida: '23',
          indicadorFacturacion: '1',
          indicadorBienOServ: '1',
          nombreItem: 'CINZ',
          descripcionItem: '',
          precioUnitario: '425.0000',
          descuentoMonto: '',
          subDescuentos: [],
          recargoMonto: '',
          subRecargos: [],
          otraMonedaDetalles: [],
          impuestosAdicionales: [],
          montoItem: '85000.00'),
      EcfDetailsModel(
          cantidad: '50.00',
          unidadMedida: '23',
          indicadorFacturacion: '1',
          indicadorBienOServ: '1',
          nombreItem: 'CLAVOS DE MEDIA',
          descripcionItem: '',
          precioUnitario: '550.0000',
          descuentoMonto: '',
          subDescuentos: [],
          recargoMonto: '',
          subRecargos: [],
          otraMonedaDetalles: [],
          impuestosAdicionales: [],
          montoItem: '27500.00'),
      EcfDetailsModel(
          cantidad: '50.00',
          unidadMedida: '23',
          indicadorFacturacion: '1',
          indicadorBienOServ: '1',
          nombreItem: 'CLAVOS DE CUARTA',
          descripcionItem: '',
          precioUnitario: '325.0000',
          descuentoMonto: '',
          subDescuentos: [],
          recargoMonto: '',
          subRecargos: [],
          otraMonedaDetalles: [],
          impuestosAdicionales: [],
          montoItem: '16250.00'),
      EcfDetailsModel(
          cantidad: '60.00',
          unidadMedida: '23',
          indicadorFacturacion: '2',
          indicadorBienOServ: '1',
          nombreItem: 'ALAMBRE DULCE',
          descripcionItem: '',
          precioUnitario: '250.0000',
          descuentoMonto: '',
          subDescuentos: [],
          recargoMonto: '',
          subRecargos: [],
          otraMonedaDetalles: [],
          impuestosAdicionales: [],
          montoItem: '15000.00'),
      EcfDetailsModel(
          cantidad: '250.00',
          unidadMedida: '23',
          indicadorFacturacion: '2',
          indicadorBienOServ: '1',
          nombreItem: 'CEMENTO BLANCO',
          descripcionItem: '',
          precioUnitario: '250.0000',
          descuentoMonto: '',
          subDescuentos: [],
          recargoMonto: '',
          subRecargos: [],
          otraMonedaDetalles: [],
          impuestosAdicionales: [],
          montoItem: '62500.00'),
      EcfDetailsModel(
          cantidad: '400.00',
          unidadMedida: '23',
          indicadorFacturacion: '2',
          indicadorBienOServ: '1',
          nombreItem: 'CEMENTO GRIS',
          descripcionItem: '',
          precioUnitario: '250.0000',
          descuentoMonto: '',
          subDescuentos: [],
          recargoMonto: '',
          subRecargos: [],
          otraMonedaDetalles: [],
          impuestosAdicionales: [],
          montoItem: '100000.00'),
      EcfDetailsModel(
          cantidad: '30.00',
          unidadMedida: '23',
          indicadorFacturacion: '2',
          indicadorBienOServ: '1',
          nombreItem: 'COLORANTE',
          descripcionItem: '',
          precioUnitario: '250.0000',
          descuentoMonto: '',
          subDescuentos: [],
          recargoMonto: '',
          subRecargos: [],
          otraMonedaDetalles: [],
          impuestosAdicionales: [],
          montoItem: '7500.00'),
      EcfDetailsModel(
          cantidad: '60.00',
          unidadMedida: '23',
          indicadorFacturacion: '2',
          indicadorBienOServ: '1',
          nombreItem: 'TINER',
          descripcionItem: '',
          precioUnitario: '250.0000',
          descuentoMonto: '',
          subDescuentos: [],
          recargoMonto: '',
          subRecargos: [],
          otraMonedaDetalles: [],
          impuestosAdicionales: [],
          montoItem: '15000.00'),
      EcfDetailsModel(
          cantidad: '1.00',
          unidadMedida: '23',
          indicadorFacturacion: '1',
          indicadorBienOServ: '1',
          nombreItem: 'EPIC 1',
          descripcionItem: '',
          precioUnitario: '3500.00',
          descuentoMonto: '',
          subDescuentos: [],
          recargoMonto: '',
          subRecargos: [],
          otraMonedaDetalles: [],
          impuestosAdicionales: [],
          montoItem: '3500.00'),
      EcfDetailsModel(
          cantidad: '1.00',
          unidadMedida: '23',
          indicadorFacturacion: '2',
          indicadorBienOServ: '1',
          nombreItem: 'EPIC 2',
          descripcionItem: '',
          precioUnitario: '2000.00',
          descuentoMonto: '',
          subDescuentos: [],
          recargoMonto: '',
          subRecargos: [],
          otraMonedaDetalles: [],
          impuestosAdicionales: [],
          montoItem: '2000.00'),
    ];

    EcfModel ecf = EcfModel(
        tipoEcf: EcfType.e32,
        tempDirName: 'sailyn-reales',
        indicadorMontoGravado: '0',
        indicadorNotaCredito: '',
        rncOtroContribuyente: '',
        numeroComprobante: 'E320000000071',
        numeroComprobanteModificado: '',
        codigoModificacion: '',
        fechaEmision: '01-04-2020',
        fechaVencimiento: '',
        fechaEmisionNcfModificado: '',
        razonModificacion: '',
        tipoIngreso: '01',
        tipoPago: '1',
        formasDePagos: [FormaDePago('1', '567375.00')],
        sucursal: '',
        municipio: '010100',
        provincia: '010000',
        telefonoEmisor1: '809-472-7676',
        telefonoEmisor2: '809-491-1918',
        telefonoEmisor3: '',
        totalPaginas: '',
        rncEmisor: '130262812',
        razonSocialEmisor: 'SAILYN AUTO IMPORT SRL',
        nombreComercial: 'SAILYN AUTO IMPORT',
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
        totalGravado: '484250.00',
        totalGravado18: '282250.00',
        totalGravado16: '202000.00',
        totalGravadoTasa0: '',
        montoExento: '',
        totalItbis: '83125.00',
        totalItbis18: '50805.00',
        totalItbis16: '32320.00',
        totalItbisTasa0: '',
        itbis1: '18',
        itbis2: '16',
        itbis3: '',
        montoTotal: '567375.00',
        montoNoFacturable: '',
        montoPeriodo: '567375.00',
        montoAvancePago: '',
        valorPagar: '567375.00',
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
    var filePdf = File(path.join(tempDirPath, 'sailyn-reales', 'pdfs',
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
