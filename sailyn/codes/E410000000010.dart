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
          cantidad: '15.00',
          unidadMedida: '23',
          indicadorFacturacion: '1',
          indicadorBienOServ: '2',
          nombreItem: 'Servicio Profesional Legislativo',
          descripcionItem: '',
          precioUnitario: '385.0000',
          descuentoMonto: '385.00',
          subDescuentos: [
            SubDescuento(
                tipoSubDescuento: '\$',
                subDescuentoPorcentaje: '',
                montoSubDescuento: '385.00')
          ],
          recargoMonto: '57.75',
          subRecargos: [
            SubRecargo(
                tipoSubRecargo: '%',
                subRecargoPorcentaje: '1.00',
                montoSubRecargo: '57.75')
          ],
          retencion: Retencion(
              indicadorAgenteRetencionoPercepcion: '1',
              montoITBISRetenido: '971.60',
              montoISRRetenido: '544.78'),
          impuestosAdicionales: [],
          montoItem: '5447.75'),
      EcfDetailsModel(
          cantidad: '5.00',
          unidadMedida: '43',
          indicadorFacturacion: '1',
          indicadorBienOServ: '2',
          nombreItem: 'Asesoria Legal',
          descripcionItem: '',
          precioUnitario: '550.0000',
          descuentoMonto: '275.00',
          subDescuentos: [
            SubDescuento(
                tipoSubDescuento: '%',
                subDescuentoPorcentaje: '10.00',
                montoSubDescuento: '275.00')
          ],
          recargoMonto: '27.50',
          subRecargos: [
            SubRecargo(
                tipoSubRecargo: '%',
                subRecargoPorcentaje: '1.00',
                montoSubRecargo: '27.50')
          ],
          retencion: Retencion(
              indicadorAgenteRetencionoPercepcion: '1',
              montoITBISRetenido: '441.45',
              montoISRRetenido: '250.25'),
          impuestosAdicionales: [],
          montoItem: '2502.50'),
      EcfDetailsModel(
          cantidad: '9.00',
          unidadMedida: '13',
          indicadorFacturacion: '1',
          indicadorBienOServ: '2',
          nombreItem: 'Gestiones Legales',
          descripcionItem: '',
          precioUnitario: '250.0000',
          descuentoMonto: '150.00',
          subDescuentos: [
            SubDescuento(
                tipoSubDescuento: '\$',
                subDescuentoPorcentaje: '',
                montoSubDescuento: '150.00')
          ],
          recargoMonto: '22.50',
          subRecargos: [
            SubRecargo(
                tipoSubRecargo: '%',
                subRecargoPorcentaje: '1.00',
                montoSubRecargo: '22.50')
          ],
          retencion: Retencion(
              indicadorAgenteRetencionoPercepcion: '1',
              montoITBISRetenido: '373.05',
              montoISRRetenido: '212.25'),
          impuestosAdicionales: [],
          montoItem: '2122.50'),
      EcfDetailsModel(
          cantidad: '23.00',
          unidadMedida: '15',
          indicadorFacturacion: '2',
          indicadorBienOServ: '2',
          nombreItem: 'Legalizacion de documentos',
          descripcionItem: '',
          precioUnitario: '185.0000',
          descuentoMonto: '200.00',
          subDescuentos: [
            SubDescuento(
                tipoSubDescuento: '\$',
                subDescuentoPorcentaje: '',
                montoSubDescuento: '200.00')
          ],
          recargoMonto: '42.55',
          subRecargos: [
            SubRecargo(
                tipoSubRecargo: '%',
                subRecargoPorcentaje: '1.00',
                montoSubRecargo: '42.55')
          ],
          retencion: Retencion(
              indicadorAgenteRetencionoPercepcion: '1',
              montoITBISRetenido: '647.61',
              montoISRRetenido: '409.76'),
          impuestosAdicionales: [],
          montoItem: '4097.55'),
      EcfDetailsModel(
          cantidad: '7.00',
          unidadMedida: '23',
          indicadorFacturacion: '2',
          indicadorBienOServ: '2',
          nombreItem: 'Servicios ambulatorio',
          descripcionItem: '',
          precioUnitario: '125.0000',
          descuentoMonto: '8.75',
          subDescuentos: [
            SubDescuento(
                tipoSubDescuento: '%',
                subDescuentoPorcentaje: '1.00',
                montoSubDescuento: '8.75')
          ],
          recargoMonto: '8.75',
          subRecargos: [
            SubRecargo(
                tipoSubRecargo: '%',
                subRecargoPorcentaje: '1.00',
                montoSubRecargo: '8.75')
          ],
          retencion: Retencion(
              indicadorAgenteRetencionoPercepcion: '1',
              montoITBISRetenido: '132.00',
              montoISRRetenido: '87.50'),
          impuestosAdicionales: [],
          montoItem: '875.00'),
    ];

    EcfModel ecf = EcfModel(
        tipoEcf: EcfType.e41,
        tempDirName: 'sailyn',
        numeroComprobante: 'E410000000010',
        codigoModificacion: '',
        fechaEmision: fechaEmision,
        fechaVencimiento: '31-12-2025',
        fechaEmisionNcfModificado: '',
        razonModificacion:
            'ANULACION DEL ENCF31 CON SECUENCIA QUE FINALIZA EN 61',
        tipoIngreso: '',
        tipoPago: '1',
        formasDePagos: [FormaDePago('1', '17654.00')],
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
        website: '',
        actividadEconomica: '',
        codigoVendedor: '',
        informacionAdicionalEmisor: '',
        rncComprador: '131880681',
        razonSocialComprador: 'DOCUMENTOS ELECTRONICOS DE 11',
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
        numeroFacturaInterna: '',
        numeroPedidoInterno: '',
        zonaVenta: '',
        rutaVenta: '',
        indicadorMontoGravado: '0',
        totalGravado: '15045.30',
        totalGravado18: '10072.75',
        totalGravado16: '4972.55',
        totalGravadoTasa0: '',
        montoExento: '',
        totalItbis: '2608.70',
        totalItbis18: '1813.10',
        totalItbis16: '795.61',
        totalItbisTasa0: '',
        itbis1: '18',
        itbis2: '16',
        itbis3: '',
        montoTotal: '17654.00',
        montoPeriodo: '',
        montoAvancePago: '',
        valorPagar: '',
        totalItbisRetencion: '2565.70',
        totalIsrRetencion: '1504.53',
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
