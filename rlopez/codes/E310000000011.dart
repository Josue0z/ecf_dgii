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
    final cert = File(path.join(dirProject.path, 'rlopez.p12'));

    String password = 'URESA848';

    AuthCertModel authModel = await getAuthP12(cert: cert, password: password);

    final now = DateTime.now();
    final dateFormat = DateFormat('dd-MM-yyyy');

    final fechaEmision = '';

    List<EcfDetailsModel> items = [
      EcfDetailsModel(
          cantidad: '23.00',
          unidadMedida: '43',
          codigos: [TipoCodigo(tipoCodigo: 'Interno', codigoItem: '1561')],
          indicadorFacturacion: '1',
          indicadorBienOServ: '1',
          nombreItem: 'ZAPATOS',
          descripcionItem: '',
          precioUnitario: '35.0000',
          recargoMonto: '',
          subRecargos: [],
          impuestosAdicionales: [],
          montoItem: '805.00'),
      EcfDetailsModel(
          cantidad: '547.00',
          unidadMedida: '6',
          indicadorFacturacion: '1',
          indicadorBienOServ: '1',
          codigos: [TipoCodigo(tipoCodigo: 'Interno', codigoItem: '1561')],
          nombreItem: 'GALLETAS',
          descripcionItem: '',
          precioUnitario: '142.3371',
          recargoMonto: '',
          subRecargos: [],
          impuestosAdicionales: [],
          montoItem: '77858.39'),
      EcfDetailsModel(
          cantidad: '14.00',
          unidadMedida: '31',
          indicadorFacturacion: '1',
          indicadorBienOServ: '1',
          codigos: [TipoCodigo(tipoCodigo: 'Interno', codigoItem: '1561')],
          nombreItem: 'CAFÉ',
          descripcionItem: '',
          precioUnitario: '53.99',
          recargoMonto: '',
          subRecargos: [],
          impuestosAdicionales: [],
          montoItem: '755.86'),
      EcfDetailsModel(
          cantidad: '25.00',
          unidadMedida: '24',
          indicadorFacturacion: '1',
          indicadorBienOServ: '1',
          codigos: [TipoCodigo(tipoCodigo: 'Interno', codigoItem: '1561')],
          nombreItem: 'LECHE',
          descripcionItem: '',
          fechaElaboracion: '30-12-2019',
          fechaVencimientoItem: '10-10-2020',
          precioUnitario: '63.83',
          recargoMonto: '',
          subRecargos: [],
          impuestosAdicionales: [],
          montoItem: '1595.75'),
    ];
    // 3156.61
    // 77858.39

    EcfModel ecf = EcfModel(
        tipoEcf: EcfType.e31,
        tempDirName: 'rlopez',
        numeroComprobante: 'E310000000011',
        codigoModificacion: '',
        fechaEmision: '01-04-2020',
        fechaVencimiento: '31-12-2028',
        fechaEmisionNcfModificado: '',
        razonModificacion: '',
        tipoIngreso: '01',
        tipoPago: '1',
        formasDePagos: [FormaDePago('1', '95597.70')],
        sucursal: '',
        municipio: '010100',
        provincia: '010000',
        telefonoEmisor1: '809-472-7676',
        telefonoEmisor2: '809-491-1918',
        telefonoEmisor3: '',
        totalPaginas: '',
        rncEmisor: '131123848',
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
        fechaOrdenCompra: '10-11-2018',
        numeroOrdenCompra: '4500352238',
        numeroFacturaInterna: '123456789016',
        numeroPedidoInterno: '123456789016',
        numeroContenedor: '',
        numeroReferencia: '',
        conductor: 'Rafael P¿rez',
        documentoTransporte: '363636',
        ficha: 'J-1234',
        placa: 'A639689',
        rutaTransporte: 'B-Sur',
        zonaTransporte: 'Interior-1',
        numeroAlbaran: '3634258',
        zonaVenta: 'NORTE',
        rutaVenta: '',
        indicadorMontoGravado: '0',
        totalGravado: '81015.00',
        totalGravado18: '81015.00',
        totalGravado16: '',
        totalGravadoTasa0: '',
        montoExento: '',
        totalItbis: '14582.70',
        totalItbis18: '14582.70',
        totalItbis16: '',
        totalItbisTasa0: '',
        itbis1: '18',
        itbis2: '',
        itbis3: '',
        montoPeriodo: '95597.70',
        montoAvancePago: '',
        valorPagar: '95597.70',
        totalItbisRetencion: '',
        totalIsrRetencion: '',
        montoImpuestoAdicional: '',
        impuestosAdicionales: [],
        montoTotal: '95597.70',
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
    var filePdf = File(path.join(tempDirPath, 'rlopez', 'pdfs',
        '${ecf.rncEmisor}${ecf.numeroComprobante}.PDF'));

    await filePdf.create(recursive: true);
    await filePdf.writeAsBytes(await doc.save());
    print(ecf.uriEcf);
    print(ecf.trackId);
    print(ecf.token);

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
