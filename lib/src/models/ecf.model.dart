import 'dart:convert';
import 'dart:io';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:path/path.dart' as path;
import 'package:xml/xml.dart';

import 'package:ecf_dgii/ecf_dgii.dart';
import 'package:ecf_dgii/src/utils/directories.dart';

import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;

class OtraMonedaDetalle {
  String precioOtraMoneda;
  String descuentoOtraMoneda;
  String recargoOtraMoneda;
  String montoItemOtraMoneda;
  OtraMonedaDetalle(
      {required this.precioOtraMoneda,
      required this.descuentoOtraMoneda,
      required this.recargoOtraMoneda,
      required this.montoItemOtraMoneda});

  @override
  String toString() {
    return 'OtraMonedaDetalle(precioOtraMoneda: $precioOtraMoneda,descuentoOtraMoneda: $descuentoOtraMoneda,recargoOtraMoneda: $recargoOtraMoneda, montoItemOtraMoneda: $montoItemOtraMoneda)';
  }
}

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

  @override
  String toString() {
    return 'Pagina(noLineaDesde: $noLineaDesde, noLineaHasta: $noLineaHasta, subtotalMontoGravadoPagina: $subtotalMontoGravadoPagina, subtotalMontoGravado1Pagina: $subtotalMontoGravado1Pagina, subtotalMontoGravado2Pagina: $subtotalMontoGravado2Pagina, subtotalMontoGravado3Pagina: $subtotalMontoGravado3Pagina, subtotalExentoPagina: $subtotalExentoPagina, subtotalItbisPagina: $subtotalItbisPagina, subtotalItbis1Pagina: $subtotalItbis1Pagina, subtotalItbis2Pagina: $subtotalItbis2Pagina, subtotalItbis3Pagina: $subtotalItbis3Pagina, subtotalImpuestoAdicionalPagina: $subtotalImpuestoAdicionalPagina, subtotalImpuestoSelectivoConsumoEspecificoPagina: $subtotalImpuestoSelectivoConsumoEspecificoPagina, subtotalOtrosImpuesto: $subtotalOtrosImpuesto, montoSubtotalPagina: $montoSubtotalPagina)';
  }
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
      this.montoImpuestoSelectivoConsumoEspecifico = '',
      this.otrosImpuestosAdicionales = '',
      this.montoImpuestoSelectivoConsumoAdvalorem = ''});
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
      required this.montoITBISRetenido,
      required this.montoISRRetenido});
  @override
  String toString() {
    return '''
        'Retencion(indicadorAgenteRetencionoPercepcion: $indicadorAgenteRetencionoPercepcion, montoITBISRetenido: $montoITBISRetenido, montoISRRetenido: $montoISRRetenido)''';
  }
}

class EcfModel {
  EcfType tipoEcf;

  String rncEmisor;

  String razonSocialEmisor;

  String nombreComercial;

  String rncComprador;

  String identificadorExtranjero;

  String razonSocialComprador;

  String nombreComprador;

  String fechaEmision;

  String numeroComprobante;

  String montoTotal;

  String montoNoFacturable;

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

  String fechaEmbarque;

  String numeroEmbarque;

  String numeroContenedor;

  String numeroReferencia;

  String nombrePuertoEmbarque;

  String condicionesEntrega;

  String paisDestino;

  String conductor;

  String documentoTransporte;

  String ficha;

  String placa;

  String rutaTransporte;

  String zonaTransporte;

  String numeroAlbaran;

  String actividadEconomica;

  String totalItbisRetencion;

  String totalIsrRetencion;

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

  String? montoPeriodo;

  String montoAvancePago;

  String valorPagar;

  String tipoMoneda;

  String tipoCambio;

  String montoGravadoTotalOtraMoneda;

  String montoGravadoTotalOtraMoneda1;

  String montoGravadoTotalOtraMoneda2;

  String montoGravadoTotalOtraMoneda3;

  String montoExentoOtraMoneda;

  String totalItbisOtraMoneda;

  String totalItbis1OtraMoneda;

  String totalItbis2OtraMoneda;

  String totalItbis3OtraMoneda;

  String montoTotalOtraMoneda;

  String? saldoAnterior;

  String? rutaVenta;

  File? xmlAprobacionFile;

  String? xmlAprobacionSign = '';

  String token = '';

  String trackId = '';

  String fechaHoraFirma = '';

  String fechaFirma = '';

  XmlSignerModel? xmlSignerModel;

  bool habilitarNormale32;

  String tempDirName;

  String fechaHoraAprobacionComercial;

