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
    final fechaEmision = '02-04-2020';

    List<EcfDetailsModel> items = [
      EcfDetailsModel(
          cantidad: '1.00',
          unidadMedida: '',
          indicadorFacturacion: '0',
          indicadorBienOServ: '2',
          nombreItem: 'SERVICIO PUBLICIDAD ACTUALIZADO',
          descripcionItem: '',
          precioUnitario: '1.00',
          descuentoMonto: '',
          subDescuentos: [],
          impuestosAdicionales: [],
          otraMonedaDetalles: [],
          montoItem: '1.00'),
    ];

    EcfModel ecf = EcfModel(
        tipoEcf: EcfType.e34,
        tempDirName: 'sailyn-reales',
        indicadorMontoGravado: '',
        indicadorNotaCredito: '0',
        rncOtroContribuyente: '',
        numeroComprobante: 'E340000000091',
        numeroComprobanteModificado: 'E410000000091',
        codigoModificacion: '2',
        fechaEmision: fechaEmision,
        fechaVencimiento: '',
        fechaEmisionNcfModificado: '01-04-2020',
        razonModificacion: '',
        tipoIngreso: '01',
        tipoPago: '1',
        formasDePagos: [],
        sucursal: '',
        direccionEmisor: 'DOCUMENTOS ELECTRONICOS DE 02',
        municipio: '',
        provincia: '',
        telefonoEmisor1: '',
        telefonoEmisor2: '',
        telefonoEmisor3: '',
        totalPaginas: '',
        rncEmisor: '130262812',
        razonSocialEmisor: 'SAILYN AUTO IMPORT SRL',
        nombreComercial: '',
        correoEmisor: '',
        website: '',
        actividadEconomica: '',
        codigoVendedor: '',
        informacionAdicionalEmisor: '',
        rncComprador: '131880681',
        identificadorExtranjero: '',
        razonSocialComprador: 'DOCUMENTOS ELECTRONICOS DE 02',
        nombreComprador: '',
        contactoComprador: '',
        correoComprador: '',
        telefonoAdicional: '',
        direccionComprador: '',
        municipioComprador: '',
        provinciaComprador: '',
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
        totalGravado: '',
        totalGravado18: '',
        totalGravado16: '',
        totalGravadoTasa0: '',
        montoExento: '',
        totalItbis: '',
        totalItbis18: '',
        totalItbis16: '',
        totalItbisTasa0: '',
        itbis1: '',
        itbis2: '',
        itbis3: '',
        montoTotal: '0.00',
        montoNoFacturable: '1.00',
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
