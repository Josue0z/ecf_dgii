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
          cantidad: '20.00',
          unidadMedida: '43',
          indicadorFacturacion: '1',
          indicadorBienOServ: '1',
          nombreItem: 'RADIO CASETTE',
          descripcionItem: '',
          precioUnitario: '1500.0000',
          descuentoMonto: '',
          subDescuentos: [],
          impuestosAdicionales: [],
          otraMonedaDetalles: [
            OtraMonedaDetalle(
                precioOtraMoneda: '26.64',
                descuentoOtraMoneda: '',
                recargoOtraMoneda: '',
                montoItemOtraMoneda: '532.86')
          ],
          montoItem: '30000.00'),
      EcfDetailsModel(
          cantidad: '20.00',
          unidadMedida: '43',
          indicadorFacturacion: '1',
          indicadorBienOServ: '1',
          nombreItem: 'VIDEO GRABADORA',
          descripcionItem: '',
          precioUnitario: '2500.0000',
          descuentoMonto: '',
          subDescuentos: [],
          impuestosAdicionales: [],
          otraMonedaDetalles: [
            OtraMonedaDetalle(
                precioOtraMoneda: '44.40',
                descuentoOtraMoneda: '',
                recargoOtraMoneda: '',
                montoItemOtraMoneda: '888.10')
          ],
          montoItem: '50000.00'),
      EcfDetailsModel(
          cantidad: '20.00',
          unidadMedida: '43',
          indicadorFacturacion: '1',
          indicadorBienOServ: '1',
          nombreItem: 'BOCINAS',
          descripcionItem: '',
          precioUnitario: '3700.0000',
          descuentoMonto: '',
          subDescuentos: [],
          impuestosAdicionales: [],
          otraMonedaDetalles: [
            OtraMonedaDetalle(
                precioOtraMoneda: '65.72',
                descuentoOtraMoneda: '',
                recargoOtraMoneda: '',
                montoItemOtraMoneda: '1314.39')
          ],
          montoItem: '74000.00'),
      EcfDetailsModel(
          cantidad: '20.00',
          unidadMedida: '43',
          indicadorFacturacion: '1',
          indicadorBienOServ: '1',
          nombreItem: 'ABANICOS',
          descripcionItem: '',
          precioUnitario: '4500.0000',
          descuentoMonto: '',
          subDescuentos: [],
          impuestosAdicionales: [],
          otraMonedaDetalles: [
            OtraMonedaDetalle(
                precioOtraMoneda: '79.93',
                descuentoOtraMoneda: '',
                recargoOtraMoneda: '',
                montoItemOtraMoneda: '1598.58')
          ],
          montoItem: '90000.00'),
      EcfDetailsModel(
          cantidad: '20.00',
          unidadMedida: '43',
          indicadorFacturacion: '1',
          indicadorBienOServ: '1',
          nombreItem: 'CABLES ELECTRONICOS',
          descripcionItem: '',
          precioUnitario: '3750.0000',
          descuentoMonto: '',
          subDescuentos: [],
          impuestosAdicionales: [],
          otraMonedaDetalles: [
            OtraMonedaDetalle(
                precioOtraMoneda: '66.61',
                descuentoOtraMoneda: '',
                recargoOtraMoneda: '',
                montoItemOtraMoneda: '1332.15')
          ],
          montoItem: '75000.00'),
      EcfDetailsModel(
          cantidad: '20.00',
          unidadMedida: '43',
          indicadorFacturacion: '1',
          indicadorBienOServ: '1',
          nombreItem: 'NEVERA NEDOCA',
          descripcionItem: '',
          precioUnitario: '4000.0000',
          descuentoMonto: '',
          subDescuentos: [],
          impuestosAdicionales: [],
          otraMonedaDetalles: [
            OtraMonedaDetalle(
                precioOtraMoneda: '71.05',
                descuentoOtraMoneda: '',
                recargoOtraMoneda: '',
                montoItemOtraMoneda: '1420.96')
          ],
          montoItem: '80000.00'),
      EcfDetailsModel(
          cantidad: '20.00',
          unidadMedida: '43',
          indicadorFacturacion: '1',
          indicadorBienOServ: '1',
          nombreItem: 'ESTUFA',
          descripcionItem: '',
          precioUnitario: '3700.0000',
          descuentoMonto: '',
          subDescuentos: [],
          impuestosAdicionales: [],
          otraMonedaDetalles: [
            OtraMonedaDetalle(
                precioOtraMoneda: '65.72',
                descuentoOtraMoneda: '',
                recargoOtraMoneda: '',
                montoItemOtraMoneda: '1314.39')
          ],
          montoItem: '74000.00'),
      EcfDetailsModel(
          cantidad: '20.00',
          unidadMedida: '43',
          indicadorFacturacion: '1',
          indicadorBienOServ: '1',
          nombreItem: 'LICUADORA',
          descripcionItem: '',
          precioUnitario: '4500.0000',
          descuentoMonto: '',
          subDescuentos: [],
          impuestosAdicionales: [],
          otraMonedaDetalles: [
            OtraMonedaDetalle(
                precioOtraMoneda: '79.93',
                descuentoOtraMoneda: '',
                recargoOtraMoneda: '',
                montoItemOtraMoneda: '1598.58')
          ],
          montoItem: '90000.00'),
      EcfDetailsModel(
          cantidad: '20.00',
          unidadMedida: '43',
          indicadorFacturacion: '1',
          indicadorBienOServ: '1',
          nombreItem: 'TOSTADORA',
          descripcionItem: '',
          precioUnitario: '4550.0000',
          descuentoMonto: '',
          subDescuentos: [],
          impuestosAdicionales: [],
          otraMonedaDetalles: [
            OtraMonedaDetalle(
                precioOtraMoneda: '80.82',
                descuentoOtraMoneda: '',
                recargoOtraMoneda: '',
                montoItemOtraMoneda: '1616.34')
          ],
          montoItem: '91000.00'),
      EcfDetailsModel(
          cantidad: '20.00',
          unidadMedida: '43',
          indicadorFacturacion: '1',
          indicadorBienOServ: '1',
          nombreItem: 'MICROONDAS',
          descripcionItem: '',
          precioUnitario: '7000.0000',
          descuentoMonto: '',
          subDescuentos: [],
          impuestosAdicionales: [],
          otraMonedaDetalles: [
            OtraMonedaDetalle(
                precioOtraMoneda: '124.33',
                descuentoOtraMoneda: '',
                recargoOtraMoneda: '',
                montoItemOtraMoneda: '2486.68')
          ],
          montoItem: '140000.00'),
    ];

    EcfModel ecf = EcfModel(
        tipoEcf: EcfType.e45,
        tempDirName: 'sailyn',
        indicadorMontoGravado: '0',
        numeroComprobante: 'E450000000010',
        codigoModificacion: '',
        fechaEmision: fechaEmision,
        fechaVencimiento: '31-12-2025',
        fechaEmisionNcfModificado: '',
        razonModificacion:
            'ANULACION DEL ENCF31 CON SECUENCIA QUE FINALIZA EN 61',
        tipoIngreso: '01',
        tipoPago: '1',
        formasDePagos: [],
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
        numeroContenedor: '',
        numeroReferencia: '',
        zonaVenta: 'NORTE',
        rutaVenta: '',
        conductor: 'Rafael Perez',
        documentoTransporte: '363636',
        ficha: 'J-1234',
        placa: 'A639689',
        rutaTransporte: 'B-Sur',
        zonaTransporte: 'Interior-1',
        numeroAlbaran: '3634258',
        totalGravado: '794000.00',
        totalGravado18: '794000.00',
        totalGravado16: '',
        totalGravadoTasa0: '',
        montoExento: '',
        totalItbis: '142920.00',
        totalItbis18: '142920.00',
        totalItbis16: '',
        totalItbisTasa0: '',
        itbis1: '18',
        itbis2: '',
        itbis3: '',
        montoTotal: '936920.00',
        montoPeriodo: '936920.00',
        montoAvancePago: '',
        valorPagar: '936920.00',
        tipoMoneda: 'USD',
        tipoCambio: '56.3000',
        montoGravadoTotalOtraMoneda: '14103.02',
        montoGravadoTotalOtraMoneda1: '14103.02',
        totalItbisOtraMoneda: '2538.54',
        totalItbis1OtraMoneda: '2538.54',
        montoTotalOtraMoneda: '16641.56',
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
