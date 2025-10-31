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
          cantidad: '1',
          unidadMedida: '55',
          indicadorFacturacion: '1',
          indicadorBienOServ: '1',
          nombreItem: 'Nevera',
          descripcionItem: '',
          precioUnitario: '95000.00',
          descuentoMonto: '',
          subDescuentos: [],
          recargoMonto: '',
          subRecargos: [],
          otraMonedaDetalles: [],
          impuestosAdicionales: [],
          montoItem: '95000.00'),
    ];

    EcfModel ecf = EcfModel(
        tipoEcf: EcfType.e32,
        tempDirName: 'sailyn',
        indicadorMontoGravado: '0',
        indicadorNotaCredito: '',
        rncOtroContribuyente: '',
        numeroComprobante: 'E320000000013',
        numeroComprobanteModificado: '',
        codigoModificacion: '',
        fechaEmision: '01-04-2020',
        fechaVencimiento: '',
        fechaEmisionNcfModificado: '',
        razonModificacion: '',
        tipoIngreso: '01',
        tipoPago: '1',
        formasDePagos: [],
        sucursal: '',
        municipio: '',
        provincia: '',
        telefonoEmisor1: '809-472-7676',
        telefonoEmisor2: '',
        telefonoEmisor3: '',
        totalPaginas: '',
        rncEmisor: '130262812',
        razonSocialEmisor:
            'DOCUMENTOS ELECTRONICOS PRUEBA FACTURA DE CONSUMO MENOR 250MIL',
        nombreComercial: 'DOCUMENTOS ELECTRONICOS',
        direccionEmisor:
            'AVE. ISABEL AGUIAR NO. 269, ZONA INDUSTRIAL DE HERRERA',
        correoEmisor: 'DOCUMENTOSELECTRONICOS@123.COM',
        website: '',
        actividadEconomica: '',
        codigoVendedor: '',
        informacionAdicionalEmisor: '',
        rncComprador: '131880681',
        identificadorExtranjero: '',
        razonSocialComprador: 'DOCUMENTOS ELECTRONICOS DE 03',
        nombreComprador: '',
        contactoComprador: '',
        correoComprador: 'DOCUMENTOSELECTRONICOSDE0612345678969789@123.COM',
        telefonoAdicional: '809-472-7676',
        direccionComprador:
            'AVE. ISABEL AGUIAR NO. 269, ZONA INDUSTRIAL DE HERRERA',
        municipioComprador: '170203',
        provinciaComprador: '170000',
        codigoInternoComprador: '',
        numeroContenedor: '',
        numeroReferencia: '',
        fechaEntrega: '',
        fechaOrdenCompra: '',
        numeroOrdenCompra: '',
        numeroFacturaInterna: '',
        numeroPedidoInterno: '',
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
        totalGravado: '95000.00',
        totalGravado18: '95000.00',
        totalGravado16: '',
        totalGravadoTasa0: '',
        montoExento: '',
        totalItbis: '17100.00',
        totalItbis18: '17100.00',
        totalItbis16: '',
        totalItbisTasa0: '',
        itbis1: '18',
        itbis2: '',
        itbis3: '',
        montoTotal: '112100.00',
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
