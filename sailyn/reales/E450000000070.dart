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
          unidadMedida: '6',
          cantidadReferencia: '24',
          unidadReferencia: '5',
          subCantidades: [
            SubCantidad(subCantidad: '0.355', codigoSubCantidad: '24')
          ],
          gradosAlcohol: '5.00',
          precioUnitarioReferencia: '65.00',
          indicadorFacturacion: '1',
          indicadorBienOServ: '1',
          nombreItem: 'PTE. CJ 24/12OZ',
          descripcionItem: '',
          precioUnitario: '900.0000',
          descuentoMonto: '',
          subDescuentos: [],
          impuestosAdicionales: [
            ImpuestoAdicional(tipoImpuesto: '006'),
            ImpuestoAdicional(tipoImpuesto: '023')
          ],
          otraMonedaDetalles: [
            OtraMonedaDetalle(
                precioOtraMoneda: '16.27',
                descuentoOtraMoneda: '',
                recargoOtraMoneda: '',
                montoItemOtraMoneda: '325.50')
          ],
          montoItem: '18000.00'),
      EcfDetailsModel(
          cantidad: '40.00',
          unidadMedida: '6',
          cantidadReferencia: '48',
          unidadReferencia: '5',
          subCantidades: [
            SubCantidad(subCantidad: '0.355', codigoSubCantidad: '24')
          ],
          gradosAlcohol: '5.00',
          precioUnitarioReferencia: '130.00',
          indicadorFacturacion: '1',
          indicadorBienOServ: '1',
          nombreItem: 'PTE. CJ 48/12OZ',
          descripcionItem: '',
          precioUnitario: '1800.0000',
          descuentoMonto: '100.00',
          subDescuentos: [],
          impuestosAdicionales: [
            ImpuestoAdicional(tipoImpuesto: '006'),
            ImpuestoAdicional(tipoImpuesto: '023')
          ],
          otraMonedaDetalles: [
            OtraMonedaDetalle(
                precioOtraMoneda: '32.55',
                descuentoOtraMoneda: '',
                recargoOtraMoneda: '',
                montoItemOtraMoneda: '1301.99')
          ],
          montoItem: '72000.00'),
      EcfDetailsModel(
          cantidad: '50.00',
          unidadMedida: '6',
          cantidadReferencia: '48',
          unidadReferencia: '5',
          subCantidades: [
            SubCantidad(subCantidad: '0.355', codigoSubCantidad: '24')
          ],
          gradosAlcohol: '5.00',
          precioUnitarioReferencia: '130.00',
          indicadorFacturacion: '1',
          indicadorBienOServ: '1',
          nombreItem: 'PTE. CJ 48/12OZ',
          descripcionItem: '',
          precioUnitario: '1800.0000',
          descuentoMonto: '',
          subDescuentos: [],
          impuestosAdicionales: [
            ImpuestoAdicional(tipoImpuesto: '006'),
            ImpuestoAdicional(tipoImpuesto: '023')
          ],
          otraMonedaDetalles: [
            OtraMonedaDetalle(
                precioOtraMoneda: '32.55',
                descuentoOtraMoneda: '',
                recargoOtraMoneda: '',
                montoItemOtraMoneda: '1627.49')
          ],
          montoItem: '90000.00'),
    ];

    EcfModel ecf = EcfModel(
        tipoEcf: EcfType.e45,
        tempDirName: 'sailyn-reales',
        indicadorMontoGravado: '0',
        numeroComprobante: 'E450000000071',
        codigoModificacion: '',
        fechaEmision: fechaEmision,
        fechaVencimiento: '31-12-2025',
        fechaEmisionNcfModificado: '',
        razonModificacion:
            'ANULACION DEL ENCF31 CON SECUENCIA QUE FINALIZA EN 61',
        tipoIngreso: '01',
        tipoPago: '1',
        formasDePagos: [FormaDePago('1', '324222.49')],
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
        fechaEmbarque: '08-06-2020',
        numeroEmbarque: '1550523',
        numeroOrdenCompra: '4500352238',
        numeroFacturaInterna: '123456789016',
        numeroPedidoInterno: '123456789016',
        numeroContenedor: '1025536',
        numeroReferencia: '121517',
        zonaVenta: 'NORTE',
        rutaVenta: '',
        pesoBruto: '25.00',
        pesoNeto: '24.50',
        unidadPesoBruto: '23',
        unidadPesoNeto: '23',
        cantidadBulto: '1.00',
        unidadBulto: '6',
        volumenBulto: '1.00',
        unidadVolumen: '6',
        conductor: 'Rafael Perez',
        documentoTransporte: '363636',
        ficha: 'J-1234',
        placa: 'A639689',
        rutaTransporte: 'B-Sur',
        zonaTransporte: 'Interior-1',
        numeroAlbaran: '3634258',
        totalGravado: '180000.00',
        totalGravado18: '180000.00',
        totalGravado16: '',
        totalGravadoTasa0: '',
        montoExento: '',
        totalItbis: '49457.67',
        totalItbis18: '49457.67',
        totalItbis16: '',
        totalItbisTasa0: '',
        itbis1: '18',
        itbis2: '',
        itbis3: '',
        montoTotal: '324222.49',
        montoPeriodo: '324222.49',
        montoAvancePago: '',
        valorPagar: '324222.49',
        totalItbisRetencion: '',
        totalIsrRetencion: '',
        montoImpuestoAdicional: '94764.83',
        impuestosAdicionales: [
          ImpuestoAdicional(
              tipoImpuesto: '006',
              tasaImpuestoAdicional: '633.85',
              montoImpuestoSelectivoConsumoEspecifico: '54004.02'),
          ImpuestoAdicional(
              tipoImpuesto: '023',
              tasaImpuestoAdicional: '10',
              montoImpuestoSelectivoConsumoAdvalorem: '40760.81')
        ],
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
