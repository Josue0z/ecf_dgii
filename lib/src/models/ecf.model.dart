import 'dart:io';
import 'package:ecf_dgii/ecf_dgii.dart';
import 'package:ecf_dgii/src/utils/directories.dart';
import 'package:intl/intl.dart';
import 'package:path/path.dart' as path;

import 'package:xml/xml.dart';

class SubDescuento {
  String tipoSubDescuento;
  String subDescuentoPorcentaje;
  String montoSubDescuento;
  SubDescuento(
      {required this.tipoSubDescuento,
      required this.subDescuentoPorcentaje,
      required this.montoSubDescuento});

  @override
  String toString() {
    return ''
        'SubDescuento(tipoSubDescuento: $tipoSubDescuento, subDescuentoPorcentaje: $subDescuentoPorcentaje, montoSubDescuento: $montoSubDescuento)';
  }

  toMap() {
    return {
      'tipoSubDescuento': tipoSubDescuento,
      'subDescuentoPorcentaje': subDescuentoPorcentaje,
      'montoSubDescuento': montoSubDescuento,
    };
  }
}

class SubRecargo {
  String tipoSubRecargo;
  String subRecargoPorcentaje;
  String montoSubRecargo;
  SubRecargo(
      {required this.tipoSubRecargo,
      required this.subRecargoPorcentaje,
      required this.montoSubRecargo});

  @override
  toString() {
    return '''
        'SubRecargo(tipoSubRecargo: $tipoSubRecargo, subRecargoPorcentaje: $subRecargoPorcentaje, montoSubRecargo: $montoSubRecargo)''';
  }

  toMap() {
    return {
      'tipoSubRecargo': tipoSubRecargo,
      'subRecargoPorcentaje': subRecargoPorcentaje,
      'montoSubRecargo': montoSubRecargo,
    };
  }
}

class FormaDePago {
  final String codigo;
  final String monto;

  FormaDePago(this.codigo, this.monto);
}

class Pagina {
  String noLineaDesde;
  String noLineaHasta;
  String subtotalMontoGravadoPagina;
  String subtotalMontoGravado1Pagina;
  String subtotalMontoGravado2Pagina;
  String subtotalMontoGravado3Pagina;
  String subtotalExentoPagina;
  String subtotalItbisPagina;
  String subtotalItbis1Pagina;
  String subtotalItbis2Pagina;
  String subtotalItbis3Pagina;
  String subtotalImpuestoAdicionalPagina;
  String subtotalImpuestoSelectivoConsumoEspecificoPagina;
  String subtotalOtrosImpuesto;
  String montoSubtotalPagina;
  Pagina(
      {required this.noLineaDesde,
      required this.noLineaHasta,
      required this.subtotalMontoGravadoPagina,
      required this.subtotalMontoGravado1Pagina,
      required this.subtotalMontoGravado2Pagina,
      required this.subtotalMontoGravado3Pagina,
      required this.subtotalExentoPagina,
      required this.subtotalItbisPagina,
      required this.subtotalItbis1Pagina,
      required this.subtotalItbis2Pagina,
      required this.subtotalItbis3Pagina,
      required this.subtotalImpuestoAdicionalPagina,
      required this.subtotalImpuestoSelectivoConsumoEspecificoPagina,
      required this.subtotalOtrosImpuesto,
      required this.montoSubtotalPagina});
}

class TipoCodigo {
  String? tipoCodigo;
  String? codigoItem;
  TipoCodigo({this.tipoCodigo, this.codigoItem});

  @override
  toString() {
    return '''
        'TipoCodigo(tipoCodigo: $tipoCodigo, codigoItem: $codigoItem)''';
  }

  toMap() {
    return {
      'tipoCodigo': tipoCodigo,
      'codigoItem': codigoItem,
    };
  }
}

class ImpuestoAdicional {
  String? tipoImpuesto;
  String? tasaImpuestoAdicional;
  String? montoImpuestoSelectivoConsumoEspecifico;
  String? montoImpuestoSelectivoConsumoAdvalorem;
  String? otrosImpuestosAdicionales;
  ImpuestoAdicional(
      {this.tipoImpuesto,
      this.tasaImpuestoAdicional,
      this.montoImpuestoSelectivoConsumoEspecifico,
      this.otrosImpuestosAdicionales,
      this.montoImpuestoSelectivoConsumoAdvalorem});
  toMap() {
    return {
      'tipoImpuesto': tipoImpuesto,
      'tasaImpuestoAdicional': tasaImpuestoAdicional,
      'montoImpuestoSelectivoConsumoEspecifico':
          montoImpuestoSelectivoConsumoEspecifico,
      'montoImpuestoSelectivoConsumoAdvalorem':
          montoImpuestoSelectivoConsumoAdvalorem,
      'otrosImpuestosAdicionales': otrosImpuestosAdicionales,
    };
  }
}

class Retencion {
  String indicadorAgenteRetencionoPercepcion;
  String montoITBISRetenido;
  String montoISRRetenido;
  Retencion(
      {required this.indicadorAgenteRetencionoPercepcion,
      this.montoITBISRetenido = '',
      this.montoISRRetenido = ''});
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

