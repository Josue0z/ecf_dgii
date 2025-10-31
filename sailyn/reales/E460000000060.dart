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
          cantidad: '150.00',
          unidadMedida: '6',
          indicadorFacturacion: '3',
          indicadorBienOServ: '1',
          nombreItem: 'Sardinas',
          descripcionItem: '',
          precioUnitario: '450.0000',
          descuentoMonto: '',
          subDescuentos: [],
          impuestosAdicionales: [],
          otraMonedaDetalles: [
            OtraMonedaDetalle(
                precioOtraMoneda: '7.89',
                descuentoOtraMoneda: '',
                recargoOtraMoneda: '',
                montoItemOtraMoneda: '1184.21')
          ],
          montoItem: '67500.00'),
      EcfDetailsModel(
          cantidad: '100.00',
          unidadMedida: '6',
          indicadorFacturacion: '3',
          indicadorBienOServ: '1',
          nombreItem: 'Habicuelas',
          descripcionItem: '',
          precioUnitario: '200.0000',
          descuentoMonto: '',
          subDescuentos: [],
          impuestosAdicionales: [],
          otraMonedaDetalles: [
            OtraMonedaDetalle(
                precioOtraMoneda: '3.51',
                descuentoOtraMoneda: '',
                recargoOtraMoneda: '',
                montoItemOtraMoneda: '350.88')
          ],
          montoItem: '20000.00'),
      EcfDetailsModel(
          cantidad: '120.00',
          unidadMedida: '6',
          indicadorFacturacion: '3',
          indicadorBienOServ: '1',
          nombreItem: 'Gandules',
          descripcionItem: '',
          precioUnitario: '250.0000',
          descuentoMonto: '',
          subDescuentos: [],
          impuestosAdicionales: [],
          otraMonedaDetalles: [
            OtraMonedaDetalle(
                precioOtraMoneda: '4.39',
                descuentoOtraMoneda: '',
                recargoOtraMoneda: '',
                montoItemOtraMoneda: '526.32')
          ],
          montoItem: '30000.00'),
    ];

    EcfModel ecf = EcfModel(
        tipoEcf: EcfType.e46,
        tempDirName: 'sailyn-reales',
        indicadorMontoGravado: '',
        numeroComprobante: 'E460000000062',
        codigoModificacion: '',
        fechaEmision: fechaEmision,
        fechaVencimiento: '31-12-2025',
        fechaEmisionNcfModificado: '',
        razonModificacion:
            'ANULACION DEL ENCF31 CON SECUENCIA QUE FINALIZA EN 61',
        tipoIngreso: '01',
        tipoPago: '1',
        formasDePagos: [FormaDePago('1', '117500.00')],
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
        razonSocialEmisor: 'SAILYN AUTO IMPORT SRL',
        nombreComercial: 'SAILYN AUTO IMPORT',
        correoEmisor:
            'DOCUMENTOSELECTRONICOSDE0612345678969789+9000000000000000000000000000001@123.COM',
        website: 'www.facturaelectronica.com',
        actividadEconomica: '',
        codigoVendedor:
            'AA0000000100000000010000000002000000000300000000050000000006',
        informacionAdicionalEmisor: '',
        rncComprador: '131880681',
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
        fechaEntrega: '10-10-2020',
        fechaOrdenCompra: '10-11-2018',
        numeroOrdenCompra: '4500352238',
        numeroFacturaInterna: '123456789016',
        numeroPedidoInterno: '123456789016',
        zonaVenta: 'NORTE',
        rutaVenta: '',
        conductor: 'Rafael Perez',
        documentoTransporte: '363636',
        ficha: 'J-1234',
        placa: 'A639689',
        rutaTransporte: 'B-Sur',
        zonaTransporte: 'Interior-1',
        numeroAlbaran: '3634258',
        totalGravado: '117500.00',
        totalGravado18: '',
        totalGravado16: '',
        totalGravadoTasa0: '117500.00',
        montoExento: '',
        totalItbis: '0.00',
        totalItbis18: '',
        totalItbis16: '',
        totalItbisTasa0: '0.00',
        itbis1: '',
        itbis2: '',
        itbis3: '0',
        montoTotal: '117500.00',
        montoPeriodo: '117500.00',
        montoAvancePago: '',
        valorPagar: '117500.00',
        tipoMoneda: 'USD',
        tipoCambio: '57.0000',
        montoGravadoTotalOtraMoneda: '2061.40',
        montoGravadoTotalOtraMoneda1: '',
        montoGravadoTotalOtraMoneda2: '',
        montoGravadoTotalOtraMoneda3: '2061.40',
        totalItbisOtraMoneda: '0.00',
        totalItbis1OtraMoneda: '',
        totalItbis2OtraMoneda: '',
        totalItbis3OtraMoneda: '0.00',
        montoExentoOtraMoneda: '',
        montoTotalOtraMoneda: '2061.40',
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
