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
          cantidad: '40.00',
          unidadMedida: '6',
          indicadorFacturacion: '3',
          indicadorBienOServ: '1',
          nombreItem: 'ZAPATOS',
          descripcionItem: '',
          precioUnitario: '350.0000',
          descuentoMonto: '500.00',
          subDescuentos: [
            SubDescuento(
            tipoSubDescuento: '\$', 
            subDescuentoPorcentaje: '', 
            montoSubDescuento: '500.00')
          ],
          impuestosAdicionales: [],
          otraMonedaDetalles: [],
          montoItem: '13500.00'),
      EcfDetailsModel(
          cantidad: '40.00',
          unidadMedida: '6',
          indicadorFacturacion: '3',
          indicadorBienOServ: '1',
          nombreItem: 'CARTERAS',
          descripcionItem: '',
          precioUnitario: '450.0000',
          descuentoMonto: '500.00',
          subDescuentos: [
            SubDescuento(
            tipoSubDescuento: '\$', 
            subDescuentoPorcentaje: '', 
            montoSubDescuento: '500.00')
          ],
          impuestosAdicionales: [],
          otraMonedaDetalles: [],
          montoItem: '17500.00'),
      EcfDetailsModel(
          cantidad: '50.00',
          unidadMedida: '6',
          indicadorFacturacion: '3',
          indicadorBienOServ: '1',
          nombreItem: 'BLUSAS',
          descripcionItem: '',
          precioUnitario: '550.0000',
          descuentoMonto: '500.00',
          subDescuentos: [
            SubDescuento(
            tipoSubDescuento: '\$', 
            subDescuentoPorcentaje: '', 
            montoSubDescuento: '500.00')
          ],
          impuestosAdicionales: [],
          otraMonedaDetalles: [],
          montoItem: '27000.00'),

        EcfDetailsModel(
          cantidad: '25.00',
          unidadMedida: '6',
          indicadorFacturacion: '3',
          indicadorBienOServ: '1',
          nombreItem: 'CALCETINES',
          descripcionItem: '',
          precioUnitario: '350.0000',
          descuentoMonto: '500.00',
          subDescuentos: [
            SubDescuento(
            tipoSubDescuento: '\$', 
            subDescuentoPorcentaje: '', 
            montoSubDescuento: '500.00')
          ],
          impuestosAdicionales: [],
          otraMonedaDetalles: [],
          montoItem: '8250.00'),
        EcfDetailsModel(
          cantidad: '35.00',
          unidadMedida: '6',
          indicadorFacturacion: '3',
          indicadorBienOServ: '1',
          nombreItem: 'TIRANTES',
          descripcionItem: '',
          precioUnitario: '250.0000',
          descuentoMonto: '500.00',
          subDescuentos: [
            SubDescuento(
            tipoSubDescuento: '\$', 
            subDescuentoPorcentaje: '', 
            montoSubDescuento: '500.00')
          ],
          impuestosAdicionales: [],
          otraMonedaDetalles: [],
          montoItem: '8250.00'),
        EcfDetailsModel(
          cantidad: '34.00',
          unidadMedida: '6',
          indicadorFacturacion: '3',
          indicadorBienOServ: '1',
          nombreItem: 'TENIS',
          descripcionItem: '',
          precioUnitario: '350.0000',
          descuentoMonto: '500.00',
          subDescuentos: [
            SubDescuento(
            tipoSubDescuento: '\$', 
            subDescuentoPorcentaje: '', 
            montoSubDescuento: '500.00')
          ],
          impuestosAdicionales: [],
          otraMonedaDetalles: [],
          montoItem: '11400.00'),

        EcfDetailsModel(
          cantidad: '50.00',
          unidadMedida: '6',
          indicadorFacturacion: '3',
          indicadorBienOServ: '1',
          nombreItem: 'CALIZOS',
          descripcionItem: '',
          precioUnitario: '400.0000',
          descuentoMonto: '500.00',
          subDescuentos: [
            SubDescuento(
            tipoSubDescuento: '\$', 
            subDescuentoPorcentaje: '', 
            montoSubDescuento: '500.00')
          ],
          impuestosAdicionales: [],
          otraMonedaDetalles: [],
          montoItem: '19500.00'),

        EcfDetailsModel(
          cantidad: '60.00',
          unidadMedida: '6',
          indicadorFacturacion: '3',
          indicadorBienOServ: '1',
          nombreItem: 'BOLZOS',
          descripcionItem: '',
          precioUnitario: '350.0000',
          descuentoMonto: '500.00',
          subDescuentos: [
            SubDescuento(
            tipoSubDescuento: '\$', 
            subDescuentoPorcentaje: '', 
            montoSubDescuento: '500.00')
          ],
          impuestosAdicionales: [],
          otraMonedaDetalles: [],
          montoItem: '20500.00'),

        EcfDetailsModel(
          cantidad: '45.00',
          unidadMedida: '6',
          indicadorFacturacion: '3',
          indicadorBienOServ: '1',
          nombreItem: 'MEDIAS',
          descripcionItem: '',
          precioUnitario: '450.0000',
          descuentoMonto: '500.00',
          subDescuentos: [
            SubDescuento(
            tipoSubDescuento: '\$', 
            subDescuentoPorcentaje: '', 
            montoSubDescuento: '500.00')
          ],
          impuestosAdicionales: [],
          otraMonedaDetalles: [],
          montoItem: '19750.00'),

        EcfDetailsModel(
          cantidad: '50.00',
          unidadMedida: '6',
          indicadorFacturacion: '3',
          indicadorBienOServ: '1',
          nombreItem: 'SUETER',
          descripcionItem: '',
          precioUnitario: '500.0000',
          descuentoMonto: '500.00',
          subDescuentos: [
            SubDescuento(
            tipoSubDescuento: '\$', 
            subDescuentoPorcentaje: '', 
            montoSubDescuento: '500.00')
          ],
          impuestosAdicionales: [],
          otraMonedaDetalles: [],
          montoItem: '24500.00'),
    ];

    EcfModel ecf = EcfModel(
        tipoEcf: EcfType.e46,
        tempDirName: 'sailyn',
        indicadorMontoGravado: '',
        numeroComprobante: 'E460000000010',
        codigoModificacion: '',
        fechaEmision: fechaEmision,
        fechaVencimiento: '31-12-2025',
        fechaEmisionNcfModificado: '',
        razonModificacion:
            'ANULACION DEL ENCF31 CON SECUENCIA QUE FINALIZA EN 61',
        tipoIngreso: '01',
        tipoPago: '1',
        formasDePagos: [FormaDePago('1', '170150.00')],
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
        totalGravado: '170150.00',
        totalGravado18: '',
        totalGravado16: '',
        totalGravadoTasa0: '170150.00',
        montoExento: '',
        totalItbis: '0.00',
        totalItbis18: '',
        totalItbis16: '',
        totalItbisTasa0: '0.00',
        itbis1: '',
        itbis2: '',
        itbis3: '0',
        montoTotal: '170150.00',
        montoPeriodo: '170150.00',
        montoAvancePago: '',
        valorPagar: '170150.00',
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