  String totalItbisTasa0;

  String montoImpuestoAdicional;

  List<ImpuestoAdicional> impuestosAdicionales;

  String totalGravado;

  String totalGravado18;

  String totalGravado16;

  String totalGravadoTasa0;

  String itbis1;

  String itbis2;

  String itbis3;

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

  String telefonoAdicional;

  String direccionComprador;

  String municipioComprador;

  String provinciaComprador;

  String fechaEntrega;

  String fechaOrdenCompra;

  String numeroOrdenCompra;

  String codigoInternoComprador;

  String actividadEconomica;

  String porcentajeRetencionIsr;

  String baseImponibleIsr;

  String totalItbisRetencion;

  String totalIsrRetencion;

  String porcentajeRetencionItbis;

  String baseImponibleItbis;

  List<FormaDePago> formasDePagos;

  String terminoPago = '4';

  String bancoPago;

  List<Pagina> paginas;

  String rncOtroContribuyente;

  String? numeroComprobanteModificado;

  String? fechaEmisionNcfModificado;

  String? razonModificacion;

  String? codigoModificacion;

  String? indicadorNotaCredito;

  String? totalPaginas;

  String montoAvancePago;

  String valorPagar;

  String? saldoAnterior;

  String? rutaVenta;

  File? xmlAprobacionFile;

  String? xmlAprobacionSign = '';

  String token = '';

  String trackId = '';

  String fechaHoraFirma = '';

  String fechaFirma = '';

  XmlSignerModel? xmlSignerModel;

  EcfModel(
      {this.tipoEcf = EcfType.e31,
      this.rncEmisor = '',
      this.razonSocialEmisor = '',
      this.nombreComercial = '',
      this.rncComprador = '',
      this.razonSocialComprador = '',
      this.nombreComprador = '',
      this.fechaEmision = '',
      this.fechaVencimiento = '',
      this.numeroComprobante = '',
      this.montoTotal = '',
      this.totalItbis = '',
      this.totalItbis16 = '',
      this.totalItbis18 = '',
      this.totalItbisTasa0 = '',
      this.montoImpuestoAdicional = '',
      this.impuestosAdicionales = const [],
      this.totalGravado = '',
      this.totalGravado18 = '',
      this.totalGravado16 = '',
      this.totalGravadoTasa0 = '',
      this.itbis1 = '',
      this.itbis2 = '',
      this.itbis3 = '',
      this.totalItbisRetencion = '',
      this.totalIsrRetencion = '',
      this.montoExento = '',
      this.tipoIngreso = '',
      this.tipoPago = '',
      this.indicadorMontoGravado = '',
      this.direccionEmisor = '',
      this.sucursal = '',
      this.municipio = '',
      this.provincia = '',
      this.telefonoEmisor1 = '',
      this.telefonoEmisor2 = '',
      this.telefonoEmisor3 = '',
      this.correoEmisor = '',
      this.website = '',
      this.codigoVendedor = '',
      this.numeroFacturaInterna = '',
      this.numeroPedidoInterno = '',
      this.zonaVenta = '',
      this.informacionAdicionalEmisor = '',
      this.contactoComprador = '',
      this.correoComprador = '',
      this.direccionComprador = '',
      this.municipioComprador = '',
      this.provinciaComprador = '',
      this.fechaEntrega = '',
      this.fechaOrdenCompra = '',
      this.numeroOrdenCompra = '',
      this.codigoInternoComprador = '',
      this.actividadEconomica = '',
      this.porcentajeRetencionIsr = '',
      this.baseImponibleIsr = '',
      this.porcentajeRetencionItbis = '',
      this.baseImponibleItbis = '',
      this.formasDePagos = const [],
      this.terminoPago = '',
      this.paginas = const [],
      this.bancoPago = '',
      this.rncOtroContribuyente = '',
      this.numeroComprobanteModificado = '',
      this.fechaEmisionNcfModificado = '',
      this.razonModificacion = '',
      this.codigoModificacion = '',
      this.indicadorNotaCredito = '',
      this.totalPaginas = '',
      this.montoAvancePago = '',
      this.valorPagar = '',
      this.saldoAnterior = '',
      this.rutaVenta = '',
      this.telefonoAdicional = '',
      required this.items,
      required this.privateKey,
      required this.certBase64}) {
    final now = DateTime.now();
    fechaHoraFirma = DateFormat('dd-MM-yyyy HH:mm:ss').format(now);
    fechaFirma = DateFormat('dd-MM-yyyy').format(now);
    signerService =
        XmlSignerService(rsaPrivateKey: privateKey, certBase64: certBase64);
  }

  bool get esResumenE32 {
    double monto = double.parse(montoTotal);
    return tipoEcf == EcfType.e32 && monto < 250000.00;
  }

