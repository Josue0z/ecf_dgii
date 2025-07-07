import 'dart:convert';
import 'dart:io';
import 'package:ecf_dgii/ecf_dgii.dart';
import 'package:ecf_dgii/src/utils/directories.dart';
import 'package:intl/intl.dart';
import 'package:path/path.dart' as path;
import 'package:pointycastle/asymmetric/api.dart';

class EcfModel {
  EcfType tipoEcf;
  String rncEmisor;
  String razonSocialEmisor;
  String rncComprador;
  String nombreComprador;
  String fechaEmision;
  String numeroComprobante;
  String montoTotal;
  String totalItbis;
  String totalItbis18;
  String totalItbis16;
  String montoNeto;
  String montoNeto18;
  String montoNeto16;
  String montoPagado;
  String montoExento;
  String codigoSeguridad = '';
  File? ecfXml;

  String privateKey;
  String certBase64;
  File? seedFile;
  String seedXml = '';
  File? seedSignFile;
  String seedSignXml = '';
  File? ecfFile;
  String ecfSignXml = '';
  List<EcfDetailsModel> items = [];

  late XmlSignerService signerService;

  Map<String, String>? json;

  String tipoIngreso;
  String tipoPago;

  File? xmlAprobacionFile;

  String? xmlAprobacionSign = '';

  String token = '';

  XmlSignerModel? xmlSignerModel;

  EcfModel(
      {required this.tipoEcf,
      required this.rncEmisor,
      required this.razonSocialEmisor,
      required this.rncComprador,
      required this.nombreComprador,
      required this.fechaEmision,
      required this.numeroComprobante,
      required this.montoTotal,
      required this.montoPagado,
      required this.totalItbis,
      required this.totalItbis16,
      required this.totalItbis18,
      required this.montoNeto,
      required this.montoNeto18,
      required this.montoNeto16,
      required this.montoExento,
      required this.tipoIngreso,
      required this.tipoPago,
      required this.privateKey,
      required this.certBase64}) {
    signerService =
        XmlSignerService(rsaPrivateKey: privateKey, certBase64: certBase64);
  }

  String get tipo {
    if (tipoEcf == EcfType.e31) {
      return '31';
    }
    if (tipoEcf == EcfType.e32) {
      return '32';
    }
    if (tipoEcf == EcfType.e34) {
      return '34';
    }
    return '31';
  }

  String get xml {
    if (tipoEcf == EcfType.e32) {
      return xmle32;
    }
    return xmlDefault;
  }

  String get xmlDefault {
    return '''
<?xml version="1.0" encoding="UTF-8"?>
<eCF xmlns="http://www.dgii.gov.do/ECF" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance">
  <Encabezado>
  <IdDoc>
    <TipoeCF>$tipo</TipoeCF>
    <FechaEmision>$fechaEmision</FechaEmision>
    <TipoIngresos>$tipoIngreso</TipoIngresos>
    <NumeroComprobanteFiscal>$numeroComprobante</NumeroComprobanteFiscal>
  </IdDoc>
   <Emisor>
    <RNCEmisor>$rncEmisor</RNCEmisor>
    <RazonSocialEmisor>$razonSocialEmisor</RazonSocialEmisor>
   </Emisor>
   <Comprador>
         <RNCComprador>$rncComprador</RNCComprador>
         <NombreComprador>$nombreComprador</NombreComprador>
   </Comprador>

  </Encabezado>

  <Detalle>${items.map((e) {
              var index = items.indexOf(e);
              return '''
    <Linea>
        <NumeroLinea>${index + 1}</NumeroLinea>\n<Descripcion>${e.descripcion}</Descripcion>\n<Cantidad>${e.cantidad}</Cantidad>\n<PrecioUnitario>${e.precioUnitario}</PrecioUnitario>\n<ITBIS>${e.itbis}</ITBIS>
    </Linea>
              ''';
            }).toList().join('')}\n</Detalle>
  <Totales>
    <TotalBruto>$montoNeto</TotalBruto>
    <TotalITBIS>$totalItbis</TotalITBIS>
    <TotalFactura>$montoTotal</TotalFactura>
  </Totales>

</eCF>
   ''';
  }

