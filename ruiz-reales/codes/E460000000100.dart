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
    final cert = File(path.join(dirProject.path, 'ruiz.p12'));

    String password = 'URESA030';

    AuthCertModel authModel = await getAuthP12(cert: cert, password: password);

    final now = DateTime.now();
    final dateFormat = DateFormat('dd-MM-yyyy');
    final fechaEmision = '01-04-2020';

    List<EcfDetailsModel> items = [
      EcfDetailsModel(
          cantidad: '100.00',
          unidadMedida: '43',
          codigos: [TipoCodigo(tipoCodigo: 'INTERNA', codigoItem: '123456')],
          indicadorFacturacion: '3',
          indicadorBienOServ: '1',
          nombreItem: 'AGUACATE CRIOLLO',
          descripcionItem: '',
          precioUnitario: '18000.00',
          descuentoMonto: '',
          subDescuentos: [],
          impuestosAdicionales: [],
          otraMonedaDetalles: [],
          montoItem: '1800000.00'),
    ];

    EcfModel ecf = EcfModel(
        tipoEcf: EcfType.e46,
        tempDirName: 'ruiz',
        indicadorMontoGravado: '',
        numeroComprobante: 'E460000000101',
        codigoModificacion: '',
        fechaEmision: fechaEmision,
        fechaVencimiento: '31-12-2028',
        fechaEmisionNcfModificado: '',
        razonModificacion:
            'ANULACION DEL ENCF31 CON SECUENCIA QUE FINALIZA EN 61',
        tipoIngreso: '01',
        tipoPago: '2',
        terminoPago: '1 mes',
        fechaLimitePago: '06-05-2020',
        formasDePagos: [FormaDePago('2', '1800000.00')],
        sucursal: '',
        direccionEmisor:
            'AVE. ISABEL AGUIAR NO. 269, ZONA INDUSTRIAL DE HERRERA',
        municipio: '010101',
        provincia: '010000',
        telefonoEmisor1: '809-472-7676',
        telefonoEmisor2: '809-491-1918',
        telefonoEmisor3: '',
        totalPaginas: '',
        rncEmisor: '00108998030',
        razonSocialEmisor: 'ENRIQUE EMPERADOR RUIZ ZAPATA',
        nombreComercial: 'ENRIQUE EMPERADOR RUIZ ZAPATA',
        correoEmisor:
            'DOCUMENTOSELECTRONICOSDE0612345678969789+9000000000000000000000000000001@123.COM',
        website: 'www.facturaelectronica.com',
        actividadEconomica: '',
        codigoVendedor:
            'AA0000000100000000010000000002000000000300000000050000000006',
        informacionAdicionalEmisor: '',
        rncComprador: '131880681',
        razonSocialComprador: 'ZONA FRANCA LOI',
        nombreComprador: '',
        contactoComprador: 'MARCOS LLUBERES',
        correoComprador: 'MARCOSLLUBERES@KKKK.COM',
        direccionComprador: 'ZONA HAINA',
        municipioComprador: '010100',
        provinciaComprador: '010000',
        codigoInternoComprador: '10633441',
        fechaEmbarque: '10-04-2020',
        numeroEmbarque: '10010-1207-000254',
        numeroContenedor: 'ERTY227958722',
        numeroReferencia: '1448',
        nombrePuertoEmbarque: 'ZONA HAINA',
        condicionesEntrega: 'FOB',
        totalFob: '1800.00',
        seguro: '250.00',
        flete: '22.00',
        totalCif: '2000.00',
        regimenAduanero: 'EXPORTACION NACIONAL',
        nombrePuertoSalida: 'DOSDQ',
        nombrePuertoDesembarque: 'PTO RICO',
        pesoBruto: '25000.00',
        pesoNeto: '24878.00',
        unidadPesoBruto: '21',
        unidadPesoNeto: '21',
        cantidadBulto: '250.00',
        unidadBulto: '25',
        volumenBulto: '45',
        unidadVolumen: '27',
        viaTransporte: '02',
        paisOrigen: 'REPUBLICA DOMINICANA',
        direccionDestino: 'CALLE GUALLUBI NO. 09',
        paisDestino: 'PUERTO RICO',
        fechaEntrega: '07-04-2020',
        contactoEntrega: 'JACINTO MANON',
        direccionEntrega: 'ZONA HAINA',
        telefonoAdicional: '809-555-5050',
        fechaOrdenCompra: '10-03-2020',
        numeroOrdenCompra: '4500352230',
        numeroFacturaInterna: '123456789016',
        numeroPedidoInterno: '123456789016',
        zonaVenta: '',
        rutaVenta: '',
        conductor: '',
        documentoTransporte: '',
        ficha: '',
        placa: '',
        rutaTransporte: '',
        zonaTransporte: '',
        numeroAlbaran: '56789UJILLL',
        totalGravado: '1800000.00',
        totalGravado18: '',
        totalGravado16: '',
        totalGravadoTasa0: '1800000.00',
        montoExento: '',
        totalItbis: '0.00',
        totalItbis18: '',
        totalItbis16: '',
        totalItbisTasa0: '0.00',
        itbis1: '',
        itbis2: '',
        itbis3: '0',
        montoTotal: '1800000.00',
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
    var filePdf = File(path.join(tempDirPath, 'ruiz', 'pdfs',
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