  String get ecfXsdFile {
    String dirName = 'eCFXmlModels';

    if (tipoEcf == EcfType.e31) {
      return path.join(dirProject.path, dirName, 'e-CF 31 v.1.0.xsd');
    }
    if (esResumenE32) {
      return path.join(dirProject.path, dirName, 'RFCE 32 v.1.0.xsd');
    }
    if (tipoEcf == EcfType.e32) {
      return path.join(dirProject.path, dirName, 'e-CF 32 v.1.0.xsd');
    }
    if (tipoEcf == EcfType.e34) {
      return path.join(dirProject.path, dirName, 'e-CF 34 v.1.0.xsd');
    }
    if (tipoEcf == EcfType.e41) {
      return path.join(dirProject.path, dirName, 'e-CF 41 v.1.0.xsd');
    }
    if (tipoEcf == EcfType.e43) {
      return path.join(dirProject.path, dirName, 'e-CF 43 v.1.0.xsd');
    }
    return '';
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

    if (tipoEcf == EcfType.e41) {
      return '41';
    }

    if (tipoEcf == EcfType.e43) {
      return '43';
    }

    return '31';
  }

  String get xml {
    if (esResumenE32) {
      return xmle32;
    }

    return xmlDefault;
  }

  String get xmlDefault {
    return '''
<ECF xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xsi:noNamespaceSchemaLocation="$ecfXsdFile">
  <Encabezado>
    <Version>1.0</Version>
    <IdDoc>
      <TipoeCF>$tipo</TipoeCF>
      <eNCF>$numeroComprobante</eNCF>
      <FechaVencimientoSecuencia>$fechaVencimiento</FechaVencimientoSecuencia>
      ${indicadorMontoGravado != '' ? '<IndicadorMontoGravado>$indicadorMontoGravado</IndicadorMontoGravado>' : ''}
      ${tipoIngreso != '' ? '<TipoIngresos>$tipoIngreso</TipoIngresos>' : ''}
      ${tipoPago != '' ? '<TipoPago>$tipoPago</TipoPago>' : ''}
      ${terminoPago != '' ? '<TerminoPago>$terminoPago</TerminoPago>' : ''}

     ${formasDePagos.isNotEmpty ? '''
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
    
    ''' : ''}
      ${bancoPago != '' ? '<BancoPago>$bancoPago</BancoPago>' : ''}
      ${totalPaginas != '' ? '<TotalPaginas>$totalPaginas</TotalPaginas>' : ''}
    </IdDoc>
    <Emisor>
      <RNCEmisor>$rncEmisor</RNCEmisor>
      <RazonSocialEmisor>$razonSocialEmisor</RazonSocialEmisor>
      ${nombreComercial != '' ? '<NombreComercial>$nombreComercial</NombreComercial>' : ''}
      ${sucursal != '' ? '<Sucursal>$sucursal</Sucursal>' : ''}
      <DireccionEmisor>$direccionEmisor</DireccionEmisor>
      ${municipio != '' ? '<Municipio>$municipio</Municipio>' : ''}
      ${municipio != '' ? '<Provincia>$provincia</Provincia>' : ''}
      <TablaTelefonoEmisor>
        ${telefonoEmisor1 != '' ? '<TelefonoEmisor>$telefonoEmisor1</TelefonoEmisor>' : ''}
        ${telefonoEmisor2 != '' ? '<TelefonoEmisor>$telefonoEmisor2</TelefonoEmisor>' : ''}
      </TablaTelefonoEmisor>
      ${correoEmisor != '' ? '<CorreoEmisor>$correoEmisor</CorreoEmisor>' : ''}
      ${website != '' ? '<WebSite>$website</WebSite>' : ''}
      ${actividadEconomica != '' ? '<ActividadEconomica>$actividadEconomica</ActividadEconomica>' : ''}
      ${codigoVendedor != '' ? '<CodigoVendedor>$codigoVendedor</CodigoVendedor>' : ''}
      ${numeroFacturaInterna != '' ? '<NumeroFacturaInterna>$numeroFacturaInterna</NumeroFacturaInterna>' : ''}
      ${numeroPedidoInterno != '' ? '<NumeroPedidoInterno>$numeroPedidoInterno</NumeroPedidoInterno>' : ''}
      ${zonaVenta != '' ? '<ZonaVenta>$zonaVenta</ZonaVenta>' : ''}
      ${rutaVenta != '' ? '<RutaVenta>$rutaVenta</RutaVenta>' : ''}
      ${informacionAdicionalEmisor != '' ? '<InformacionAdicionalEmisor>$informacionAdicionalEmisor</InformacionAdicionalEmisor>' : ''}
      <FechaEmision>$fechaEmision</FechaEmision>
    </Emisor>
    ${tipoEcf == EcfType.e43 ? '' : '''
          <Comprador>
      ${rncComprador != '' ? '<RNCComprador>$rncComprador</RNCComprador>' : ''}
      ${razonSocialComprador != '' ? '<RazonSocialComprador>$razonSocialComprador</RazonSocialComprador>' : ''}
      ${contactoComprador != '' ? '<ContactoComprador>$contactoComprador</ContactoComprador>' : ''}
      ${correoComprador != '' ? '<CorreoComprador>$correoComprador</CorreoComprador>' : ''}
      ${direccionComprador != '' ? '<DireccionComprador>$direccionComprador</DireccionComprador>' : ''}
      ${municipioComprador != '' ? '<MunicipioComprador>$municipioComprador</MunicipioComprador>' : ''}
      ${provinciaComprador != '' ? '<ProvinciaComprador>$provinciaComprador</ProvinciaComprador>' : ''}
      ${fechaEntrega != '' ? '<FechaEntrega>$fechaEntrega</FechaEntrega>' : ''}
      ${telefonoAdicional != '' ? '<TelefonoAdicional>$telefonoAdicional</TelefonoAdicional>' : ''}
      ${fechaOrdenCompra != '' ? '<FechaOrdenCompra>$fechaOrdenCompra</FechaOrdenCompra>' : ''}
      ${numeroOrdenCompra != '' ? '<NumeroOrdenCompra>$numeroOrdenCompra</NumeroOrdenCompra>' : ''}
      ${codigoInternoComprador != '' ? ' <CodigoInternoComprador>$codigoInternoComprador</CodigoInternoComprador>' : ''}
    </Comprador>
       '''}
    <Totales>
      ${totalGravado != '' ? '<MontoGravadoTotal>$totalGravado</MontoGravadoTotal>' : ''}
      ${totalGravado18 != '' ? '<MontoGravadoI1>$totalGravado18</MontoGravadoI1>' : ''}
      ${totalGravado16 != '' ? '<MontoGravadoI2>$totalGravado16</MontoGravadoI2>' : ''}
      ${totalGravadoTasa0 != '' ? '<MontoGravadoI3>$totalGravadoTasa0</MontoGravadoI3>' : ''}
      ${montoExento != '' ? '<MontoExento>$montoExento</MontoExento>' : ''}
      ${itbis1 != '' ? '<ITBIS1>$itbis1</ITBIS1>' : ''}
      ${itbis2 != '' ? '<ITBIS2>$itbis2</ITBIS2>' : ''}
      ${itbis3 != '' ? '<ITBIS3>$itbis3</ITBIS3>' : ''}
      ${totalItbis != '' ? '<TotalITBIS>$totalItbis</TotalITBIS>' : ''}
      ${totalItbis18 != '' ? '<TotalITBIS1>$totalItbis18</TotalITBIS1>' : ''}
      ${totalItbis16 != '' ? '<TotalITBIS2>$totalItbis16</TotalITBIS2>' : ''}
      ${totalItbisTasa0 != '' ? '<TotalITBIS3>$totalItbisTasa0</TotalITBIS3>' : ''}
      ${impuestosAdicionales.isNotEmpty ? '''
       <MontoImpuestoAdicional>$montoImpuestoAdicional</MontoImpuestoAdicional>
       <ImpuestosAdicionales>
          ${impuestosAdicionales.map((impuesto) {
            return '''
         <ImpuestoAdicional>
         <TipoImpuesto>${impuesto.tipoImpuesto}</TipoImpuesto>
         <TasaImpuestoAdicional>${impuesto.tasaImpuestoAdicional}</TasaImpuestoAdicional>
         ${impuesto.montoImpuestoSelectivoConsumoEspecifico != '' ? '<MontoImpuestoSelectivoConsumoEspecifico>${impuesto.montoImpuestoSelectivoConsumoEspecifico}</MontoImpuestoSelectivoConsumoEspecifico>' : ''}
         ${impuesto.montoImpuestoSelectivoConsumoAdvalorem != '' ? '<MontoImpuestoSelectivoConsumoAdvalorem>${impuesto.montoImpuestoSelectivoConsumoAdvalorem}</MontoImpuestoSelectivoConsumoAdvalorem>' : ''}
         ${impuesto.otrosImpuestosAdicionales != '' ? '<OtrosImpuestosAdicionales>${impuesto.otrosImpuestosAdicionales}</OtrosImpuestosAdicionales>' : ''}
        </ImpuestoAdicional>
         ''';
          }).join()}
       </ImpuestosAdicionales>
      ''' : ''}
      <MontoTotal>$montoTotal</MontoTotal>
      ${saldoAnterior != '' ? '<SaldoAnterior>$saldoAnterior</SaldoAnterior>' : ''}
      ${montoAvancePago != '' ? '<MontoAvancePago>$montoAvancePago</MontoAvancePago>' : ''}
      ${valorPagar != '' ? '<ValorPagar>$valorPagar</ValorPagar>' : ''}
      ${totalItbisRetencion != '' ? '<TotalITBISRetenido>$totalItbisRetencion</TotalITBISRetenido>' : ''}
      ${totalIsrRetencion != '' ? '<TotalISRRetencion>$totalIsrRetencion</TotalISRRetencion>' : ''}
    </Totales>
  </Encabezado>
  <DetallesItems>
     ${items.map((e) {
      var index = items.indexOf(e);
      return '''
 <Item>
    <NumeroLinea>${index + 1}</NumeroLinea>
        ${e.codigos.isNotEmpty ? '''
   <TablaCodigosItem>
    ${e.codigos.map((codigo) {
              return '''
      <CodigosItem>
        <TipoCodigo>${codigo.tipoCodigo}</TipoCodigo>
        <CodigoItem>${codigo.codigoItem}</CodigoItem>
      </CodigosItem>
      ''';
            }).join()}
      </TablaCodigosItem>
     ''' : ''}
    <IndicadorFacturacion>${e.indicadorFacturacion}</IndicadorFacturacion>
    ${e.retencion != null ? '''
         <Retencion>
                 <IndicadorAgenteRetencionoPercepcion>${e.retencion?.indicadorAgenteRetencionoPercepcion}</IndicadorAgenteRetencionoPercepcion>
                 ${e.retencion?.montoITBISRetenido != '' ? ' <MontoITBISRetenido>${e.retencion?.montoITBISRetenido}</MontoITBISRetenido>' : ''}
                 ${e.retencion?.montoISRRetenido != '' ? '<MontoISRRetenido>${e.retencion?.montoISRRetenido}</MontoISRRetenido>' : ''}
         </Retencion>
     ''' : ''}
    <NombreItem>${e.descripcion}</NombreItem>
    <IndicadorBienoServicio>${e.indicadorBienOServ}</IndicadorBienoServicio>
    ${e.descripcionItem != '' ? '<DescripcionItem>${e.descripcionItem}</DescripcionItem>' : ''}
    <CantidadItem>${e.cantidad}</CantidadItem>
    ${e.unidadMedida != '' ? '<UnidadMedida>${e.unidadMedida}</UnidadMedida>' : ''}
    ${e.unidadReferencia != '' ? '<UnidadReferencia>${e.unidadReferencia}</UnidadReferencia>' : ''}
    ${e.precioUnitarioReferencia != '' ? '<PrecioUnitarioReferencia>${e.precioUnitarioReferencia}</PrecioUnitarioReferencia>' : ''}
    <PrecioUnitarioItem>${e.precioUnitario}</PrecioUnitarioItem>
     ${e.subDescuentos.isNotEmpty ? '''
       <DescuentoMonto>${e.descuentoMonto}</DescuentoMonto>
       <TablaSubDescuento>
          ${e.subDescuentos.map((subdescuento) {
              return '''
                 <SubDescuento>
                      <TipoSubDescuento>${subdescuento.tipoSubDescuento}</TipoSubDescuento>
                      <SubDescuentoPorcentaje>${subdescuento.subDescuentoPorcentaje}</SubDescuentoPorcentaje>
                      <MontoSubDescuento>${subdescuento.montoSubDescuento}</MontoSubDescuento>
                  </SubDescuento>
               ''';
            }).join()}
       </TablaSubDescuento>
       ''' : ''}

      ${e.subRecargos.isNotEmpty ? '''
       <RecargoMonto>${e.recargoMonto}</RecargoMonto>
       <TablaSubRecargo>
          ${e.subRecargos.map((recargo) {
              return '''
                 <SubRecargo>
                      <TipoSubRecargo>${recargo.tipoSubRecargo}</TipoSubRecargo>
                      <SubRecargoPorcentaje>${recargo.subRecargoPorcentaje}</SubRecargoPorcentaje>
                      <MontoSubRecargo>${recargo.montoSubRecargo}</MontoSubRecargo>
                  </SubRecargo>
               ''';
            }).join()}
       </TablaSubRecargo>
       ''' : ''}
      ${e.impuestosAdicionales.isNotEmpty ? '''
      <TablaImpuestoAdicional>
         ${e.impuestosAdicionales.map((impuesto) {
              return '''
           <ImpuestoAdicional>
            <TipoImpuesto>${impuesto.tipoImpuesto}</TipoImpuesto>
           </ImpuestoAdicional>
            ''';
            }).join()}
      </TablaImpuestoAdicional>
     ''' : ''}
    <MontoItem>${e.montoItem}</MontoItem>
  </Item>
     ''';
    }).join()}
  </DetallesItems>
  ${paginas.isNotEmpty ? '''
    <Paginacion>
     ${paginas.map((pagina) {
            var index = paginas.indexOf(pagina);
            return '''
    <Pagina>
      <PaginaNo>${index + 1}</PaginaNo>
      <NoLineaDesde>${pagina.noLineaDesde}</NoLineaDesde>
      <NoLineaHasta>${pagina.noLineaHasta}</NoLineaHasta>
      <SubtotalMontoGravadoPagina>${pagina.subtotalMontoGravadoPagina}</SubtotalMontoGravadoPagina>
      <SubtotalMontoGravado1Pagina>${pagina.subtotalMontoGravado1Pagina}</SubtotalMontoGravado1Pagina>
      <SubtotalMontoGravado2Pagina>${pagina.subtotalMontoGravado2Pagina}</SubtotalMontoGravado2Pagina>
      <SubtotalMontoGravado3Pagina>${pagina.subtotalMontoGravado3Pagina}</SubtotalMontoGravado3Pagina>
      <SubtotalExentoPagina>${pagina.subtotalExentoPagina}</SubtotalExentoPagina>
      <SubtotalItbisPagina>${pagina.subtotalItbisPagina}</SubtotalItbisPagina>
      <SubtotalItbis1Pagina>${pagina.subtotalItbis1Pagina}</SubtotalItbis1Pagina>
      <SubtotalItbis2Pagina>${pagina.subtotalItbis2Pagina}</SubtotalItbis2Pagina>
      <SubtotalItbis3Pagina>${pagina.subtotalItbis3Pagina}</SubtotalItbis3Pagina>
      <SubtotalImpuestoAdicionalPagina>${pagina.subtotalImpuestoAdicionalPagina}</SubtotalImpuestoAdicionalPagina>
     <SubtotalImpuestoAdicional>
       ${pagina.subtotalImpuestoSelectivoConsumoEspecificoPagina != '' ? '<SubtotalImpuestoSelectivoConsumoEspecificoPagina>${pagina.subtotalImpuestoSelectivoConsumoEspecificoPagina}</SubtotalImpuestoSelectivoConsumoEspecificoPagina>' : ''}
       ${pagina.subtotalOtrosImpuesto != '' ? '<SubtotalOtrosImpuesto>${pagina.subtotalOtrosImpuesto}</SubtotalOtrosImpuesto>' : ''}
     </SubtotalImpuestoAdicional>
      <MontoSubtotalPagina>${pagina.montoSubtotalPagina}</MontoSubtotalPagina>
    </Pagina>
   ''';
          }).join()}
  </Paginacion>
    ''' : ''}
   ${tipoEcf == EcfType.e34 ? '''
    <InformacionReferencia>
    <NCFModificado>$numeroComprobanteModificado</NCFModificado>
    <RNCOtroContribuyente>$rncOtroContribuyente</RNCOtroContribuyente>
    <FechaNCFModificado>$fechaEmisionNcfModificado</FechaNCFModificado>
    <CodigoModificacion>$codigoModificacion</CodigoModificacion>
    <RazonModificacion>$razonModificacion</RazonModificacion>
  </InformacionReferencia>
   ''' : ''}
  <FechaHoraFirma>$fechaHoraFirma</FechaHoraFirma>
</ECF>
   ''';
  }

