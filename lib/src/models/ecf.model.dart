import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';
import 'package:basic_utils/basic_utils.dart';
import 'package:ecf_dgii/src/types/ecf.dart';
import 'package:ecf_dgii/src/utils/ecf.functions.dart';
import 'package:ecf_dgii/src/utils/xml.signer.dart';
import 'package:path/path.dart' as path;

class EcfModel {
  EcfType tipoEcf;
  String rncEmisor;
  String razonSocialEmisor;
  String rncComprador;
  DateTime fechaEmision;
  String numeroComprobante;
  String montoTotal;
  String totalItbis;
  String? codigoSeguridad;
  File? ecfXml;

  RSAPrivateKey privateKey;
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

  EcfModel(
      {required this.tipoEcf,
      required this.rncEmisor,
      required this.razonSocialEmisor,
      required this.rncComprador,
      required this.fechaEmision,
      required this.numeroComprobante,
      required this.montoTotal,
      required this.totalItbis,
      this.codigoSeguridad,
      required this.privateKey,
      required this.certBase64}) {
    signerService =
        XmlSignerService(privateKey: privateKey, certificateBase64: certBase64);
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
    return '''
<?xml version="1.0" encoding="UTF-8"?>
<ECF xmlns="http://www.dgii.gov.do/ECF" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance">
  <Encabezado>
    <TipoeCF>$tipo</TipoeCF>
    <RNCEmisor>$rncEmisor</RNCEmisor>
    <RazonSocialEmisor>$razonSocialEmisor</RazonSocialEmisor>
    <RNCComprador>$rncComprador</RNCComprador>
    <FechaHoraEmision>${fechaEmision.toIso8601String()}</FechaHoraEmision>
    <NumeroComprobanteFiscal>$numeroComprobante</NumeroComprobanteFiscal>
    <MontoTotal>$montoTotal</MontoTotal>
    <TotalITBIS>$totalItbis</TotalITBIS>
  </Encabezado>
  <Cuerpo>
  <Detalle>${items.map((e) {
              return '''\n<Descripcion>${e.descripcion}</Descripcion>\n<Cantidad>${e.cantidad}</Cantidad>\n<PrecioUnitario>${e.precioUnitario}</PrecioUnitario>\n<ITBIS>${e.itbis}</ITBIS>''';
            }).toList().join('')}\n</Detalle>
  </Cuerpo>
</ECF>
   ''';
  }

  Future<void> downloadEcfSeed() async {
    seedFile = await downloadSeed();
    seedXml = await seedFile?.readAsString() ?? '';
  }

  Future<XmlSignerModel> sendEcfSeed() async {
    final signerModel = await signerService.signXml(seedXml,
        File(path.join(Directory.systemTemp.path, 'semilla_firmada.xml')));
    json = await sendSignSeed(signerModel.xmlFile);
    seedSignFile = signerModel.xmlFile;
    seedSignXml = signerModel.xmlStr;
    await seedFile?.delete();
    seedXml = '';
    return signerModel;
  }

  Future<XmlSignerModel> signer() async {
    var ecfXmlSign = await signerService.signXml(
        xml,
        File(path.join(
            Directory.systemTemp.path, '$rncEmisor$numeroComprobante.xml')));
    ecfFile = ecfXmlSign.xmlFile;
    ecfSignXml = ecfXmlSign.xmlStr;

    return ecfXmlSign;
  }

  Future<bool> sendEcfSigned() async {
    try {
      if (ecfFile == null) throw 'Archivo Xml del ecf firmado no existe';
      await sendEcfSign(
          ecfFile!,
          tipoEcf,
          json?['token'] ??
              base64Encode(Uint8List.fromList([1255, 78555, 1245, 145])));
      await seedSignFile?.delete();
      seedSignXml = '';
      return true;
    } catch (e) {
      rethrow;
    }
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
