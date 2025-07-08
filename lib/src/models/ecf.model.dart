import 'dart:convert';
import 'dart:io';
import 'package:ecf_dgii/ecf_dgii.dart';
import 'package:ecf_dgii/src/utils/directories.dart';
import 'package:intl/intl.dart';
import 'package:path/path.dart' as path;

class FormaDePago {
  final String codigo;
  final String monto;

  FormaDePago(this.codigo, this.monto);
}

class EcfModel {
  EcfType tipoEcf;
  String rncEmisor;
  String razonSocialEmisor;
  String nombreComercial;
  String rncComprador;
  String razonSocialComprador;
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

  Map<String, dynamic>? json;

  String tipoIngreso;

  String tipoPago;

  String formaPago;

  String indicadorMontoGravado;

  String fechaVencimiento;

  String direccionEmisor;

  String sucursal;

  String municipio;

  String provincia;

  String telefonoEmisor1;

  String telefonoEmisor2;

  String telefonoEmisor3;

  String correoEmisor;

  String website;

  String codigoVendedor;

  String numeroFacturaInterna;

  String numeroPedidoInterno;

  String zonaVenta;

  String informacionAdicionalEmisor;

  String contactoComprador;

  String correoComprador;

  String direccionComprador;

  String municipioComprador;

  String provinciaComprador;

  String fechaEntrega;

  String fechaOrdenCompra;

  String numeroOrdenCompra;

  String codigoInternoComprador;

  String actividadEconomica;

  String montoRetenidoIsr;

  String porcentajeRetencionIsr;

  String baseImponibleIsr;

  String montoRetenidoItbis;

  String porcentajeRetencionItbis;

  String baseImponibleItbis;

  List<FormaDePago> formasDePagos;

  String terminoPago = '4';

  String? bancoPago;

  String? fechaDesde;

  String? fechaHasta;

  File? xmlAprobacionFile;

  String? xmlAprobacionSign = '';

  String token = '';

  String trackId = '';

  XmlSignerModel? xmlSignerModel;