  String get xmle32 {
    return '''
<RFCE xsi:noNamespaceSchemaLocation="$ecfXsdFile" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance">
  <Encabezado>
    <Version>1.0</Version>
    <IdDoc>
      <TipoeCF>$tipo</TipoeCF>
      <eNCF>$numeroComprobante</eNCF>
      <TipoIngresos>$tipoIngreso</TipoIngresos>
      <TipoPago>$tipoPago</TipoPago>
    </IdDoc>
    <Emisor>
      <RNCEmisor>$rncEmisor</RNCEmisor>
      <RazonSocialEmisor>$razonSocialEmisor</RazonSocialEmisor>
      ${municipio != '' ? '<Municipio>$municipio</Municipio>' : ''}
      ${municipio != '' ? '<Provincia>$provincia</Provincia>' : ''}
      ${numeroFacturaInterna != '' ? '<NumeroFacturaInterna>$numeroFacturaInterna</NumeroFacturaInterna>' : ''}
      ${numeroPedidoInterno != '' ? '<NumeroPedidoInterno>$numeroPedidoInterno</NumeroPedidoInterno>' : ''}
      ${zonaVenta != '' ? '<ZonaVenta>$zonaVenta</ZonaVenta>' : ''}
      ${rutaVenta != '' ? '<RutaVenta>$rutaVenta</RutaVenta>' : ''}
      <FechaEmision>$fechaEmision</FechaEmision>
    </Emisor>
    <Comprador>
       ${rncComprador != '' ? '<RNCComprador>$rncComprador</RNCComprador>' : ''}
      ${razonSocialComprador != '' ? '<RazonSocialComprador>$razonSocialComprador</RazonSocialComprador>' : ''}
      ${contactoComprador != '' ? '<ContactoComprador>$contactoComprador</ContactoComprador>' : ''}
    </Comprador>
    <Totales>
      <MontoGravadoTotal>$totalGravado</MontoGravadoTotal>
      <MontoGravadoI1>$totalGravado18</MontoGravadoI1>
      ${totalGravado16 != '' ? '<MontoGravadoI2>$totalGravado16</MontoGravadoI2>' : ''}
      ${totalGravadoTasa0 != '' ? '<MontoGravadoI3>$totalGravadoTasa0</MontoGravadoI3>' : ''}
      ${montoExento != '' ? '<MontoExento>$montoExento</MontoExento>' : ''}
      <TotalITBIS>$totalItbis</TotalITBIS>
      <TotalITBIS1>$totalItbis18</TotalITBIS1>
      ${totalItbis16 != '' ? '<TotalITBIS2>$totalItbis16</TotalITBIS2>' : ''}
      ${totalItbisTasa0 != '' ? '<TotalITBIS3>$totalItbisTasa0</TotalITBIS3>' : ''}
      ${impuestosAdicionales.isNotEmpty ? '''
       <MontoImpuestoAdicional>$montoImpuestoAdicional</MontoImpuestoAdicional>
       <ImpuestosAdicionales>
          ${impuestosAdicionales.map((impuesto) {
            return '''
         <ImpuestoAdicional>
         <TipoImpuesto>${impuesto.tipoImpuesto}</TipoImpuesto>
         <TasaImpuestoAdicional>${impuesto.tasaImpuestoAdicional}</TasaImpuestoAdicional>
         ${impuesto.montoImpuestoSelectivoConsumoEspecifico != '' ? '<MontoImpuestoSelectivoConsumoEspecifico>${impuesto.montoImpuestoSelectivoConsumoEspecifico}</MontoImpuestoSelectivoConsumoEspecifico>' : ''}
         ${impuesto.montoImpuestoSelectivoConsumoAdvalorem != '' ? '<MontoImpuestoSelectivoConsumoAdvalorem>${impuesto.montoImpuestoSelectivoConsumoAdvalorem}</MontoImpuestoSelectivoConsumoAdvalorem>' : ''}
         ${impuesto.otrosImpuestosAdicionales != '' ? '<OtrosImpuestosAdicionales>${impuesto.otrosImpuestosAdicionales}</OtrosImpuestosAdicionales>' : ''}
        </ImpuestoAdicional>
         ''';
          }).join()}
       </ImpuestosAdicionales>
      ''' : ''}
      <MontoTotal>$montoTotal</MontoTotal>
      ${saldoAnterior != '' ? '<SaldoAnterior>$saldoAnterior</SaldoAnterior>' : ''}
      ${montoAvancePago != '' ? '<MontoAvancePago>$montoAvancePago</MontoAvancePago>' : ''}
      ${valorPagar != '' ? '<ValorPagar>$valorPagar</ValorPagar>' : ''}
      ${totalItbisRetencion != '' ? '<TotalITBISRetenido>$totalItbisRetencion</TotalITBISRetenido>' : ''}
      ${totalIsrRetencion != '' ? '<TotalISRRetencion>$totalIsrRetencion</TotalISRRetencion>' : ''}
    </Totales>
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

  Uri get uriEcf {
    String consultaTimbre = kConsultaTimbre;

    String params = '?';

    if (rncEmisor != '') {
      params += 'RncEmisor=$rncEmisor';
    }

    if (rncComprador != '') {
      params += '&RncComprador=$rncComprador';
    }

    if (numeroComprobante != '') {
      params += '&ENCF=$numeroComprobante';
    }

    if (fechaEmision != '') {
      params += '&FechaEmision=$fechaEmision';
    }

    if (montoTotal != '') {
      params += '&MontoTotal=$montoTotal';
    }

    if (fechaHoraFirma != '') {
      params += '&FechaFirma=$fechaHoraFirma';
    }
    if (codigoSeguridad != '') {
      params += '&CodigoSeguridad=$codigoSeguridad';
    }

    if (tipoEcf == EcfType.e32) {
      consultaTimbre = kConsultaTimbreFc;
      params =
          '''?RncEmisor=$rncEmisor&ENCF=$numeroComprobante&MontoTotal=$montoTotal&CodigoSeguridad=$codigoSeguridad'''
              .trim();
    }

    var uri = GeneratorEndPoint.getEndPoint('''$consultaTimbre$params'''.trim(),
        ecfType: tipoEcf);
    return uri;
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
    final isE32 = tipoEcf == EcfType.e32;

    final xmlFilePath =
        path.join(dirProject.path, 'temp', '$rncEmisor$numeroComprobante.xml');

    File xmlFile = File(xmlFilePath);

    // 1. Firma el XML SIN CodigoSeguridadeCF
    xmlSignerModel = await signerService.signXml(xml, xmlFile);

    var finalXmlStr = xmlSignerModel?.xmlStr ?? '';

    // 2. Solo si es tipo E32, insertamos CodigoSeguridadeCF
    if (isE32) {
      final signedXmlDoc = XmlDocument.parse(xml);

      final encabezado = signedXmlDoc.findAllElements('Encabezado').first;

      // Eliminamos cualquier valor anterior por si acaso
      encabezado.children.removeWhere((node) =>
          node is XmlElement && node.name.toString() == 'CodigoSeguridadeCF');

      codigoSeguridad = xmlSignerModel?.codigoSeguridad ?? '000000';

      // Insertamos el nodo como último hijo de <Encabezado>
      encabezado.children.add(
        XmlElement(
            XmlName('CodigoSeguridadeCF'), [], [XmlText(codigoSeguridad)]),
      );

      finalXmlStr = signedXmlDoc.toXmlString();

      xmlSignerModel = await signerService.signXml(finalXmlStr, xmlFile);
    } else {
      codigoSeguridad = xmlSignerModel?.codigoSeguridad ?? '';
    }

    ecfFile = xmlFile;

    ecfSignXml = xmlSignerModel?.xmlStr ?? '';

    return XmlSignerModel(
      xmlFile: xmlFile,
      xmlStr: finalXmlStr,
      codigoSeguridad: codigoSeguridad,
    );
  }

  Future<bool> sendEcfSigned() async {
    try {
      if (ecfFile == null) throw 'Archivo Xml del ecf firmado no existe';

      print(token);

      var res = await sendEcfSign(ecfFile!, tipoEcf, token, montoTotal);

      if (res['trackId'] != null) {
        trackId = res['trackId'];
        print('TRACKID: $trackId');
      } else {
        print(res);
      }

      var urlsDir = Directory(path.join(dirProject.path, 'urls'));

      await urlsDir.create(recursive: true);

      var fileUrlsPath = path.join(urlsDir.path, 'urls.txt');
      File fileUrls = File(fileUrlsPath);

      await fileUrls.create(recursive: true);

      await fileUrls.writeAsString('${uriEcf.toString()}\n',
          mode: FileMode.append);

      print('TOKEN: $token');

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

  List<TipoCodigo> codigos;

  String descripcion;

  String indicadorBienOServ;

  String indicadorFacturacion;

  String unidadMedida;

  String unidadReferencia;

  String precioUnitarioReferencia;

  String precioUnitario;

  String montoItem;

  String tipoImpuesto;

  String tasaImpuesto;

  String descuentoMonto;

  String recargoMonto;

  List<SubDescuento> subDescuentos = [];

  List<SubRecargo> subRecargos = [];

  List<ImpuestoAdicional> impuestosAdicionales;

  Retencion? retencion;

  String descripcionItem;

  EcfDetailsModel({
    required this.cantidad,
    this.codigos = const [],
    required this.descripcion,
    this.descripcionItem = '',
    required this.indicadorBienOServ,
    required this.indicadorFacturacion,
    required this.unidadMedida,
    this.unidadReferencia = '',
    required this.precioUnitario,
    this.precioUnitarioReferencia = '',
    required this.montoItem,
    required this.tipoImpuesto,
    required this.tasaImpuesto,
    this.descuentoMonto = '',
    this.recargoMonto = '',
    this.subDescuentos = const [],
    this.subRecargos = const [],
    this.retencion,
    this.impuestosAdicionales = const [],
  });

  Map<String, dynamic> toMap() {
    return {
      'cantidad': cantidad,
      'codigos': codigos.map((e) => e.toMap()).toList(),
      'descripcion': descripcion,
      'descripcionItem': descripcionItem,
      'indicadorBienOServ': indicadorBienOServ,
      'indicadorFacturacion': indicadorFacturacion,
      'unidadMedida': unidadMedida,
      'unidadReferencia': unidadReferencia,
      'precioUnitarioReferencia': precioUnitarioReferencia,
      'precioUnitario': precioUnitario,
      'montoItem': montoItem,
      'tipoImpuesto': tipoImpuesto,
      'tasaImpuesto': tasaImpuesto,
      'descuentoMonto': descuentoMonto,
      'recargoMonto': recargoMonto,
      'subDescuentos': subDescuentos.map((e) => e.toMap()).toList(),
      'subRecargos': subRecargos.map((e) => e.toMap()).toList(),
      'impuestosAdicionales':
          impuestosAdicionales.map((e) => e.toMap()).toList(),
    };
  }

  @override
  String toString() {
    return '''
        'EcfDetailsModel(cantidad: $cantidad, codigos: $codigos, descripcion: $descripcion, indicadorBienOServ: $indicadorBienOServ, indicadorFacturacion: $indicadorFacturacion, unidadMedida: $unidadMedida, unidadReferencia: $unidadReferencia, precioUnitarioReferencia: $precioUnitarioReferencia, precioUnitario: $precioUnitario, montoItem: $montoItem, tipoImpuesto: $tipoImpuesto, tasaImpuesto: $tasaImpuesto, descuentoMonto: $descuentoMonto, recargoMonto: $recargoMonto, subDescuentos: $subDescuentos, subRecargos: $subRecargos, impuestosAdicionales: $impuestosAdicionales, descripcionItem: $descripcionItem)''';
  }
}