  EcfModel(
      {this.tipoEcf = EcfType.e31,
      this.tempDirName = 'temp',
      this.fechaHoraAprobacionComercial = '',
      this.habilitarNormale32 = false,
      this.rncEmisor = '',
      this.razonSocialEmisor = '',
      this.nombreComercial = '',
      this.rncComprador = '',
      this.identificadorExtranjero = '',
      this.razonSocialComprador = '',
      this.nombreComprador = '',
      this.fechaEmision = '',
      this.fechaVencimiento = '',
      this.numeroComprobante = '',
      this.montoTotal = '',
      this.montoNoFacturable = '',
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
      this.fechaEmbarque = '',
      this.numeroEmbarque = '',
      this.numeroContenedor = '',
      this.numeroReferencia = '',
      this.nombrePuertoEmbarque = '',
      this.condicionesEntrega = '',
      this.numeroAlbaran = '',
      this.numeroComprobanteModificado = '',
      this.paisDestino = '',
      this.conductor = '',
      this.documentoTransporte = '',
      this.ficha = '',
      this.placa = '',
      this.rutaTransporte = '',
      this.zonaTransporte = '',
      this.actividadEconomica = '',
      this.formasDePagos = const [],
      this.terminoPago = '',
      this.paginas = const [],
      this.bancoPago = '',
      this.rncOtroContribuyente = '',
      this.fechaEmisionNcfModificado = '',
      this.razonModificacion = '',
      this.codigoModificacion = '',
      this.indicadorNotaCredito = '',
      this.totalPaginas = '',
      this.montoPeriodo = '',
      this.montoAvancePago = '',
      this.valorPagar = '',
      this.tipoMoneda = '',
      this.tipoCambio = '',
      this.montoGravadoTotalOtraMoneda = '',
      this.montoGravadoTotalOtraMoneda1 = '',
      this.montoGravadoTotalOtraMoneda2 = '',
      this.montoGravadoTotalOtraMoneda3 = '',
      this.montoExentoOtraMoneda = '',
      this.totalItbisOtraMoneda = '',
      this.totalItbis1OtraMoneda = '',
      this.totalItbis2OtraMoneda = '',
      this.totalItbis3OtraMoneda = '',
      this.montoTotalOtraMoneda = '',
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
    if (tipoEcf == EcfType.e33) {
      return path.join(dirProject.path, dirName, 'e-CF 33 v.1.0.xsd');
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

    if (tipoEcf == EcfType.e47) {
      return path.join(dirProject.path, dirName, 'e-CF 47 v.1.0.xsd');
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

    if (tipoEcf == EcfType.e33) {
      return '33';
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

    if (tipoEcf == EcfType.e44) {
      return '44';
    }

    if (tipoEcf == EcfType.e45) {
      return '45';
    }

    if (tipoEcf == EcfType.e46) {
      return '46';
    }
    if (tipoEcf == EcfType.e47) {
      return '47';
    }

    return '31';
  }

  String get xml {
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
      ${fechaVencimiento != '' ? '<FechaVencimientoSecuencia>$fechaVencimiento</FechaVencimientoSecuencia>' : ''}
      ${indicadorNotaCredito != '' ? '<IndicadorNotaCredito>$indicadorNotaCredito</IndicadorNotaCredito>' : ''}
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
      ${telefonoEmisor1 != '' || telefonoEmisor2 != '' || telefonoEmisor3 != '' ? '''
      <TablaTelefonoEmisor>
        ${telefonoEmisor1 != '' ? '<TelefonoEmisor>$telefonoEmisor1</TelefonoEmisor>' : ''}
        ${telefonoEmisor2 != '' ? '<TelefonoEmisor>$telefonoEmisor2</TelefonoEmisor>' : ''}
        ${telefonoEmisor3 != '' ? '<TelefonoEmisor>$telefonoEmisor3</TelefonoEmisor>' : ''}
      </TablaTelefonoEmisor>
''' : ''}
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
      ${identificadorExtranjero != '' ? '<IdentificadorExtranjero>$identificadorExtranjero</IdentificadorExtranjero>' : ''}
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
      ${fechaEmbarque != '' || numeroEmbarque != '' || numeroContenedor != '' || numeroReferencia != '' || nombrePuertoEmbarque != '' || condicionesEntrega != '' ? '''
         <InformacionesAdicionales>
         ${fechaEmbarque != '' ? '<FechaEmbarque>$fechaEmbarque</FechaEmbarque>' : ''}
         ${numeroEmbarque != '' ? '<NumeroEmbarque>$numeroEmbarque</NumeroEmbarque>' : ''}
         ${numeroContenedor != '' ? '<NumeroContenedor>$numeroContenedor</NumeroContenedor>' : ''}
         ${numeroReferencia != '' ? '<NumeroReferencia>$numeroReferencia</NumeroReferencia>' : ''}
         ${nombrePuertoEmbarque != '' ? '<NombrePuertoEmbarque>$nombrePuertoEmbarque</NombrePuertoEmbarque>' : ''}
         ${condicionesEntrega != '' ? '<CondicionesEntrega>$condicionesEntrega</CondicionesEntrega>' : ''}
        </InformacionesAdicionales>
       ''' : ''}
     ${paisDestino != '' || conductor != '' || documentoTransporte != '' || ficha != '' || placa != '' || rutaTransporte != '' || zonaTransporte != '' || numeroAlbaran != '' ? '''
     <Transporte>
      ${paisDestino != '' ? '<PaisDestino>$paisDestino</PaisDestino>' : ''}
      ${conductor != '' ? '<Conductor>$conductor</Conductor>' : ''}
      ${documentoTransporte != '' ? '<DocumentoTransporte>$documentoTransporte</DocumentoTransporte>' : ''}
      ${ficha != '' ? '<Ficha>$ficha</Ficha>' : ''}
      ${placa != '' ? '<Placa>$placa</Placa>' : ''}
      ${rutaTransporte != '' ? '<RutaTransporte>$rutaTransporte</RutaTransporte>' : ''}
      ${zonaTransporte != '' ? '<ZonaTransporte>$zonaTransporte</ZonaTransporte>' : ''}
      ${numeroAlbaran != '' ? '<NumeroAlbaran>$numeroAlbaran</NumeroAlbaran>' : ''}
      </Transporte>
     ''' : ''} 
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
      ${montoNoFacturable != '' ? '<MontoNoFacturable>$montoNoFacturable</MontoNoFacturable>' : ''}
      ${montoPeriodo != '' ? '<MontoPeriodo>$montoPeriodo</MontoPeriodo>' : ''}
      ${saldoAnterior != '' ? '<SaldoAnterior>$saldoAnterior</SaldoAnterior>' : ''}
      ${montoAvancePago != '' ? '<MontoAvancePago>$montoAvancePago</MontoAvancePago>' : ''}
      ${valorPagar != '' ? '<ValorPagar>$valorPagar</ValorPagar>' : ''}
      ${totalItbisRetencion != '' ? '<TotalITBISRetenido>$totalItbisRetencion</TotalITBISRetenido>' : ''}
      ${totalIsrRetencion != '' ? '<TotalISRRetencion>$totalIsrRetencion</TotalISRRetencion>' : ''}
    </Totales>
    ${tipoMoneda != '' || tipoCambio != '' || montoGravadoTotalOtraMoneda != '' || montoExentoOtraMoneda != '' || totalItbisOtraMoneda != '' ? '''
      <OtraMoneda>
      ${tipoMoneda != '' ? '<TipoMoneda>$tipoMoneda</TipoMoneda>' : ''}
      ${tipoCambio != '' ? '<TipoCambio>$tipoCambio</TipoCambio>' : ''}
      ${montoGravadoTotalOtraMoneda != '' ? '<MontoGravadoTotalOtraMoneda>$montoGravadoTotalOtraMoneda</MontoGravadoTotalOtraMoneda>' : ''}
      ${montoGravadoTotalOtraMoneda1 != '' ? '<MontoGravado1OtraMoneda>$montoGravadoTotalOtraMoneda1</MontoGravado1OtraMoneda>' : ''}
      ${montoGravadoTotalOtraMoneda2 != '' ? '<MontoGravado2OtraMoneda>$montoGravadoTotalOtraMoneda2</MontoGravado2OtraMoneda>' : ''}
      ${montoGravadoTotalOtraMoneda3 != '' ? '<MontoGravado3OtraMoneda>$montoGravadoTotalOtraMoneda3</MontoGravado3OtraMoneda>' : ''}
      ${montoExentoOtraMoneda != '' ? '<MontoExentoOtraMoneda>$montoExentoOtraMoneda</MontoExentoOtraMoneda>' : ''}
      ${totalItbisOtraMoneda != '' ? '<TotalITBISOtraMoneda>$totalItbisOtraMoneda</TotalITBISOtraMoneda>' : ''}
      ${totalItbis1OtraMoneda != '' ? '<TotalITBIS1OtraMoneda>$totalItbis1OtraMoneda</TotalITBIS1OtraMoneda>' : ''}
      ${totalItbis2OtraMoneda != '' ? '<TotalITBIS2OtraMoneda>$totalItbis2OtraMoneda</TotalITBIS2OtraMoneda>' : ''}
      ${totalItbis3OtraMoneda != '' ? '<TotalITBIS3OtraMoneda>$totalItbis3OtraMoneda</TotalITBIS3OtraMoneda>' : ''}
      ${montoTotalOtraMoneda != '' ? '<MontoTotalOtraMoneda>$montoTotalOtraMoneda</MontoTotalOtraMoneda>' : ''}
     </OtraMoneda>
    ''' : ''}
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
    <NombreItem>${e.nombreItem}</NombreItem>
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
                      ${subdescuento.subDescuentoPorcentaje != '' ? '<SubDescuentoPorcentaje>${subdescuento.subDescuentoPorcentaje}</SubDescuentoPorcentaje>' : ''}
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
                      ${recargo.subRecargoPorcentaje != '' ? '<SubRecargoPorcentaje>${recargo.subRecargoPorcentaje}</SubRecargoPorcentaje>' : ''}
                      ${recargo.montoSubRecargo != '' ? '<MontoSubRecargo>${recargo.montoSubRecargo}</MontoSubRecargo>' : ''}
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

     ${e.otraMonedaDetalles.isNotEmpty ? '''
      <OtraMonedaDetalle>
          ${e.otraMonedaDetalles.map((e) {
              return '''
              ${e.precioOtraMoneda != '' ? '<PrecioOtraMoneda>${e.precioOtraMoneda}</PrecioOtraMoneda>' : ''}
              ${e.descuentoOtraMoneda != '' ? '<DescuentoOtraMoneda>${e.descuentoOtraMoneda}</DescuentoOtraMoneda>' : ''}
              ${e.recargoOtraMoneda != '' ? '<RecargoOtraMoneda>${e.recargoOtraMoneda}</RecargoOtraMoneda>' : ''}
              ${e.montoItemOtraMoneda != '' ? '<MontoItemOtraMoneda>${e.montoItemOtraMoneda}</MontoItemOtraMoneda>' : ''}
            ''';
            }).join()}
      </OtraMonedaDetalle>
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
   ${tipoEcf == EcfType.e34 || tipoEcf == EcfType.e33 ? '''
    <InformacionReferencia>
    ${numeroComprobanteModificado != '' ? '<NCFModificado>$numeroComprobanteModificado</NCFModificado>' : ''}
    ${rncOtroContribuyente != '' ? '<RNCOtroContribuyente>$rncOtroContribuyente</RNCOtroContribuyente>' : ''}
    ${fechaEmisionNcfModificado != '' ? '<FechaNCFModificado>$fechaEmisionNcfModificado</FechaNCFModificado>' : ''}
    ${codigoModificacion != '' ? '<CodigoModificacion>$codigoModificacion</CodigoModificacion>' : ''}
    ${razonModificacion != '' ? '<RazonModificacion>$razonModificacion</RazonModificacion>' : ''}
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
      ${tipoIngreso != '' ? '<TipoIngresos>$tipoIngreso</TipoIngresos>' : ''}
      ${tipoPago != '' ? '<TipoPago>$tipoPago</TipoPago>' : ''}
    </IdDoc>
    <Emisor>
      <RNCEmisor>$rncEmisor</RNCEmisor>
      <RazonSocialEmisor>$razonSocialEmisor</RazonSocialEmisor>
      <FechaEmision>$fechaEmision</FechaEmision>
    </Emisor>
    <Comprador>
       ${rncComprador != '' ? '<RNCComprador>$rncComprador</RNCComprador>' : ''}
      ${razonSocialComprador != '' ? '<RazonSocialComprador>$razonSocialComprador</RazonSocialComprador>' : ''}
    </Comprador>
    <Totales>
      ${totalGravado != '' ? '<MontoGravadoTotal>$totalGravado</MontoGravadoTotal>' : ''}
      ${totalGravado18 != '' ? '<MontoGravadoI1>$totalGravado18</MontoGravadoI1>' : ''}
      ${totalGravado16 != '' ? '<MontoGravadoI2>$totalGravado16</MontoGravadoI2>' : ''}
      ${totalGravadoTasa0 != '' ? '<MontoGravadoI3>$totalGravadoTasa0</MontoGravadoI3>' : ''}
      ${montoExento != '' ? '<MontoExento>$montoExento</MontoExento>' : ''}
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
      ${montoTotal != '' ? '<MontoTotal>$montoTotal</MontoTotal>' : ''}
      ${montoNoFacturable != '' ? '<MontoNoFacturable>$montoNoFacturable</MontoNoFacturable>' : ''}
      ${saldoAnterior != '' ? '<SaldoAnterior>$saldoAnterior</SaldoAnterior>' : ''}
      ${montoPeriodo != '' ? '<MontoPeriodo>$montoPeriodo</MontoPeriodo>' : ''}
      ${montoAvancePago != '' ? '<MontoAvancePago>$montoAvancePago</MontoAvancePago>' : ''}
      ${valorPagar != '' ? '<ValorPagar>$valorPagar</ValorPagar>' : ''}
      ${totalItbisRetencion != '' ? '<TotalITBISRetenido>$totalItbisRetencion</TotalITBISRetenido>' : ''}
      ${totalIsrRetencion != '' ? '<TotalISRRetencion>$totalIsrRetencion</TotalISRRetencion>' : ''}
    </Totales>
  </Encabezado>
</RFCE>
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

    if (esResumenE32) {
      consultaTimbre = kConsultaTimbreFc;
      params =
          '''?RncEmisor=$rncEmisor&ENCF=$numeroComprobante&MontoTotal=$montoTotal&CodigoSeguridad=$codigoSeguridad'''
              .trim();
    }

    var uri = GeneratorEndPoint.getEndPoint('''$consultaTimbre$params'''.trim(),
        esResumen: esResumenE32);
    return uri;
  }

  Future<void> descargarSemilla() async {
    seedFile = await descargarSemillaDgii(tempDirName);
    seedXml = await seedFile?.readAsString() ?? '';
  }

  Future<XmlSignerModel> validarSemilla() async {
    var xmlSignerModel = await signerService.firmarXml(
      seedXml,
      File(path.join(dirProject.path, tempDirName, 'semilla_firmada.xml')),
    );

    json = await validarSemillaFirmada(xmlSignerModel.xmlFile);
    token = json?['token'] ?? '';
    seedSignFile = xmlSignerModel.xmlFile;
    seedSignXml = xmlSignerModel.xmlStr;
    return xmlSignerModel;
  }

  Future<XmlSignerModel> firmar() async {
    String tag = '';

    if (esResumenE32) {
      tag = 'ECF_';
    }
    final xmlFilePath = path.join(
        dirProject.path, tempDirName, '$tag$rncEmisor$numeroComprobante.xml');

    final rfceFilePath = path.join(
        dirProject.path, tempDirName, '$rncEmisor$numeroComprobante.xml');

    File xmlFile = File(xmlFilePath);

    File rfceFile = File(rfceFilePath);

    // 1. Firma el XML SIN CodigoSeguridadeCF
    xmlSignerModel = await signerService.firmarXml(xml, xmlFile);

    var finalXmlStr = xmlSignerModel?.xmlStr ?? '';

    // 2. Solo si es tipo E32, insertamos CodigoSeguridadeCF
    if (esResumenE32) {
      final signedXmlDoc = XmlDocument.parse(xmle32);

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

      xmlSignerModel = await signerService.firmarXml(finalXmlStr, rfceFile);
      ecfFile = rfceFile;
    } else {
      codigoSeguridad = xmlSignerModel?.codigoSeguridad ?? '';
      ecfFile = xmlFile;
    }

    ecfSignXml = xmlSignerModel?.xmlStr ?? '';

    return XmlSignerModel(
      xmlFile: xmlFile,
      xmlStr: finalXmlStr,
      codigoSeguridad: codigoSeguridad,
    );
  }

  Future<bool> enviarEcf() async {
    try {
      if (ecfFile == null) throw 'Archivo Xml del ecf firmado no existe';

      print(token);

      var res = await enviarEcfFirmado(ecfFile!, tipoEcf, token, esResumenE32);

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

  Future<Map<String, dynamic>> obtenerEcfEstadoDatos() async {
    try {
      var res = await obtenerEcfEstado(trackId, token);
      return res;
    } catch (e) {
      rethrow;
    }
  }

  @override
  String toString() {
    return '''
EcfModel(
  tipoEcf: $tipoEcf
  numeroComprobante: $numeroComprobante
  fechaEmision: $fechaEmision
  rncEmisor: $rncEmisor
  razonSocialEmisor: $razonSocialEmisor
  rncComprador: $rncComprador
  razonSocialComprador: $razonSocialComprador
  montoTotal: $montoTotal
  totalItbis: $totalItbis
  totalItbisRetencion: $totalItbisRetencion
  totalIsrRetencion: $totalIsrRetencion
  indicadorMontoGravado: $indicadorMontoGravado
  montoExento: $montoExento
  direccionEmisor: $direccionEmisor
  direccionComprador: $direccionComprador
  actividadEconomica: $actividadEconomica
  formaDePagos: $formasDePagos
  items: $items
  codigoSeguridad: $codigoSeguridad
  xmlFirmado: $ecfSignXml
  certificado: $certBase64
  trackId: $trackId
  )
''';
  }
}

class EcfDetailsModel {
  String cantidad;

  List<TipoCodigo> codigos;

  String nombreItem;

  String indicadorBienOServ;

  String indicadorFacturacion;

  String unidadMedida;

  String unidadReferencia;

  String precioUnitarioReferencia;

  String precioUnitario;

  String montoItem;

  String descuentoMonto;

  String recargoMonto;

  List<SubDescuento> subDescuentos = [];

  List<SubRecargo> subRecargos = [];

  List<ImpuestoAdicional> impuestosAdicionales;

  List<OtraMonedaDetalle> otraMonedaDetalles;

  Retencion? retencion;

  String descripcionItem;

  EcfDetailsModel(
      {required this.cantidad,
      this.codigos = const [],
      required this.nombreItem,
      this.descripcionItem = '',
      required this.indicadorBienOServ,
      required this.indicadorFacturacion,
      required this.unidadMedida,
      this.unidadReferencia = '',
      required this.precioUnitario,
      this.precioUnitarioReferencia = '',
      required this.montoItem,
      this.descuentoMonto = '',
      this.recargoMonto = '',
      this.subDescuentos = const [],
      this.subRecargos = const [],
      this.retencion,
      this.impuestosAdicionales = const [],
      this.otraMonedaDetalles = const []});

  Map<String, dynamic> toMap() {
    return {
      'cantidad': cantidad,
      'codigos': codigos.map((e) => e.toMap()).toList(),
      'nombreItem': nombreItem,
      'descripcionItem': descripcionItem,
      'indicadorBienOServ': indicadorBienOServ,
      'indicadorFacturacion': indicadorFacturacion,
      'unidadMedida': unidadMedida,
      'unidadReferencia': unidadReferencia,
      'precioUnitarioReferencia': precioUnitarioReferencia,
      'precioUnitario': precioUnitario,
      'montoItem': montoItem,
      'descuentoMonto': descuentoMonto,
      'recargoMonto': recargoMonto,
      'subDescuentos': subDescuentos.map((e) => e.toMap()).toList(),
      'subRecargos': subRecargos.map((e) => e.toMap()).toList(),
      'impuestosAdicionales':
          impuestosAdicionales.map((e) => e.toMap()).toList(),
    };
  }
}

class AprobacionComercial {
  String rncEmisor;
  String numeroComprobante;
  String rncComprador;
  String montoTotal;
  String estado;
  String detalleMotivoRechazo;
  String fechaEmision;
  String fechaHoraAprobacionComercial;
  String rsaPrivateKey;
  String certBase64;

  String tempDirName;

  File? xmlAprobacionFile;

  String token = '';

  File? seedFile;

  String seedXml = '';

  File? seedSignFile;

  String seedSignXml = '';

  Map<String, dynamic>? jsonData;

  late XmlSignerService signerService;

  AprobacionComercial(
      {required this.rncEmisor,
      required this.numeroComprobante,
      required this.rncComprador,
      required this.montoTotal,
      required this.estado,
      required this.detalleMotivoRechazo,
      required this.fechaEmision,
      required this.fechaHoraAprobacionComercial,
      required this.rsaPrivateKey,
      required this.certBase64,
      this.tempDirName = 'temp_2'}) {
    signerService =
        XmlSignerService(rsaPrivateKey: rsaPrivateKey, certBase64: certBase64);
  }

  String get xmlAprobacion {
    return '''
  <ACECF xsi:noNamespaceSchemaLocation="/Users/josue/Documents/ecf_dgii/eCFXmlModels/ACECF v.1.0.xsd" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance">
    <DetalleAprobacionComercial>
    <Version>1.0</Version>
    <RNCEmisor>$rncEmisor</RNCEmisor>
    <eNCF>$numeroComprobante</eNCF>
    <FechaEmision>$fechaEmision</FechaEmision>
    <MontoTotal>$montoTotal</MontoTotal>
    <RNCComprador>$rncComprador</RNCComprador>
    <Estado>$estado</Estado>
    ${detalleMotivoRechazo != '' ? '<DetalleMotivoRechazo>$detalleMotivoRechazo</DetalleMotivoRechazo>' : ''}
    <FechaHoraAprobacionComercial>$fechaHoraAprobacionComercial</FechaHoraAprobacionComercial>
    </DetalleAprobacionComercial>
    </ACECF>
  ''';
  }

  Future<void> descargarSemilla() async {
    seedFile = await descargarSemillaDgii(tempDirName);
    seedXml = await seedFile?.readAsString() ?? '';
  }

  Future<XmlSignerModel> validarSemilla() async {
    var xmlSignerModel = await signerService.firmarXml(
      seedXml,
      File(path.join(dirProject.path, tempDirName, 'semilla_firmada.xml')),
    );

    jsonData = await validarSemillaFirmada(xmlSignerModel.xmlFile);
    token = jsonData?['token'] ?? '';
    seedSignFile = xmlSignerModel.xmlFile;
    seedSignXml = xmlSignerModel.xmlStr;

    return xmlSignerModel;
  }

  Future<Map<String, dynamic>> enviarAprobacionComercialEcf() async {
    xmlAprobacionFile = File(path.join(dirProject.path, tempDirName,
        'ACECF_${rncComprador}_$numeroComprobante.xml'));

    var res = await signerService.firmarXml(xmlAprobacion, xmlAprobacionFile!);
    var result = await enviarAprobacionComercial(res.xmlFile, token);

    return result;
  }

  AprobacionComercial copyWith({
    String? rncEmisor,
    String? numeroComprobante,
    String? rncComprador,
    String? montoTotal,
    String? estado,
    String? detalleMotivoRechazo,
    String? fechaEmision,
    String? fechaHoraAprobacionComercial,
  }) {
    return AprobacionComercial(
        rncEmisor: rncEmisor ?? this.rncEmisor,
        numeroComprobante: numeroComprobante ?? this.numeroComprobante,
        rncComprador: rncComprador ?? this.rncComprador,
        montoTotal: montoTotal ?? this.montoTotal,
        estado: estado ?? this.estado,
        detalleMotivoRechazo: detalleMotivoRechazo ?? this.detalleMotivoRechazo,
        fechaEmision: fechaEmision ?? this.fechaEmision,
        fechaHoraAprobacionComercial:
            fechaHoraAprobacionComercial ?? this.fechaHoraAprobacionComercial,
        rsaPrivateKey: rsaPrivateKey,
        certBase64: certBase64);
  }

  Map<String, dynamic> toMap() {
    return {
      'rncEmisor': rncEmisor,
      'numeroComprobante': numeroComprobante,
      'rncComprador': rncComprador,
      'montoTotal': montoTotal,
      'estado': estado,
      'detalleMotivoRechazo': detalleMotivoRechazo,
      'fechaEmision': fechaEmision,
      'fechaHoraAprobacionComercial': fechaHoraAprobacionComercial,
    };
  }

  factory AprobacionComercial.fromMap(Map<String, dynamic> map) {
    return AprobacionComercial(
      rncEmisor: map['rncEmisor'],
      numeroComprobante: map['numeroComprobante'],
      rncComprador: map['rncComprador'],
      montoTotal: map['montoTotal'],
      estado: map['estado'],
      detalleMotivoRechazo: map['detalleMotivoRechazo'],
      fechaEmision: map['fechaEmision'],
      fechaHoraAprobacionComercial: map['fechaHoraAprobacionComercial'],
      rsaPrivateKey: map['rsaPrivateKey'],
      certBase64: map['certBase64'],
    );
  }

  String toJson() => json.encode(toMap());

  factory AprobacionComercial.fromJson(String source) =>
      AprobacionComercial.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'AprobacionComercial(rncEmisor: $rncEmisor, numeroComprobante: $numeroComprobante, rncComprador: $rncComprador, montoTotal: $montoTotal, estado: $estado, detalleMotivoRechazo: $detalleMotivoRechazo, fechaEmision: $fechaEmision, fechaHoraAprobacionComercial: $fechaHoraAprobacionComercial)';
  }

  @override
  bool operator ==(Object o) {
    if (identical(this, o)) return true;

    return o is AprobacionComercial &&
        o.rncEmisor == rncEmisor &&
        o.numeroComprobante == numeroComprobante &&
        o.rncComprador == rncComprador &&
        o.montoTotal == montoTotal &&
        o.estado == estado &&
        o.detalleMotivoRechazo == detalleMotivoRechazo &&
        o.fechaEmision == fechaEmision &&
        o.fechaHoraAprobacionComercial == fechaHoraAprobacionComercial;
  }

  @override
  int get hashCode {
    return rncEmisor.hashCode ^
        numeroComprobante.hashCode ^
        rncComprador.hashCode ^
        montoTotal.hashCode ^
        estado.hashCode ^
        detalleMotivoRechazo.hashCode ^
        fechaEmision.hashCode ^
        fechaHoraAprobacionComercial.hashCode;
  }
}

extension EcfPdfExtension on EcfModel {
  Future<pw.Document> generarPdfFactura() async {
    final doc = pw.Document();

    final qrData = uriEcf.toString();

    doc.addPage(
      pw.MultiPage(
          header: (ctx) {
            return pw.Column(
                crossAxisAlignment: pw.CrossAxisAlignment.start,
                children: [
                  pw.Text('Factura Electrónica e-CF Tipo $tipo',
                      style: pw.TextStyle(
                          fontSize: 18, fontWeight: pw.FontWeight.bold)),
                  pw.SizedBox(height: 10),
                  pw.Text('Comprobante: $numeroComprobante'),
                  pw.Text('Fecha de Emisión: $fechaEmision'),
                  pw.Text('Fecha de Vencimiento: $fechaVencimiento'),
                  pw.Text(
                      'Código de Seguridad: ${codigoSeguridad.substring(0, 6)}'),
                  pw.Divider(),
                  pw.Text('Emisor',
                      style: pw.TextStyle(fontWeight: pw.FontWeight.bold)),
                  pw.Text('RNC: $rncEmisor'),
                  pw.Text('Nombre: $razonSocialEmisor'),
                  pw.Text('Dirección: $direccionEmisor'),
                  pw.Text('Correo: $correoEmisor'),
                  pw.SizedBox(height: 10),
                  pw.Text('Comprador',
                      style: pw.TextStyle(fontWeight: pw.FontWeight.bold)),
                  pw.Text('RNC: $rncComprador'),
                  pw.Text('Nombre: $razonSocialComprador'),
                  pw.Text('Contacto: $contactoComprador'),
                  pw.Text('Dirección: $direccionComprador'),
                ]);
          },
          build: (context) => [
                pw.Column(
                  crossAxisAlignment: pw.CrossAxisAlignment.start,
                  children: [
                    pw.SizedBox(height: 10),
                    pw.Text('Detalles',
                        style: pw.TextStyle(fontWeight: pw.FontWeight.bold)),
                    pw.Table.fromTextArray(
                      headerDecoration:
                          pw.BoxDecoration(color: PdfColor.fromHex('#4E5C71')),
                      headerStyle:
                          pw.TextStyle(color: PdfColor.fromHex('#F8FAFC')),
                      rowDecoration: pw.BoxDecoration(
                          border: pw.Border(
                              bottom: pw.BorderSide(
                                  color: PdfColor.fromHex('#DFE1E5')))),
                      border: pw.TableBorder(
                          bottom: pw.BorderSide(
                              color: PdfColor.fromHex('#DFE1E5'))),
                      headers: ['Item', 'Cant', 'U.M', 'Precio', 'Total'],
                      data: items
                          .map((item) => [
                                item.nombreItem,
                                item.cantidad,
                                item.unidadMedida,
                                item.precioUnitario,
                                item.montoItem
                              ])
                          .toList(),
                    ),
                    pw.SizedBox(height: 10),
                    pw.Row(
                        mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
                        children: [
                          pw.Expanded(
                              child: pw.Column(
                                  crossAxisAlignment:
                                      pw.CrossAxisAlignment.start,
                                  children: [
                                pw.Text('Verificación QR',
                                    style: pw.TextStyle(
                                        fontWeight: pw.FontWeight.bold)),
                                pw.SizedBox(height: 10),
                                pw.BarcodeWidget(
                                  data: qrData,
                                  barcode: pw.Barcode.qrCode(),
                                  width: 120,
                                  height: 120,
                                ),
                                pw.SizedBox(height: 15),
                                pw.Text(codigoSeguridad),
                              ])),
                          pw.Expanded(
                              child: pw.Column(
                                  crossAxisAlignment:
                                      pw.CrossAxisAlignment.start,
                                  children: [
                                pw.Text('Totales',
                                    style: pw.TextStyle(
                                        fontWeight: pw.FontWeight.bold),
                                    textAlign: pw.TextAlign.left),
                                pw.Container(
                                  margin: pw.EdgeInsets.symmetric(vertical: 10),
                                  child: pw.Row(
                                      mainAxisAlignment:
                                          pw.MainAxisAlignment.spaceBetween,
                                      children: [
                                        pw.Text('Gravado:'),
                                        pw.Text('RD\$ $totalGravado',
                                            textAlign: pw.TextAlign.right),
                                      ]),
                                ),
                                pw.Container(
                                  margin: pw.EdgeInsets.symmetric(vertical: 10),
                                  child: pw.Row(
                                      mainAxisAlignment:
                                          pw.MainAxisAlignment.spaceBetween,
                                      children: [
                                        pw.Text('Total ITBIS:'),
                                        pw.Text('RD\$ $totalItbis',
                                            textAlign: pw.TextAlign.right),
                                      ]),
                                ),
                                pw.Container(
                                  margin: pw.EdgeInsets.symmetric(vertical: 10),
                                  child: pw.Row(
                                      mainAxisAlignment:
                                          pw.MainAxisAlignment.spaceBetween,
                                      children: [
                                        pw.Text('Imp. Adicional:'),
                                        pw.Text('RD\$ $montoImpuestoAdicional',
                                            textAlign: pw.TextAlign.right),
                                      ]),
                                ),
                                totalItbisRetencion != ''
                                    ? pw.Container(
                                        margin: pw.EdgeInsets.symmetric(
                                            vertical: 10),
                                        child: pw.Row(
                                            mainAxisAlignment: pw
                                                .MainAxisAlignment.spaceBetween,
                                            children: [
                                              pw.Text(
                                                'Total Itbis Retenido:',
                                              ),
                                              pw.Text(
                                                  'RD\$ $totalItbisRetencion',
                                                  textAlign:
                                                      pw.TextAlign.right),
                                            ]))
                                    : pw.SizedBox(),
                                totalIsrRetencion != ''
                                    ? pw.Container(
                                        margin: pw.EdgeInsets.symmetric(
                                            vertical: 10),
                                        child: pw.Row(
                                            mainAxisAlignment: pw
                                                .MainAxisAlignment.spaceBetween,
                                            children: [
                                              pw.Text('Total Isr Retenido:'),
                                              pw.Text('RD\$ $totalIsrRetencion',
                                                  textAlign:
                                                      pw.TextAlign.right),
                                            ]))
                                    : pw.SizedBox(),
                                pw.Container(
                                  margin: pw.EdgeInsets.symmetric(vertical: 10),
                                  child: pw.Row(
                                      mainAxisAlignment:
                                          pw.MainAxisAlignment.spaceBetween,
                                      children: [
                                        pw.Text('Total Facturado:'),
                                        pw.Text('RD\$ $montoTotal',
                                            textAlign: pw.TextAlign.right),
                                      ]),
                                )
                              ]))
                        ]),
                  ],
                ),
              ]),
    );

    return doc;
  }
}