  EcfModel(
      {required this.tipoEcf,
      required this.rncEmisor,
      required this.razonSocialEmisor,
      required this.nombreComercial,
      required this.rncComprador,
      required this.razonSocialComprador,
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
      required this.certBase64,
      required this.formaPago,
      required this.indicadorMontoGravado,
      required this.fechaVencimiento,
      required this.direccionEmisor,
      required this.sucursal,
      required this.municipio,
      required this.provincia,
      required this.telefonoEmisor1,
      required this.telefonoEmisor2,
      required this.telefonoEmisor3,
      required this.correoEmisor,
      required this.website,
      required this.codigoVendedor,
      required this.numeroFacturaInterna,
      required this.numeroPedidoInterno,
      required this.zonaVenta,
      required this.informacionAdicionalEmisor,
      required this.contactoComprador,
      required this.correoComprador,
      required this.direccionComprador,
      required this.municipioComprador,
      required this.provinciaComprador,
      required this.fechaEntrega,
      required this.fechaOrdenCompra,
      required this.numeroOrdenCompra,
      required this.codigoInternoComprador,
      required this.actividadEconomica,
      required this.montoRetenidoIsr,
      required this.porcentajeRetencionIsr,
      required this.baseImponibleIsr,
      required this.montoRetenidoItbis,
      required this.porcentajeRetencionItbis,
      required this.baseImponibleItbis,
      required this.formasDePagos,
      required this.terminoPago,
      this.bancoPago = '',
      this.fechaDesde = '',
      this.fechaHasta = ''}) {
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
    final now = DateTime.now();
    final fechaHoraFirma = DateFormat('dd-MM-yyyy HH:mm:ss').format(now);

    var ecfXsdFile = path.join(dirProject.path, 'e-CF 31 v.1.0.xsd');
    return '''
<ECF xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xsi:noNamespaceSchemaLocation="$ecfXsdFile">
  <Encabezado>
    <Version>1.0</Version>
    <IdDoc>
      <TipoeCF>$tipo</TipoeCF>
      <eNCF>$numeroComprobante</eNCF>
      <FechaVencimientoSecuencia>$fechaVencimiento</FechaVencimientoSecuencia>
      <IndicadorMontoGravado>$indicadorMontoGravado</IndicadorMontoGravado>
      <TipoIngresos>$tipoIngreso</TipoIngresos>
      <TipoPago>$tipoPago</TipoPago>
      <TerminoPago>$terminoPago</TerminoPago>
      <TablaFormasPago>
        ${formasDePagos.map((e) {
      return '''
         <FormaDePago>
          <FormaPago>${e.codigo}</FormaPago>
          <MontoPago>${e.monto}</MontoPago>
        </FormaDePago>
          ''';
    }).join()}
      </TablaFormasPago>
      <BancoPago>$bancoPago</BancoPago>
    </IdDoc>
    <Emisor>
      <RNCEmisor>$rncEmisor</RNCEmisor>
      <RazonSocialEmisor>$razonSocialEmisor</RazonSocialEmisor>
      <Sucursal>$sucursal</Sucursal>
      <DireccionEmisor>$direccionEmisor</DireccionEmisor>
      <Provincia>$provincia</Provincia>
      <NumeroFacturaInterna>$numeroFacturaInterna</NumeroFacturaInterna>
      <NumeroPedidoInterno>$numeroPedidoInterno</NumeroPedidoInterno>
      <RutaVenta>$zonaVenta</RutaVenta>
      <FechaEmision>$fechaEmision</FechaEmision>
    </Emisor>
    <Comprador>
      <RNCComprador>$rncComprador</RNCComprador>
      <RazonSocialComprador>$razonSocialComprador</RazonSocialComprador>
      <ContactoComprador>$contactoComprador</ContactoComprador>
      <CorreoComprador>$correoComprador</CorreoComprador>
      <DireccionComprador>$direccionComprador</DireccionComprador>
      <MunicipioComprador>$municipioComprador</MunicipioComprador>
      <ProvinciaComprador>$provinciaComprador</ProvinciaComprador>
      <FechaEntrega>$fechaEntrega</FechaEntrega>
      <CodigoInternoComprador>$codigoInternoComprador</CodigoInternoComprador>
    </Comprador>
    <Totales>
      <MontoGravadoI3>0.00</MontoGravadoI3>
      <MontoExento>$montoExento</MontoExento>
      <ITBIS2>0</ITBIS2>
      <ITBIS3>0</ITBIS3>
      <TotalITBIS>$totalItbis</TotalITBIS>
      <TotalITBIS1>$totalItbis16</TotalITBIS1>
      <TotalITBIS2>$totalItbis18</TotalITBIS2>
      <MontoImpuestoAdicional>0.01</MontoImpuestoAdicional>
      <MontoTotal>$montoTotal</MontoTotal>
      <SaldoAnterior>0.00</SaldoAnterior>
      <MontoAvancePago>$montoPagado</MontoAvancePago>
      <ValorPagar>0.00</ValorPagar>
      <TotalITBISRetenido>$montoRetenidoItbis</TotalITBISRetenido>
      <TotalITBISPercepcion>0.00</TotalITBISPercepcion>
    </Totales>
  </Encabezado>
  <DetallesItems>
     ${items.map((e) {
      var index = items.indexOf(e);
      return '''
 <Item>
    <NumeroLinea>${index + 1}</NumeroLinea>
    <TablaCodigosItem>
      <CodigosItem>
        <TipoCodigo>${e.tipoCodigo}</TipoCodigo>
        <CodigoItem>${e.codigoItem}</CodigoItem>
      </CodigosItem>
    </TablaCodigosItem>
    <IndicadorFacturacion>${index + 1}</IndicadorFacturacion>
    <NombreItem>${e.descripcion}</NombreItem>
    <IndicadorBienoServicio>${e.indicadorBienOServ}</IndicadorBienoServicio>
    <CantidadItem>${e.cantidad}</CantidadItem>
    <UnidadMedida>${e.unidadMedida}</UnidadMedida>
    <CantidadReferencia>${e.cantidad}</CantidadReferencia>
    <PrecioUnitarioReferencia>${e.precioUnitario}</PrecioUnitarioReferencia>
    <PrecioUnitarioItem>${e.precioUnitario}</PrecioUnitarioItem>
    <MontoItem>${e.montoItem}</MontoItem>
  </Item>
     ''';
    }).join()}
  </DetallesItems>
  <Subtotales>
    <Subtotal>
      <NumeroSubTotal>1</NumeroSubTotal>
      <SubTotalMontoGravadoTotal>$montoNeto</SubTotalMontoGravadoTotal>
      <SubTotalMontoGravadoI1>$montoNeto16</SubTotalMontoGravadoI1>
      <SubTotalMontoGravadoI2>$montoNeto18</SubTotalMontoGravadoI2>
      <SubTotalMontoGravadoI3>0.00</SubTotalMontoGravadoI3>
      <SubTotaITBIS2>$totalItbis18</SubTotaITBIS2>
      <SubTotaITBIS3>0.00</SubTotaITBIS3>
      <SubTotalImpuestoAdicional>0.00</SubTotalImpuestoAdicional>
      <SubTotalExento>$montoExento</SubTotalExento>
      <MontoSubTotal>$montoNeto</MontoSubTotal>
    </Subtotal>
    <Subtotal>
      <Orden>1</Orden>
      <SubTotalMontoGravadoI2>$montoNeto18</SubTotalMontoGravadoI2>
      <SubTotalMontoGravadoI3>0.00</SubTotalMontoGravadoI3>
      <SubTotaITBIS>$totalItbis</SubTotaITBIS>
      <SubTotaITBIS2>$totalItbis18</SubTotaITBIS2>
      <SubTotaITBIS3>0.00</SubTotaITBIS3>
      <SubTotalImpuestoAdicional>0.00</SubTotalImpuestoAdicional>
      <Lineas>${items.length}</Lineas>
    </Subtotal>
  </Subtotales>
  <DescuentosORecargos>
    <DescuentoORecargo>
      <NumeroLinea>1</NumeroLinea>
      <TipoAjuste>R</TipoAjuste>
      <IndicadorNorma1007>0</IndicadorNorma1007>
      <DescripcionDescuentooRecargo>descuento</DescripcionDescuentooRecargo>
      <TipoValor>\$</TipoValor>
      <ValorDescuentooRecargo>0.01</ValorDescuentooRecargo>
      <MontoDescuentooRecargo>0.01</MontoDescuentooRecargo>
      <MontoDescuentooRecargoOtraMoneda>0.01</MontoDescuentooRecargoOtraMoneda>
      <IndicadorFacturacionDescuentooRecargo>1</IndicadorFacturacionDescuentooRecargo>
    </DescuentoORecargo>
  </DescuentosORecargos>
  <Paginacion>
    <Pagina>
      <PaginaNo>1</PaginaNo>
      <NoLineaDesde>1</NoLineaDesde>
      <SubtotalMontoGravado1Pagina>$montoNeto</SubtotalMontoGravado1Pagina>
      <SubtotalMontoGravado2Pagina>0.00</SubtotalMontoGravado2Pagina>
      <SubtotalMontoGravado3Pagina>0.00</SubtotalMontoGravado3Pagina>
      <SubtotalExentoPagina>0.00</SubtotalExentoPagina>
      <SubtotalItbisPagina>$totalItbis</SubtotalItbisPagina>
      <SubtotalImpuestoAdicionalPagina>0.01</SubtotalImpuestoAdicionalPagina>
      <SubtotalMontoNoFacturablePagina>0.01</SubtotalMontoNoFacturablePagina>
    </Pagina>
  </Paginacion>
  <FechaHoraFirma>$fechaHoraFirma</FechaHoraFirma>
</ECF>
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
            dirProject.path, 'temp', '$rncEmisor$numeroComprobante.xml')));
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

      var res = await sendEcfSign(ecfFile!, tipoEcf, token);

      trackId = res['trackId'];

      print(token);

      //await seedSignFile?.delete();
      //seedSignXml = '';
      //print(ecfFile);

      return true;
    } catch (e) {
      rethrow;
    }
  }

  Future<Map<String, String>> sendAprobacionComercialEcf() async {
    xmlAprobacionFile = File(path.join(dirProject.path, 'temp',
        'ACECF_${rncComprador}_$numeroComprobante.xml'));

    var xmlAprobacionSigned =
        await signerService.signXml(xmlAprobacion, xmlAprobacionFile!);
    var result =
        await sendAprobacionComercial(xmlAprobacionSigned.xmlFile, token);
    //await xmlAprobacionFile?.delete();
    return result;
  }

  Future<Map<String, dynamic>> getEcfStatusData() async {
    var res = await getEcfStatus(trackId, token);
    print('AQUI');
    print(res);
    return res;
  }
}

class EcfDetailsModel {
  String cantidad;
  String tipoCodigo;
  String codigoItem;
  String descripcion;
  String indicadorBienOServ;
  String unidadMedida;
  String precioUnitario;
  String montoItem;
  String itbis;
  EcfDetailsModel(
      {required this.cantidad,
      required this.tipoCodigo,
      required this.codigoItem,
      required this.descripcion,
      required this.indicadorBienOServ,
      required this.unidadMedida,
      required this.precioUnitario,
      required this.montoItem,
      required this.itbis});
}