/**
 *   <Subtotales>
    <Subtotal>
      <NumeroSubTotal>1</NumeroSubTotal>
      <SubTotalMontoGravadoTotal>$totalGravado</SubTotalMontoGravadoTotal>
      <SubTotalMontoGravadoI1>$totalGravado18</SubTotalMontoGravadoI1>
      ${totalGravado16 != '' ? '<SubTotalMontoGravadoI2>$totalGravado16</SubTotalMontoGravadoI2>' : ''}
      ${totalGravadoTasa0 != '' ? '<SubTotalMontoGravadoI3>$totalGravadoTasa0</SubTotalMontoGravadoI3>' : ''}
      <SubTotaITBIS>$totalItbis</SubTotaITBIS>
      <SubTotaITBIS1>$totalItbis18</SubTotaITBIS1>
      ${totalItbis16 != '' ? '<SubTotaITBIS2>$totalItbis16</SubTotaITBIS2>' : ''}
      ${totalItbisTasa0 != '' ? '<SubTotaITBIS3>$totalItbisTasa0</SubTotaITBIS3>' : ''}
      ${montoExento != '' ? '<SubTotalExento>$montoExento</SubTotalExento>' : ''}
      <MontoSubTotal>$montoTotal</MontoSubTotal>
    </Subtotal>
  </Subtotales>
 */