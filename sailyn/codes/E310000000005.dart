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
          cantidad: '21.00',
          unidadMedida: '43',
          indicadorFacturacion: '1',
          indicadorBienOServ: '1',
          nombreItem: 'LAPICES',
          descripcionItem: '',
          precioUnitario: '35.0000',
          descuentoMonto: '',
          subDescuentos: [],
          recargoMonto: '',
          subRecargos: [],
          impuestosAdicionales: [],
          montoItem: '735.00'),
      EcfDetailsModel(
          cantidad: '547.00',
          unidadMedida: '6',
          indicadorFacturacion: '2',
          indicadorBienOServ: '1',
          nombreItem: 'GALLETAS',
          descripcionItem: '',
          precioUnitario: '145.0000',
          descuentoMonto: '',
          subDescuentos: [],
          recargoMonto: '',
          subRecargos: [],
          impuestosAdicionales: [],
          montoItem: '79315.00'),
      EcfDetailsModel(
          cantidad: '14.00',
          unidadMedida: '31',
          indicadorFacturacion: '3',
          indicadorBienOServ: '1',
          nombreItem: 'PAN',
          descripcionItem: '',
          precioUnitario: '55.0000',
          descuentoMonto: '',
          subDescuentos: [],
          recargoMonto: '',
          subRecargos: [],
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
          impuestosAdicionales: [],
          montoItem: '875.00'),
    ];

    EcfModel ecf = EcfModel(
        tipoEcf: EcfType.e31,
        tempDirName: 'sailyn',
        numeroComprobante: 'E310000000005',
        codigoModificacion: '',
        fechaEmision: '01-04-2020',
        fechaVencimiento: '31-12-2025',
        fechaEmisionNcfModificado: '',
        razonModificacion: '',
        tipoIngreso: '01',
        tipoPago: '1',
        formasDePagos: [FormaDePago('1', '83320.00')],
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
        fechaEmbarque: '08-06-2020',
        fechaOrdenCompra: '10-11-2018',
        numeroOrdenCompra: '4500352238',
        numeroFacturaInterna: '123456789016',
        numeroPedidoInterno: '123456789016',
        numeroContenedor: '1025536',
        numeroReferencia: '121517',
        numeroEmbarque: '1550523',
        pesoBruto: '25.00',
        pesoNeto: '24.50',
        unidadPesoBruto: '23',
        unidadPesoNeto: '23',
        cantidadBulto: '1.00',
        unidadBulto: '6',
        volumenBulto: '1.00',
        unidadVolumen: '6',
        zonaVenta: 'NORTE',
        rutaVenta: '',
        indicadorMontoGravado: '1',
        totalGravado: '70522.19',
        totalGravado18: '622.88',
        totalGravado16: '69129.31',
        totalGravadoTasa0: '770.00',
        montoExento: '1625.00',
        totalItbis: '11172.81',
        totalItbis18: '112.12',
        totalItbis16: '11060.69',
        totalItbisTasa0: '0.00',
        itbis1: '18',
        itbis2: '16',
        itbis3: '0',
        montoPeriodo: '83320.00',
        montoAvancePago: '',
        valorPagar: '83320.00',
        totalItbisRetencion: '',
        totalIsrRetencion: '',
        montoImpuestoAdicional: '',
        impuestosAdicionales: [],
        montoTotal: '83320.00',
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