  String get xmle32 {
    return '''
 <RFCE xmlns="http://www.dgii.gov.do/ECF/ResumenFacturaConsumoElectronica">
  <Encabezado>
    <IdDoc>
      <TipoeCF>$tipo</TipoeCF>
      <eNCF>$numeroComprobante</eNCF>
      <TipoIngresos>$tipoIngreso</TipoIngresos>
      <TipoPago>$tipoPago</TipoPago>
      <TablaFormasPago>
        <FormaDePago>
          <FormaPago>1</FormaPago>
          <MontoPago>$montoPagado</MontoPago>
        </FormaDePago>
      </TablaFormasPago>
    </IdDoc>
    <Emisor>
      <RNCEmisor>$rncEmisor</RNCEmisor>
      <RazonSocialEmisor>$razonSocialEmisor</RazonSocialEmisor>
      <FechaEmision>$fechaEmision</FechaEmision>
    </Emisor>
    <Comprador>
      <RNCComprador></RNCComprador>
      <IdentificadorExtranjero></IdentificadorExtranjero>
      <RazonSocialComprador>CLIENTE FINAL</RazonSocialComprador>
    </Comprador>
    <Totales>
      <MontoGravadoTotal>$montoNeto</MontoGravadoTotal>
      <MontoGravadoI1>$montoNeto18</MontoGravadoI1>
      <MontoGravadoI2>$montoNeto16</MontoGravadoI2>
      <TotalITBIS>$totalItbis</TotalITBIS>
      <TotalITBIS1>$totalItbis18</TotalITBIS1>
      <TotalITBIS2>$totalItbis16</TotalITBIS2>
      <MontoTotal>$montoTotal</MontoTotal>
      <MontoExento>$montoExento</MontoExento>
    </Totales>
    <CodigoSeguridadeCF>[code]</CodigoSeguridadeCF>
  </Encabezado>
</RFCE>

   ''';
  }

  String get xmlAprobacion {
    final now = DateTime.now();
    final fechaHora = DateFormat('dd-MM-yyyy HH:mm:ss').format(now);

    return '''
    <AprobacionComercial xmlns="http://www.dgii.gov.do/ECF/AprobacionComercial">
    <RNCEmisor>$rncEmisor</RNCEmisor>
    <eNCF>$numeroComprobante</eNCF>
    <FechaEmision>$fechaEmision</FechaEmision>
    <MontoTotal>$montoTotal</MontoTotal>
    <RNCComprador>$rncComprador</RNCComprador>
    <Estado>1</Estado>
    <FechaHoraAprobacionComercial>$fechaHora</FechaHoraAprobacionComercial>
    </AprobacionComercial>
  ''';
  }

  Future<void> downloadEcfSeed() async {
    seedFile = await downloadSeed();
    seedXml = await seedFile?.readAsString() ?? '';
  }

  Future<XmlSignerModel> validarSign() async {
    var xmlSignerModel = await signerService.signXml(
      seedXml,
      File(path.join(dirProject.path, 'temp', 'semilla_firmada.xml')),
    );

    json = await validarSignSeed(xmlSignerModel.xmlFile);
    token = json?['token'] ?? '';
    seedSignFile = xmlSignerModel.xmlFile;
    seedSignXml = xmlSignerModel.xmlStr;
    //await seedFile?.delete();
    //seedXml = '';
    return xmlSignerModel;
  }

  Future<XmlSignerModel> signer() async {
    xmlSignerModel = await signerService.signXml(
        xml,
        File(path.join(
            Directory.systemTemp.path, '$rncEmisor$numeroComprobante.xml')));
    ecfFile = xmlSignerModel!.xmlFile;
    ecfSignXml = xmlSignerModel?.xmlStr ?? '';

    return xmlSignerModel!;
  }

  Future<bool> sendEcfSigned() async {
    try {
      if (ecfFile == null) throw 'Archivo Xml del ecf firmado no existe';

      if (tipoEcf == EcfType.e32) {
        await ecfFile?.writeAsBytes(utf8.encode(ecfSignXml.replaceFirst(
            '[code]', xmlSignerModel?.codigoSeguridad ?? '')));
      }

      await sendEcfSign(ecfFile!, tipoEcf, token);
      //await seedSignFile?.delete();
      //seedSignXml = '';
      //print(ecfFile);

      return true;
    } catch (e) {
      rethrow;
    }
  }

  Future<Map<String, String>> sendAprobacionComercialEcf() async {
    xmlAprobacionFile = File(path.join(
        dirProject.path, 'ACECF_${rncComprador}_$numeroComprobante.xml'));

    var xmlAprobacionSigned =
        await signerService.signXml(xmlAprobacion, xmlAprobacionFile!);
    var result =
        await sendAprobacionComercial(xmlAprobacionSigned.xmlFile, token);
    //await xmlAprobacionFile?.delete();
    return result;
  }
}

class EcfDetailsModel {
  String cantidad;
  String descripcion;
  String precioUnitario;
  String itbis;
  EcfDetailsModel(
      {required this.cantidad,
      required this.descripcion,
      required this.precioUnitario,
      required this.itbis});
}
