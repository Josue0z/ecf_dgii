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
          cantidad: '25.00',
          unidadMedida: '6',
          codigos: [],
          fechaElaboracion: '',
          fechaVencimientoItem: '',
          indicadorFacturacion: '4',
          indicadorBienOServ: '1',
          nombreItem: 'GALLETAS GUARINA',
          descripcionItem: '',
          precioUnitario: '90.0000',
          descuentoMonto: '',
          subDescuentos: [],
          montoItem: '2250.00',
          impuestosAdicionales: []),
      EcfDetailsModel(
          cantidad: '50.00',
          unidadMedida: '31',
          fechaElaboracion: '',
          fechaVencimientoItem: '',
          indicadorFacturacion: '4',
          indicadorBienOServ: '1',
          nombreItem: 'CAF¿ SANTO DOMINGO',
          descripcionItem: '',
          precioUnitario: '200.0000',
          descuentoMonto: '',
          subDescuentos: [],
          montoItem: '10000.00',
          impuestosAdicionales: []),
      EcfDetailsModel(
          cantidad: '80.00',
          unidadMedida: '47',
          codigos: [],
          fechaElaboracion: '',
          fechaVencimientoItem: '',
          indicadorFacturacion: '4',
          indicadorBienOServ: '1',
          nombreItem: 'LECHE LA LECHERA',
          descripcionItem: '',
          precioUnitario: '400.0000',
          descuentoMonto: '',
          subDescuentos: [],
          recargoMonto: '',
          subRecargos: [],
          montoItem: '32000.00',
          impuestosAdicionales: []),
      EcfDetailsModel(
          cantidad: '100.00',
          unidadMedida: '35',
          codigos: [],
          fechaElaboracion: '',
          fechaVencimientoItem: '',
          indicadorFacturacion: '4',
          indicadorBienOServ: '1',
          nombreItem: 'PAPEL TOALLA',
          descripcionItem: '',
          precioUnitario: '350.0000',
          descuentoMonto: '',
          subDescuentos: [],
          recargoMonto: '',
          subRecargos: [],
          montoItem: '35000.00',
          impuestosAdicionales: []),
      EcfDetailsModel(
          cantidad: '125.00',
          unidadMedida: '15',
          codigos: [],
          fechaElaboracion: '',
          fechaVencimientoItem: '',
          indicadorFacturacion: '4',
          indicadorBienOServ: '1',
          nombreItem: 'YOGURT GRIEGO',
          descripcionItem: '',
          precioUnitario: '100.0000',
          descuentoMonto: '',
          subDescuentos: [],
          recargoMonto: '',
          subRecargos: [],
          montoItem: '12500.00',
          impuestosAdicionales: []),
      EcfDetailsModel(
          cantidad: '200.00',
          unidadMedida: '23',
          codigos: [],
          fechaElaboracion: '',
          fechaVencimientoItem: '',
          indicadorFacturacion: '4',
          indicadorBienOServ: '1',
          nombreItem: 'POLLO CONGELADO',
          descripcionItem: '',
          precioUnitario: '175.0000',
          descuentoMonto: '',
          subDescuentos: [],
          recargoMonto: '',
          subRecargos: [],
          montoItem: '35000.00',
          impuestosAdicionales: []),
      EcfDetailsModel(
          cantidad: '250.00',
          unidadMedida: '15',
          codigos: [],
          fechaElaboracion: '',
          fechaVencimientoItem: '',
          indicadorFacturacion: '4',
          indicadorBienOServ: '1',
          nombreItem: 'SHAMPOO MI BELLEZA',
          descripcionItem: '',
          precioUnitario: '95.0000',
          descuentoMonto: '',
          subDescuentos: [],
          recargoMonto: '',
          subRecargos: [],
          montoItem: '23750.00',
          impuestosAdicionales: []),
      EcfDetailsModel(
          cantidad: '300.00',
          unidadMedida: '47',
          codigos: [],
          fechaElaboracion: '',
          fechaVencimientoItem: '',
          indicadorFacturacion: '4',
          indicadorBienOServ: '1',
          nombreItem: 'MANTEQUILLA LA MANICERA',
          descripcionItem: '',
          precioUnitario: '150.0000',
          descuentoMonto: '',
          subDescuentos: [],
          recargoMonto: '',
          subRecargos: [],
          montoItem: '45000.00',
          impuestosAdicionales: []),
      EcfDetailsModel(
          cantidad: '325.00',
          unidadMedida: '46',
          codigos: [],
          fechaElaboracion: '',
          fechaVencimientoItem: '',
          indicadorFacturacion: '4',
          indicadorBienOServ: '1',
          nombreItem: 'ARROZ CAMPOS',
          descripcionItem: '',
          precioUnitario: '1500.0000',
          descuentoMonto: '',
          subDescuentos: [],
          recargoMonto: '',
          subRecargos: [],
          montoItem: '487500.00',
          impuestosAdicionales: []),
      EcfDetailsModel(
          cantidad: '315.00',
          unidadMedida: '31',
          codigos: [],
          fechaElaboracion: '',
          fechaVencimientoItem: '',
          indicadorFacturacion: '4',
          indicadorBienOServ: '1',
          nombreItem: 'FRESAS DEL CAMPO',
          descripcionItem: '',
          precioUnitario: '115.0000',
          descuentoMonto: '',
          subDescuentos: [],
          recargoMonto: '',
          subRecargos: [],
          montoItem: '36225.00',
          impuestosAdicionales: []),
      EcfDetailsModel(
          cantidad: '215.00',
          unidadMedida: '15',
          codigos: [],
          fechaElaboracion: '',
          fechaVencimientoItem: '',
          indicadorFacturacion: '4',
          indicadorBienOServ: '1',
          nombreItem: 'ACEITE DE SOYA IMPERIAL',
          descripcionItem: '',
          precioUnitario: '700.0000',
          descuentoMonto: '',
          subDescuentos: [],
          recargoMonto: '',
          subRecargos: [],
          montoItem: '150500.00',
          impuestosAdicionales: []),
      EcfDetailsModel(
          cantidad: '145.00',
          unidadMedida: '23',
          codigos: [],
          fechaElaboracion: '',
          fechaVencimientoItem: '',
          indicadorFacturacion: '4',
          indicadorBienOServ: '1',
          nombreItem: 'HABICHUELAS BLANCAS',
          descripcionItem: '',
          precioUnitario: '80.0000',
          descuentoMonto: '',
          subDescuentos: [],
          recargoMonto: '',
          subRecargos: [],
          montoItem: '11600.00',
          impuestosAdicionales: []),
      EcfDetailsModel(
          cantidad: '85.00',
          unidadMedida: '15',
          codigos: [],
          fechaElaboracion: '',
          fechaVencimientoItem: '',
          indicadorFacturacion: '4',
          indicadorBienOServ: '1',
          nombreItem: 'JAB¿N LIQUIDO MAS COLOR',
          descripcionItem: '',
          precioUnitario: '70.0000',
          descuentoMonto: '',
          subDescuentos: [],
          recargoMonto: '',
          subRecargos: [],
          montoItem: '5950.00',
          impuestosAdicionales: []),
      EcfDetailsModel(
          cantidad: '90.00',
          unidadMedida: '46',
          codigos: [],
          fechaElaboracion: '',
          fechaVencimientoItem: '',
          indicadorFacturacion: '4',
          indicadorBienOServ: '1',
          nombreItem: 'AZ¿CAR EL BATEY',
          descripcionItem: '',
          precioUnitario: '100.0000',
          descuentoMonto: '',
          subDescuentos: [],
          recargoMonto: '',
          subRecargos: [],
          montoItem: '9000.00',
          impuestosAdicionales: []),
      EcfDetailsModel(
          cantidad: '32.00',
          unidadMedida: '31',
          codigos: [],
          fechaElaboracion: '',
          fechaVencimientoItem: '',
          indicadorFacturacion: '4',
          indicadorBienOServ: '1',
          nombreItem: 'SALAMI ESPECIAL INDUVECA',
          descripcionItem: '',
          precioUnitario: '135.0000',
          descuentoMonto: '',
          subDescuentos: [],
          recargoMonto: '',
          subRecargos: [],
          montoItem: '4320.00',
          impuestosAdicionales: []),
      EcfDetailsModel(
          cantidad: '55.00',
          unidadMedida: '31',
          codigos: [],
          fechaElaboracion: '',
          fechaVencimientoItem: '',
          indicadorFacturacion: '4',
          indicadorBienOServ: '1',
          nombreItem: 'MANZANAS GALA',
          descripcionItem: '',
          precioUnitario: '300.0000',
          descuentoMonto: '',
          subDescuentos: [],
          recargoMonto: '',
          subRecargos: [],
          montoItem: '16500.00',
          impuestosAdicionales: []),
    ];

    EcfModel ecf = EcfModel(
        tipoEcf: EcfType.e44,
        tempDirName: 'sailyn',
        indicadorMontoGravado: '',
        numeroComprobante: 'E440000000013',
        codigoModificacion: '',
        fechaEmision: fechaEmision,
        fechaVencimiento: '31-12-2025',
        fechaEmisionNcfModificado: '',
        razonModificacion: '',
        tipoIngreso: '01',
        tipoPago: '1',
        formasDePagos: [
          FormaDePago('1', '450000.00'),
          FormaDePago('3', '467095.00')
        ],
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
        montoExento: '917095.00',
        totalItbis: '',
        totalItbis18: '',
        totalItbis16: '',
        totalItbisTasa0: '',
        itbis1: '',
        itbis2: '',
        itbis3: '',
        montoTotal: '917095.00',
        montoPeriodo: '917095.00',
        montoAvancePago: '',
        valorPagar: '917095.00',
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
