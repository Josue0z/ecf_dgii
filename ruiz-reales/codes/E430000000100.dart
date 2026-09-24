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
          cantidad: '1.00',
          unidadMedida: '43',
          indicadorFacturacion: '4',
          indicadorBienOServ: '2',
          nombreItem: 'Gastos de Oficina',
          descripcionItem: '',
          precioUnitario: '115000.0000',
          descuentoMonto: '',
          subDescuentos: [],
          montoItem: '115000.00',
          codigos: [
            TipoCodigo(
              tipoCodigo: 'Interno',
              codigoItem: '1521'
            )
          ],
          impuestosAdicionales: []),

      EcfDetailsModel(
          cantidad: '1.00',
          unidadMedida: '43',
          indicadorFacturacion: '4',
          indicadorBienOServ: '2',
          nombreItem: 'Gastos de Transporte',
          descripcionItem: '',
          precioUnitario: '79000.00',
          descuentoMonto: '',
          subDescuentos: [],
          montoItem: '79000.00',
          codigos: [
            TipoCodigo(
              tipoCodigo: 'Interno',
              codigoItem: '1521'
            )
          ],
          impuestosAdicionales: []),

      
      EcfDetailsModel(
          cantidad: '1.00',
          unidadMedida: '43',
          indicadorFacturacion: '4',
          indicadorBienOServ: '2',
          nombreItem: 'Mantenimiento',
          descripcionItem: '',
          precioUnitario: '23980.00',
          descuentoMonto: '',
          subDescuentos: [],
          montoItem: '23980.00',
          codigos: [
            TipoCodigo(
              tipoCodigo: 'Interno',
              codigoItem: '1521'
            )
          ],
          impuestosAdicionales: []),


            EcfDetailsModel(
          cantidad: '2.00',
          unidadMedida: '43',
          indicadorFacturacion: '4',
          indicadorBienOServ: '2',
          nombreItem: 'Gastos varios',
          descripcionItem: '',
          precioUnitario: '17895.0000',
          descuentoMonto: '',
          subDescuentos: [],
          montoItem: '35790.00',
          codigos: [
            TipoCodigo(
              tipoCodigo: 'Interno',
              codigoItem: '1521'
            )
          ],
          impuestosAdicionales: []),
    ];

    EcfModel ecf = EcfModel(
        tipoEcf: EcfType.e43,
        tempDirName: 'ruiz',
        indicadorMontoGravado: '',
        numeroComprobante: 'E430000000101',
        codigoModificacion: '',
        fechaEmision: fechaEmision,
        fechaVencimiento: '31-12-2028',
        fechaEmisionNcfModificado: '',
        razonModificacion: '',
        tipoIngreso: '',
        tipoPago: '',
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
        rncEmisor: '00108998030',
        razonSocialEmisor: 'ENRIQUE EMPERADOR RUIZ ZAPATA',
        nombreComercial: 'ENRIQUE EMPERADOR RUIZ ZAPATA',
        correoEmisor:
            'DOCUMENTOSELECTRONICOSDE0612345678969789+9000000000000000000000000000001@123.COM',
        website: 'www.facturaelectronica.com',
        actividadEconomica: '',
        codigoVendedor: '',
        informacionAdicionalEmisor: '',
        rncComprador: '',
        razonSocialComprador: '',
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
        totalGravado: '',
        totalGravado18: '',
        totalGravado16: '',
        totalGravadoTasa0: '',
        montoExento: '253770.00',
        totalItbis: '',
        totalItbis18: '',
        totalItbis16: '',
        totalItbisTasa0: '',
        itbis1: '',
        itbis2: '',
        itbis3: '',
        montoTotal: '253770.00',
        montoPeriodo: '253770.00',
        montoAvancePago: '',
        valorPagar: '253770.00',
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
    var filePdf = File(path.join(tempDirPath, 'ruiz', 'pdfs',
        '${ecf.rncEmisor}${ecf.numeroComprobante}.PDF'));

    await filePdf.create(recursive: true);
    await filePdf.writeAsBytes(await doc.save());

    var data = await ecf.obtenerEcfEstadoDatos();

    
    print(ecf.uriEcf);
    print(ecf.trackId);
    print(ecf.token);

    print(data);

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
