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
          cantidad: '1.00',
          unidadMedida: '43',
          indicadorFacturacion: '1',
          indicadorBienOServ: '2',
          nombreItem: 'SERVICIO PUBLICIDAD',
          descripcionItem:
              'LOREM IPSUM DOLOR SITI AMET, CONSECTETUR ADIPISCI IT. VESTIBULUM 1234 FERMENTUM E-X, CONSEQUAT (IACULIS) ARCU. PELLENTESQUE RUTRUM DUI EGET SAPIEN DICTUM, EU MOLLIS LECTUS AUCTOR. NUNC ORNARE ERAT QUIS NISL IMPERDIET PORTA. NULLAM VEL PHARETRA LEO, PELLENTESQUE FERMENTUM LECTUS. VIVAMUS ORCI IPSUM, SCELERISQUE QUIS VEHICULA QUIS, TEMPUS VITAE PURUS. ALIQUAM SAGITTIS EROS VITAE ANTE FAUCIBUS AUCTOR. MAECENAS PELLENTESQUE VEL EST IN CONGUE. FUSCE ARCU LIGULA, HENDRERIT EU DOLOR A, FACILISIS GRAVIDA DOLOR. PELLENTESQUE SED ALIQUET DOLOR. MAURIS BIBENDUM VEHICULA DICTUM. ETIAM TEMPUS, ODIO NEC CONSECTETUR IACULIS, ODIO NIBH EGESTAS FELIS, SED VIVERRA MAGNA EX SUSCIPIT AUGUE. PELLENTESQUE VESTIBULUM, LACUS NON MATTIS MOLESTIE, NEQUE LEO FACILISIS URNA, AC SUSCIPIT ERAT NISI ET MAGNA. PRAESENT PLACERAT SED LEO A GRAVIDA. MORBI ID ELIT LACUS. CLASS APTENT TACITI SOCIOSQU AD LITORA TORQUENT PER CONUBIA NOSTRA, PER INCEPTOS HIMENAEOS, CONSECTETUR ADIPISCING ELIT. NUNC ORNARE ERAT QUIS NISL IMP.',
          precioUnitario: '10000.00',
          descuentoMonto: '',
          subDescuentos: [],
          montoItem: '10000.00',
          retencion: Retencion(
              indicadorAgenteRetencionoPercepcion: '1',
              montoITBISRetenido: '1800.00',
              montoISRRetenido: '1000.00'),
          impuestosAdicionales: []),
    ];

    EcfModel ecf = EcfModel(
        tipoEcf: EcfType.e41,
        tempDirName: 'sailyn',
        numeroComprobante: 'E410000000001',
        codigoModificacion: '',
        fechaEmision: fechaEmision,
        fechaVencimiento: '31-12-2025',
        fechaEmisionNcfModificado: '',
        razonModificacion:
            'ANULACION DEL ENCF31 CON SECUENCIA QUE FINALIZA EN 61',
        tipoIngreso: '',
        tipoPago: '1',
        formasDePagos: [FormaDePago('1', '9000.00')],
        sucursal: '',
        direccionEmisor:
            'AVE. ISABEL AGUIAR NO. 269, ZONA INDUSTRIAL DE HERRERA',
        municipio: '010101',
        provincia: '010000',
        telefonoEmisor1: '809-472-7676',
        telefonoEmisor2: '809-491-1918',
        telefonoEmisor3: '',
        totalPaginas: '',
        rncEmisor: '130262812',
        razonSocialEmisor: 'DOCUMENTOS ELECTRONICOS DE 02',
        nombreComercial: '',
        correoEmisor: '',
        website: '',
        actividadEconomica: '',
        codigoVendedor: '',
        informacionAdicionalEmisor: '',
        rncComprador: '131880681',
        razonSocialComprador: 'DOCUMENTOS ELECTRONICOS DE 02',
        nombreComprador: '',
        contactoComprador: '',
        correoComprador: 'MARCOSLATIPLOL@KKKK.COM',
        telefonoAdicional: '',
        direccionComprador:
            'CALLE JACINTO DE LA CONCHA FELIZ ESQUINA 27 DE FEBRERO,FRENTE A DOMINO',
        municipioComprador: '010100',
        provinciaComprador: '010000',
        codigoInternoComprador: '',
        fechaEntrega: '',
        fechaOrdenCompra: '',
        numeroOrdenCompra: '',
        numeroFacturaInterna: '',
        numeroPedidoInterno: '',
        zonaVenta: '',
        rutaVenta: '',
        indicadorMontoGravado: '0',
        totalGravado: '10000.00',
        totalGravado18: '10000.00',
        totalGravado16: '',
        totalGravadoTasa0: '',
        montoExento: '',
        totalItbis: '1800.00',
        totalItbis18: '1800.00',
        totalItbis16: '',
        totalItbisTasa0: '',
        itbis1: '18',
        itbis2: '',
        itbis3: '',
        montoTotal: '11800.00',
        montoPeriodo: '',
        montoAvancePago: '',
        valorPagar: '11800.00',
        totalItbisRetencion: '1800.00',
        totalIsrRetencion: '1000.00',
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
