import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:intl/intl.dart';
import 'package:path/path.dart' as path;
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:xml/xml.dart';

import 'package:ecf_dgii/src/types/ecf.dart';
import 'package:ecf_dgii/src/types/endpoints.dart';
import 'package:ecf_dgii/src/utils/directories.dart';
import 'package:ecf_dgii/src/utils/ecf.functions.dart';
import 'package:ecf_dgii/src/utils/generate.endpoint.dart';
import 'package:ecf_dgii/src/utils/xml.signer.dart';

class OtraMonedaDetalle {
  /// Precio [OtraMonedaDetalle]
  String precioOtraMoneda;

  /// Descuento [OtraMonedaDetalle]
  String descuentoOtraMoneda;

  /// Recargos [OtraMonedaDetalle]
  String recargoOtraMoneda;

  /// Monto [OtraMonedaDetalle]
  String montoItemOtraMoneda;

  /// Inicio [OtraMonedaDetalle]
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

/// Creando [SubDescuento]
class SubDescuento {
  /// Tipo de [SubDescuento]
  String tipoSubDescuento;

  /// [SubDescuento] Porcentaje
  String subDescuentoPorcentaje;

  /// Monto [SubDescuento]
  String montoSubDescuento;

  /// Inicio de un [SubDescuento]
  SubDescuento(
      {required this.tipoSubDescuento,
      required this.subDescuentoPorcentaje,
      required this.montoSubDescuento});

  @override
  String toString() {
    return ''
        'SubDescuento(tipoSubDescuento: $tipoSubDescuento, subDescuentoPorcentaje: $subDescuentoPorcentaje, montoSubDescuento: $montoSubDescuento)';
  }

  /// Creando [Map] desde un [SubDescuento]

  toMap() {
    return {
      'tipoSubDescuento': tipoSubDescuento,
      'subDescuentoPorcentaje': subDescuentoPorcentaje,
      'montoSubDescuento': montoSubDescuento,
    };
  }
}

/// Creando [SubRecargo]
class SubRecargo {
  /// Tipo SubRecargo
  String tipoSubRecargo;

  /// SubRecargo Porcentaje
  String subRecargoPorcentaje;

  /// Monto SubRecargo
  String montoSubRecargo;

  /// Inicio del [SubRecargo]
  SubRecargo(
      {required this.tipoSubRecargo,
      required this.subRecargoPorcentaje,
      required this.montoSubRecargo});

  @override
  toString() {
    return '''
        'SubRecargo(tipoSubRecargo: $tipoSubRecargo, subRecargoPorcentaje: $subRecargoPorcentaje, montoSubRecargo: $montoSubRecargo)''';
  }

  /// Creando [Map] desde un [SubRecargo]

  toMap() {
    return {
      'tipoSubRecargo': tipoSubRecargo,
      'subRecargoPorcentaje': subRecargoPorcentaje,
      'montoSubRecargo': montoSubRecargo,
    };
  }
}

/// Creando [FormaDePago]
class FormaDePago {
  /// Tipo de forma de pago
  final String codigo;

  /// Monto del Pago
  final String monto;

  /// Inicio [FormaDePago]

  FormaDePago(this.codigo, this.monto);

  @override
  toString() {
    return 'FormaDePago(codigo: $codigo, monto: $monto)';
  }
}

class SubCantidad {
  String subCantidad;
  String codigoSubCantidad;
  SubCantidad({
    this.subCantidad = '',
    this.codigoSubCantidad = '',
  });

  SubCantidad copyWith({
    String subCantidad = '',
    String codigoSubCantidad = '',
  }) {
    return SubCantidad(
      subCantidad: subCantidad ?? this.subCantidad,
      codigoSubCantidad: codigoSubCantidad ?? this.codigoSubCantidad,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'subCantidad': subCantidad,
      'codigoSubCantidad': codigoSubCantidad,
    };
  }

  factory SubCantidad.fromMap(Map<String, dynamic> map) {
    return SubCantidad(
      subCantidad: map['subCantidad'],
      codigoSubCantidad: map['codigoSubCantidad'],
    );
  }

  String toJson() => json.encode(toMap());

  factory SubCantidad.fromJson(String source) =>
      SubCantidad.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() =>
      'SubCantidad(subCantidad: $subCantidad, codigoSubCantidad: $codigoSubCantidad)';

  @override
  bool operator ==(Object o) {
    if (identical(this, o)) return true;

    return o is SubCantidad &&
        o.subCantidad == subCantidad &&
        o.codigoSubCantidad == codigoSubCantidad;
  }

  @override
  int get hashCode => subCantidad.hashCode ^ codigoSubCantidad.hashCode;
}

/// Creando [Pagina]
class Pagina {
  /// Num de Linea desde
  String noLineaDesde;

  /// Num de linea hasta
  String noLineaHasta;

  /// Subtotal Monto Gravado Pagina
  String subtotalMontoGravadoPagina;

  /// Subtotal Monto Gravado1 Pagina
  String subtotalMontoGravado1Pagina;

  /// Subtotal Monto Gravado2 Pagina
  String subtotalMontoGravado2Pagina;

  /// Subtotal MontoGravado3 Pagina
  String subtotalMontoGravado3Pagina;

  /// Subtotal Exento Pagina
  String subtotalExentoPagina;

  /// Subtotal Itbis Pagina
  String subtotalItbisPagina;

  /// Subtotal Itbis1 Pagina
  String subtotalItbis1Pagina;

  /// Subtotal Itbis2 Pagina
  String subtotalItbis2Pagina;

  /// Subtotal Itbis3 Pagina
  String subtotalItbis3Pagina;

  /// Subtotal [ImpuestoAdicional] Pagina
  String subtotalImpuestoAdicionalPagina;

  /// Subtotal Impuesto Selectivo al Consumo Especifico de la Pagina
  String subtotalImpuestoSelectivoConsumoEspecificoPagina;

  /// Subtotal Otros Impuestos
  String subtotalOtrosImpuesto;

  /// Monto Subtotal Pagina
  String montoSubtotalPagina;

  /// Inicio [Pagina]
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

/// Creando [TipoCodigo]
class TipoCodigo {
  /// Tipo de codigo de un [EcfDetailsModel]
  String? tipoCodigo;

  /// Codigo Item de un [EcfDetailsModel]
  String? codigoItem;

  /// Inicio de un [TipoCodigo]
  TipoCodigo({this.tipoCodigo, this.codigoItem});

  @override
  toString() {
    return '''
        'TipoCodigo(tipoCodigo: $tipoCodigo, codigoItem: $codigoItem)''';
  }

  /// Creando [Map] de un [TipoCodigo]

  toMap() {
    return {
      'tipoCodigo': tipoCodigo,
      'codigoItem': codigoItem,
    };
  }
}

/// Creando [ImpuestoAdicional]
class ImpuestoAdicional {
  /// Tipo de Impuesto
  String? tipoImpuesto;

  /// Tasa de Impuesto Adicional
  String? tasaImpuestoAdicional;

  /// Monto Impuestos Selectivo al consumo Especifico
  String? montoImpuestoSelectivoConsumoEspecifico;

  /// Monto Impuesto selectivo al consumo
  String? montoImpuestoSelectivoConsumoAdvalorem;

  /// Otros impuestos adicionales
  String? otrosImpuestosAdicionales;

  /// Inicio de [ImpuestoAdicional]
  ImpuestoAdicional(
      {this.tipoImpuesto,
      this.tasaImpuestoAdicional,
      this.montoImpuestoSelectivoConsumoEspecifico = '',
      this.otrosImpuestosAdicionales = '',
      this.montoImpuestoSelectivoConsumoAdvalorem = ''});

  /// Generando [Map] de un [ImpuestoAdicional]

  Map<String, dynamic> toMap() {
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

/// Creando [Retencion]
class Retencion {
  /// Indicador Agente Retencion Percepcion del objeto [Retencion]
  String indicadorAgenteRetencionoPercepcion;

  /// Monto Itbis Retenido del objeto [Retencion]
  String montoITBISRetenido;

  /// Monto Isr Retenido del objeto [Retencion]
  String montoISRRetenido;

  /// Inicio [Retencion]
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

/// Creando [EcfModel]

class EcfModel {
  /// Tipo de [EcfModel] en formato [EcfType]
  EcfType tipoEcf;

  /// Rnc del Emisor del objeto [EcfModel]

  String rncEmisor;

  /// Razon social del Emisor del objeto [EcfModel]

  String razonSocialEmisor;

  /// Nombre del comercial

  String nombreComercial;

  /// Rnc del comprador

  String rncComprador;

  /// Identificador extranjero del comprador

  String identificadorExtranjero;

  /// Razon social del comprador

  String razonSocialComprador;

  /// Nombre de comprador

  String nombreComprador;

  /// Fecha de emision del objeto [EcfModel]

  String fechaEmision;

  /// Numero de comprobante del objeto [EcfModel]

  String numeroComprobante;

  /// Monto Total del objeto [EcfModel]

  String montoTotal;

  /// Monto no facturable del [EcfModel]

  String montoNoFacturable;

  /// Total Itbis Gravado

  String totalItbis;

  /// Total Itbis Gravado tasa 18

  String totalItbis18;

  /// Total Itbis Gravado tasa 16

  String totalItbis16;

  /// Total Itbis Gravado Tasa 0

  String totalItbisTasa0;

  /// Monto Impuesto Adicional Total del Objeto [EcfModel]

  String montoImpuestoAdicional;

  /// Lista [ImpuestoAdicional] del objeto [EcfModel]

  List<ImpuestoAdicional> impuestosAdicionales;

  /// Total Gravado del [EcfModel]

  String totalGravado;

  /// Total Gravado tasa 18 del [EcfModel]

  String totalGravado18;

  /// Total Gravado tasa 16 del [EcfModel]

  String totalGravado16;

  /// Total Gravado tasa 0 del [EcfModel]

  String totalGravadoTasa0;

  /// Itbis etiqueta tasa 18 de la DGII

  String itbis1;

  /// Itbis etiqueta tasa 16 de la DGII

  String itbis2;

  /// Itbis etiqueta Tasa 0 de la DGII

  String itbis3;

  /// Monto Exento del [EcfModel]

  String montoExento;

  /// Codigo de seguridad del [EcfModel] en formato [String]

  String codigoSeguridad = '';

  /// Archivo Ecf en formato [File]

  File? ecfXml;

  /// LLave privada del certificado

  String privateKey;

  /// Certificado en base64

  String certBase64;

  /// Archivo de semilla de la DGII en formato [File]

  File? seedFile;

  /// Semilla de la DGII en formato [String]

  String seedXml = '';

  /// Archivo de semilla firmado en formato [File]

  File? seedSignFile;

  /// Semilla firmada en formato [String]

  String seedSignXml = '';

  /// Archivo Ecf firmado en formato [File]

  File? ecfFile;

  /// Ecf firmado en formato [String]

  String ecfSignXml = '';

  /// Lista [EcfDetailsModel]

  List<EcfDetailsModel> items = [];

  /// Servicio de firmado del objeto [EcfModel]

  late XmlSignerService signerService;

  /// Datos en formato [Map] del objeto token de la DGII

  Map<String, dynamic>? json;

  /// Tipo de ingreso

  String tipoIngreso;

  /// Tipo de pago

  String tipoPago;

  /// Fecha limite de pago si la factura es a credito

  String fechaLimitePago;

  /// Indicador Monto Gravado

  String indicadorMontoGravado;

  /// Fecha de Vencimiento

  String fechaVencimiento;

  /// Direccion del Emisor

  String direccionEmisor;

  /// Sucursal del Emisor

  String sucursal;

  /// Municipio del Emisor

  String municipio;

  /// Provincia del Emisor

  String provincia;

  /// Telefono Emisor 1

  String telefonoEmisor1;

  /// Telefono Emisor 2

  String telefonoEmisor2;

  /// Telefono Emisor 3

  String telefonoEmisor3;

  /// Correo Emisor

  String correoEmisor;

  /// Website URL del emisor en formato [String]

  String website;

  /// Codigo Vendedor

  String codigoVendedor;

  /// Numero de Factura Interno

  String numeroFacturaInterna;

  /// Numero de Pedido Interno

  String numeroPedidoInterno;

  /// Zona de venta

  String zonaVenta;

  /// Informacion adicional del emisor

  String informacionAdicionalEmisor;

  /// Contacto del comprador

  String contactoComprador;

  /// Correo del comprador

  String correoComprador;

  /// Telefono Adicional del comprador

  String telefonoAdicional;

  /// Direccion del comprador

  String direccionComprador;

  /// Municipio del comprador

  String municipioComprador;

  /// Provincia del comprador

  String provinciaComprador;

  /// Fecha de entrega

  String fechaEntrega;

  String contactoEntrega;

  String direccionEntrega;

  /// Fecha de orden de compra

  String fechaOrdenCompra;

  /// Numero de orden de compra

  String numeroOrdenCompra;

  /// Codigo interno del comprador

  String codigoInternoComprador;

  /// Fecha de embarque

  String fechaEmbarque;

  /// Numero de embarque

  String numeroEmbarque;

  /// Numero de contenedor

  String numeroContenedor;

  /// Numero de Referencia

  String numeroReferencia;

  String pesoBruto;

  String pesoNeto;

  String unidadPesoBruto;

  String unidadPesoNeto;

  String cantidadBulto;

  String unidadBulto;

  String volumenBulto;

  String unidadVolumen;

  /// Nombre de puerto de embarque

  String nombrePuertoEmbarque;

  /// Condiciones de entrega

  String condicionesEntrega;

  String totalFob;

  String seguro;

  String flete;

  String totalCif;

  String regimenAduanero;

  String nombrePuertoSalida;

  String nombrePuertoDesembarque;

  String viaTransporte;

  String paisOrigen;

  /// Pais destino

  String paisDestino;

  String direccionDestino;

  /// Nombre de Conductor

  String conductor;

  /// Documento de Transporte

  String documentoTransporte;

  /// Ficha

  String ficha;

  /// Placa de vehiculo

  String placa;

  /// Ruta de Transporte

  String rutaTransporte;

  /// Zona de Transporte

  String zonaTransporte;

  /// Numero albaran

  String numeroAlbaran;

  /// Actividad Economica en formato [String]

  String actividadEconomica;

  /// Total Itbis Retencion del objeto [EcfModel]

  String totalItbisRetencion;

  /// Total Isr Retencion del objeto [EcfModel]

  String totalIsrRetencion;

  /// Lista [FormaDePago] del objeto [EcfModel]

  List<FormaDePago> formasDePagos;

  /// Termino de pago del [EcfModel]

  String terminoPago = '4';

  /// Banco Pago

  String bancoPago;

  /// Lista [Pagina] del objeto [EcfModel]

  List<Pagina> paginas;

  /// Rnc otro contribuyente

  String rncOtroContribuyente;

  /// Numero de comprobante modificado en formato [String]

  String? numeroComprobanteModificado;

  /// Fecha de Emision Ncf Modificado

  String? fechaEmisionNcfModificado;

  /// Una Razon por que se da la modificacion en formato [String]

  String? razonModificacion;

  /// Codigo de Modificacion de la nota de credito

  String? codigoModificacion;

  /// Indicador de nota de credito del objeto [EcfModel] debes pasar esto cuando emitas notas de credito

  String? indicadorNotaCredito;

  /// Total de paginas

  String? totalPaginas;

  /// Monto Facturado en el periodo

  String? montoPeriodo;

  /// Monto Avance de Pago

  String montoAvancePago;

  /// Valor a Pagar

  String valorPagar;

  /// Tipo Moneda del objeto [EcfModel]

  String tipoMoneda;

  /// Tipo de cambio del objeto [EcfModel]

  String tipoCambio;

  /// Monto Gravado Total en otra moneda

  String montoGravadoTotalOtraMoneda;

  /// Monto Gravado Total en tasa 18 en otra moneda

  String montoGravadoTotalOtraMoneda1;

  /// Monto Gravado Total en tasa 16 en otra moneda

  String montoGravadoTotalOtraMoneda2;

  /// Monto Gravado Total en tasa 0 en otra moneda

  String montoGravadoTotalOtraMoneda3;

  /// Monto Exento en otra moneda

  String montoExentoOtraMoneda;

  /// Total Itbis en otra moneda resultante de la suma

  String totalItbisOtraMoneda;

  /// Total Itbis en tasa 18 en otra moneda

  String totalItbis1OtraMoneda;

  /// Total Itbis en tasa 16 en otra moneda

  String totalItbis2OtraMoneda;

  /// Total Itbis en tasa 0 en otra moneda

  String totalItbis3OtraMoneda;

  /// Monto Total en otra moneda

  String montoTotalOtraMoneda;

  /// Saldo Anterior

  String? saldoAnterior;

  /// Ruta de venta

  String? rutaVenta;

  /// Token de la DGII en formato [String]

  String token = '';

  /// Fecha de expiracion token

  DateTime? expira;

  /// TrackId del [EcfModel]

  String trackId = '';

  /// Fecha y Hora de la firma

  String fechaHoraFirma = '';

  /// Fecha de la firma

  String fechaFirma = '';

  /// [XmlSignerModel] objeto resultante de firmar el XML

  XmlSignerModel? xmlSignerModel;

  /// Nombre de directorio de datos del objeto [EcfModel]

  String tempDirName;

  /// Inicio de [EcfModel]

  EcfModel(
      {this.tipoEcf = EcfType.e31,
      this.tempDirName = 'temp',
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
      this.fechaLimitePago = '',
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
      this.contactoEntrega = '',
      this.direccionEntrega = '',
      this.fechaOrdenCompra = '',
      this.numeroOrdenCompra = '',
      this.codigoInternoComprador = '',
      this.fechaEmbarque = '',
      this.numeroEmbarque = '',
      this.numeroContenedor = '',
      this.numeroReferencia = '',
      this.pesoBruto = '',
      this.pesoNeto = '',
      this.unidadPesoBruto = '',
      this.unidadPesoNeto = '',
      this.unidadBulto = '',
      this.cantidadBulto = '',
      this.volumenBulto = '',
      this.unidadVolumen = '',
      this.nombrePuertoEmbarque = '',
      this.condicionesEntrega = '',
      this.totalFob = '',
      this.seguro = '',
      this.flete = '',
      this.totalCif = '',
      this.regimenAduanero = '',
      this.nombrePuertoSalida = '',
      this.nombrePuertoDesembarque = '',
      this.viaTransporte = '',
      this.paisOrigen = '',
      this.numeroAlbaran = '',
      this.numeroComprobanteModificado = '',
      this.paisDestino = '',
      this.direccionDestino = '',
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

  /// Determinar si es una factura de consumo menor a 250k

  bool get esResumenE32 {
    double monto = double.parse(montoTotal);
    return tipoEcf == EcfType.e32 && monto < 250000.00;
  }

  /// Obtener [EcfModel] esquema desde una [Uri]

  String get ecfXsdFile {
    if (tipoEcf == EcfType.e31) {
      return 'https://gist.githubusercontent.com/Josue0z/a41fd2d80d6de98c501272295d3e28c9/raw/5c6de98633c6fe4e0e4852e159709ae0e098bbe9/e-CF%252031%2520v.1.0.xsd';
    }
    if (esResumenE32) {
      return 'https://gist.githubusercontent.com/Josue0z/51657e8972853c993d4bd88bd316e093/raw/78d2557e77505265b66bcc69db15579b8616151c/RFCE%252032%2520v.1.0.xsd';
    }
    if (tipoEcf == EcfType.e32) {
      return 'https://gist.githubusercontent.com/Josue0z/51657e8972853c993d4bd88bd316e093/raw/78d2557e77505265b66bcc69db15579b8616151c/e-CF%252032%2520v.1.0.xsd';
    }
    if (tipoEcf == EcfType.e33) {
      return 'https://gist.githubusercontent.com/Josue0z/51657e8972853c993d4bd88bd316e093/raw/78d2557e77505265b66bcc69db15579b8616151c/e-CF%252033%2520v.1.0.xsd';
    }
    if (tipoEcf == EcfType.e34) {
      return 'https://gist.githubusercontent.com/Josue0z/51657e8972853c993d4bd88bd316e093/raw/78d2557e77505265b66bcc69db15579b8616151c/e-CF%252034%2520v.1.0.xsd';
    }
    if (tipoEcf == EcfType.e41) {
      return 'https://gist.githubusercontent.com/Josue0z/51657e8972853c993d4bd88bd316e093/raw/78d2557e77505265b66bcc69db15579b8616151c/e-CF%252041%2520v.1.0.xsd';
    }
    if (tipoEcf == EcfType.e43) {
      return 'https://gist.githubusercontent.com/Josue0z/51657e8972853c993d4bd88bd316e093/raw/78d2557e77505265b66bcc69db15579b8616151c/e-CF%252043%2520v.1.0.xsd';
    }

    if (tipoEcf == EcfType.e44) {
      return 'https://gist.githubusercontent.com/Josue0z/51657e8972853c993d4bd88bd316e093/raw/2d4895ec43e5cd03fd177a0215325b24d8a90838/e-CF%252044%2520v.1.0.xsd';
    }

    if (tipoEcf == EcfType.e45) {
      return 'https://gist.githubusercontent.com/Josue0z/51657e8972853c993d4bd88bd316e093/raw/2d4895ec43e5cd03fd177a0215325b24d8a90838/e-CF%252045%2520v.1.0.xsd';
    }

    if (tipoEcf == EcfType.e46) {
      return 'https://gist.githubusercontent.com/Josue0z/51657e8972853c993d4bd88bd316e093/raw/19eb8869850a1c30b36b6d829a90d13ec3ac99ae/e-CF%252046%2520v.1.0.xsd';
    }
    if (tipoEcf == EcfType.e47) {
      return 'https://gist.githubusercontent.com/Josue0z/51657e8972853c993d4bd88bd316e093/raw/78d2557e77505265b66bcc69db15579b8616151c/e-CF%252047%2520v.1.0.xsd';
    }
    return '';
  }

  /// Obtener tipo de [EcfModel]

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

  /// Obtener [EcfModel] xml en formato [String]

  String get xml {
    return xmlDefault;
  }

  /// Generar representacion de un [EcfModel] segun el modelo de la DGII

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
      ${fechaLimitePago != '' ? '<FechaLimitePago>$fechaLimitePago</FechaLimitePago>' : ''}
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
      ${contactoEntrega != '' ? '<ContactoEntrega>$contactoEntrega</ContactoEntrega>' : ''}
      ${direccionEntrega != '' ? '<DireccionEntrega>$direccionEntrega</DireccionEntrega>' : ''}
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
         ${totalFob != '' ? '<TotalFob>$totalFob</TotalFob>' : ''}
         ${seguro != '' ? '<Seguro>$seguro</Seguro>' : ''}
         ${flete != '' ? '<Flete>$flete</Flete>' : ''}
         ${totalCif != '' ? '<TotalCif>$totalCif</TotalCif>' : ''}
         ${regimenAduanero != '' ? '<RegimenAduanero>$regimenAduanero</RegimenAduanero>' : ''}
         ${nombrePuertoSalida != '' ? '<NombrePuertoSalida>$nombrePuertoSalida</NombrePuertoSalida>' : ''}
         ${nombrePuertoDesembarque != '' ? '<NombrePuertoDesembarque>$nombrePuertoDesembarque</NombrePuertoDesembarque>' : ''}
         ${pesoBruto != '' ? '<PesoBruto>$pesoBruto</PesoBruto>' : ''}
         ${pesoNeto != '' ? '<PesoNeto>$pesoNeto</PesoNeto>' : ''}
         ${unidadPesoBruto != '' ? '<UnidadPesoBruto>$unidadPesoBruto</UnidadPesoBruto>' : ''}
         ${unidadPesoNeto != '' ? '<UnidadPesoNeto>$unidadPesoNeto</UnidadPesoNeto>' : ''}
         ${cantidadBulto != '' ? '<CantidadBulto>$cantidadBulto</CantidadBulto>' : ''}
         ${unidadBulto != '' ? '<UnidadBulto>$unidadBulto</UnidadBulto>' : ''}
         ${volumenBulto != '' ? '<VolumenBulto>$volumenBulto</VolumenBulto>' : ''}
         ${unidadVolumen != '' ? '<UnidadVolumen>$unidadVolumen</UnidadVolumen>' : ''}
        </InformacionesAdicionales>
       ''' : ''}
     ${paisDestino != '' || conductor != '' || documentoTransporte != '' || ficha != '' || placa != '' || rutaTransporte != '' || zonaTransporte != '' || numeroAlbaran != '' ? '''
     <Transporte>
      ${viaTransporte != '' ? '<ViaTransporte>$viaTransporte</ViaTransporte>' : ''}
      ${paisOrigen != '' ? '<PaisOrigen>$paisOrigen</PaisOrigen>' : ''}
      ${direccionDestino != '' ? '<DireccionDestino>$direccionDestino</DireccionDestino>' : ''}
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
    ${e.cantidadReferencia != '' ? '<CantidadReferencia>${e.cantidadReferencia}</CantidadReferencia>' : ''}
    ${e.unidadReferencia != '' ? '<UnidadReferencia>${e.unidadReferencia}</UnidadReferencia>' : ''}
    ${e.subCantidades.isNotEmpty ? '''
      <TablaSubcantidad>
          ${e.subCantidades.map((e) => '''
             <SubcantidadItem>
              ${e.subCantidad != '' ? '<Subcantidad>${e.subCantidad}</Subcantidad>' : ''}
              ${e.codigoSubCantidad != '' ? '<CodigoSubcantidad>${e.codigoSubCantidad}</CodigoSubcantidad>' : ''}
             </SubcantidadItem>
        ''').toList().join()}
      </TablaSubcantidad>
      ''' : ''}
    ${e.gradosAlcohol != '' ? '<GradosAlcohol>${e.gradosAlcohol}</GradosAlcohol>' : ''}
    ${e.precioUnitarioReferencia != '' ? '<PrecioUnitarioReferencia>${e.precioUnitarioReferencia}</PrecioUnitarioReferencia>' : ''}
    ${e.fechaElaboracion != '' ? '<FechaElaboracion>${e.fechaElaboracion}</FechaElaboracion>' : ''}
    ${e.fechaVencimientoItem != '' ? '<FechaVencimientoItem>${e.fechaVencimientoItem}</FechaVencimientoItem>' : ''}
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

  /// Generar representacion de un RFCE (Factura de Consumo menor a 250k)

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

  /// Generar [Uri] de la DGII

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

  /// Descargar semilla DGII

  Future<void> descargarSemilla() async {
    try {
      seedFile = await descargarSemillaDgii(tempDirName);
      seedXml = await seedFile?.readAsString() ?? '';
    } catch (e) {
      rethrow;
    }
  }

  /// Validar semilla firmada DGII

  Future<XmlSignerModel?> validarSemilla() async {
    try {
      var expiracionArchivo =
          File(path.join(tempDirPath, 'expiracion_data.txt'));

      await expiracionArchivo.create(recursive: true);
      DateTime now = DateTime.now();
      XmlSignerModel? xmlSignerModel;

      int? tiempoActual = now.millisecondsSinceEpoch;

      String expiracionData = await expiracionArchivo.readAsString();

      if (expiracionData.isNotEmpty) {
        json = jsonDecode(expiracionData);
      }

      if (json != null) {
        expira = DateTime.tryParse(json?['expira']);
      }

      int? expiracionTiempoData = expira?.millisecondsSinceEpoch;

      xmlSignerModel = await signerService.firmarXml(
        seedXml,
        File(path.join(tempDirPath, tempDirName, 'semilla_firmada.xml')),
      );

      if (expiracionTiempoData != null &&
          tiempoActual >= expiracionTiempoData) {
        json = await validarSemillaFirmada(xmlSignerModel.xmlFile);
      } else if (expiracionTiempoData == null) {
        json = await validarSemillaFirmada(xmlSignerModel.xmlFile);
      } else {
        print('no ha vencido el token');
      }
      token = json?['token'] ?? '';

      expira = DateTime.tryParse(json?['expira']);

      await expiracionArchivo.writeAsString(jsonEncode(json));

      seedSignFile = xmlSignerModel.xmlFile;
      seedSignXml = xmlSignerModel.xmlStr;
      return xmlSignerModel;
    } catch (e) {
      rethrow;
    }
  }

  /// Firmar [EcfModel]

  Future<XmlSignerModel> firmar() async {
    try {
      String tag = '';

      if (esResumenE32) {
        tag = 'ECF_';
      }
      final xmlFilePath = path.join(
          tempDirPath, tempDirName, '$tag$rncEmisor$numeroComprobante.xml');

      final rfceFilePath = path.join(
          tempDirPath, tempDirName, '$rncEmisor$numeroComprobante.xml');

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
    } catch (e) {
      rethrow;
    }
  }

  /// Enviar [EcfModel]

  Future<Map<String, dynamic>> enviarEcf() async {
    try {
      if (ecfFile == null) throw 'Archivo Xml del ecf firmado no existe';

      var res = await enviarEcfFirmado(ecfFile!, tipoEcf, token, esResumenE32);

      var urlsDir = Directory(path.join(tempDirPath, 'urls'));

      if (res['trackId'] != null) {
        trackId = res['trackId'];
      }

      await urlsDir.create(recursive: true);

      var fileUrlsPath = path.join(urlsDir.path, 'urls.txt');
      File fileUrls = File(fileUrlsPath);

      await fileUrls.create(recursive: true);

      await fileUrls.writeAsString('${uriEcf.toString()}\n',
          mode: FileMode.append);

      return res;
    } catch (e) {
      rethrow;
    }
  }

  /// Obtener estado de [EcfModel]

  Future<Map<String, dynamic>> obtenerEcfEstadoDatos() async {
    try {
      var res = await obtenerEcfEstado(trackId, token);
      return res;
    } catch (e) {
      rethrow;
    }
  }

  /// Generar [EcfModel] en formato [String]

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

/// Creando objeto [EcfDetailsModel]

class EcfDetailsModel {
  /// Cantidad de [EcfDetailsModel]

  String cantidad;

  /// Lista [TipoCodigo] del objeto [EcfDetailsModel]

  List<TipoCodigo> codigos;

  /// Nombre Item del objeto [EcfDetailsModel]

  String nombreItem;

  /// Indicador de bien o servicio del objeto [EcfDetailsModel]

  String indicadorBienOServ;

  /// Indicador de facturacion del objeto [EcfDetailsModel]

  String indicadorFacturacion;

  /// Unidad de Medida del objeto [EcfDetailsModel]

  String unidadMedida;

  String fechaElaboracion;

  String fechaVencimientoItem;

  String cantidadReferencia;

  /// Unidad de Referencia del objeto [EcfDetailsModel]

  String unidadReferencia;

  List<SubCantidad> subCantidades;

  String gradosAlcohol;

  /// Precio Unitario de Referencia del objeto [EcfDetailsModel]

  String precioUnitarioReferencia;

  /// Precio Unitario del objeto [EcfDetailsModel]

  String precioUnitario;

  /// Monto Item del objeto [EcfDetailsModel]

  String montoItem;

  /// Descuento Monto del objeto [EcfDetailsModel]

  String descuentoMonto;

  /// Recargo Monto del objeto [EcfDetailsModel]

  String recargoMonto;

  /// Lista [SubDescuento] del objeto [EcfDetailsModel]

  List<SubDescuento> subDescuentos = [];

  /// Lista [SubRecargo] del objeto [EcfDetailsModel]

  List<SubRecargo> subRecargos = [];

  /// Lista [ImpuestoAdicional] del objeto [EcfDetailsModel]

  List<ImpuestoAdicional> impuestosAdicionales;

  /// Lista [OtraMonedaDetalle] del objeto [EcfDetailsModel]

  List<OtraMonedaDetalle> otraMonedaDetalles;

  /// Objeto [Retencion] del objeto [EcfDetailsModel]

  Retencion? retencion;

  /// Descripcion de item [EcfDetailsModel]

  String descripcionItem;

  /// Inicio de [EcfDetailsModel]

  EcfDetailsModel(
      {required this.cantidad,
      this.codigos = const [],
      required this.nombreItem,
      this.descripcionItem = '',
      required this.indicadorBienOServ,
      required this.indicadorFacturacion,
      required this.unidadMedida,
      this.fechaElaboracion = '',
      this.fechaVencimientoItem = '',
      this.cantidadReferencia = '',
      this.unidadReferencia = '',
      this.subCantidades = const [],
      required this.precioUnitario,
      this.gradosAlcohol = '',
      this.precioUnitarioReferencia = '',
      required this.montoItem,
      this.descuentoMonto = '',
      this.recargoMonto = '',
      this.subDescuentos = const [],
      this.subRecargos = const [],
      this.retencion,
      this.impuestosAdicionales = const [],
      this.otraMonedaDetalles = const []});

  /// Generar map de un [EcfDetailsModel]

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

/// Creando Objeto [AprobacionComercial]

class AprobacionComercial {
  /// Rnc Emisor de la [AprobacionComercial]
  String rncEmisor;

  /// Numero de comprobante de la [AprobacionComercial]

  String numeroComprobante;

  /// Rnc Comprador de la [AprobacionComercial]

  String rncComprador;

  /// Monto Total de la [AprobacionComercial]

  String montoTotal;

  /// Estado de la [AprobacionComercial]

  String estado;

  /// Detalle o Motivo de Rechazo de la [AprobacionComercial] en formato [String]

  String detalleMotivoRechazo;

  /// Fecha de Emision de [AprobacionComercial]
  String fechaEmision;

  /// Fecha y Hora de [AprobacionComercial]

  String fechaHoraAprobacionComercial;

  /// Clave privada en formato [String]
  String rsaPrivateKey;

  /// Certificado en formato [String]
  String certBase64;

  /// Nombre de Directorio de guardado de datos
  String tempDirName;

  /// Archivo xml de [AprobacionComercial]

  File? xmlAprobacionFile;

  /// Token de la DGII obtenido en formato [String]

  String token = '';

  /// Archivo de semilla original

  File? seedFile;

  /// Semilla en formato [String]

  String seedXml = '';

  /// Archivo de semilla firmada

  File? seedSignFile;

  /// Semilla firmada en formato [String]

  String seedSignXml = '';

  /// Datos Map de la DGII que contienen el objeto Token y fecha de expiracion en formato [Map]

  Map<String, dynamic>? jsonData;

  /// Servicio de firmado

  late XmlSignerService signerService;

  /// Inicio de [AprobacionComercial]

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

  /// Representacion de [AprobacionComercial] basado en el modelo de la DGII

  String get xmlAprobacion {
    return '''
  <ACECF xsi:noNamespaceSchemaLocation="https://gist.githubusercontent.com/Josue0z/51657e8972853c993d4bd88bd316e093/raw/78d2557e77505265b66bcc69db15579b8616151c/ACECF%2520v.1.0.xsd" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance">
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

  /// Descargar semilla DGII

  Future<void> descargarSemilla() async {
    seedFile = await descargarSemillaDgii(tempDirName);
    seedXml = await seedFile?.readAsString() ?? '';
  }

  /// Validar semilla firmada DGII

  Future<XmlSignerModel> validarSemilla() async {
    var xmlSignerModel = await signerService.firmarXml(
      seedXml,
      File(path.join(tempDirPath, tempDirName, 'semilla_firmada.xml')),
    );

    jsonData = await validarSemillaFirmada(xmlSignerModel.xmlFile);
    token = jsonData?['token'] ?? '';
    seedSignFile = xmlSignerModel.xmlFile;
    seedSignXml = xmlSignerModel.xmlStr;

    return xmlSignerModel;
  }

  /// Enviar [AprobacionComercial] de un ecf

  Future<Map<String, dynamic>> enviarAprobacionComercialEcf() async {
    xmlAprobacionFile = File(path.join(tempDirPath, tempDirName,
        'ACECF_${rncComprador}_$numeroComprobante.xml'));

    var res = await signerService.firmarXml(xmlAprobacion, xmlAprobacionFile!);
    var result = await enviarAprobacionComercial(res.xmlFile, token);

    return result;
  }

  /// Copiar datos de la [AprobacionComercial]

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

  /// Generar un mapa de datos de una [AprobacionComercial]

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

  /// Generar [AprobacionComercial] desde un map

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

  /// Generar json de la [AprobacionComercial] desde un map
  String toJson() => json.encode(toMap());

  /// Generar una aprobacion comercial desde un map
  factory AprobacionComercial.fromJson(String source) =>
      AprobacionComercial.fromMap(json.decode(source) as Map<String, dynamic>);

  /// Generar una [AprobacionComercial] en formato [String]
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

String labelEcfTipo(String tipoEcf) {
  const tipos = {
    '31': 'FACTURA DE CRÉDITO FISCAL',
    '32': 'FACTURA DE CONSUMIDOR FINAL',
    '33': 'NOTA DE DÉBITO',
    '34': 'NOTA DE CRÉDITO',
    '41': 'COMPROBANTE DE COMPRAS',
    '43': 'COMPROBANTE PARA GASTOS MENORES',
    '44': 'COMPROBANTE PARA REGIMENES ESPECIALES',
    '45': 'COMPROBANTE GUBERNAMENTAL',
    '46': 'COMPROBANTE PARA EXPORTACIONES',
    '47': 'COMPROBANTE PARA PAGOS AL EXTERIOR',
  };

  return tipos[tipoEcf] ?? 'TIPO DESCONOCIDO';
}

/// Generar pdf desde xml firmado
Future<pw.Document> generarPdfDesdeXmlFirmado(String pathXml,
    {required String url,
    List<List<String>> items = const [],
    String direccionEmisor = '',
    String correoEmisor = '',
    String fechaVencimiento = ''}) async {
  final xmlContent = await File(pathXml).readAsString();
  final xml = XmlDocument.parse(xmlContent);
  final doc = pw.Document();

  // 🔍 Helpers para extraer textos clave
  String val(String tag) => xml.findAllElements(tag).firstOrNull?.text ?? '';

  String labelEcftipoEcf = val('TipoeCF');
  String labelNcf = labelEcfTipo(labelEcftipoEcf);

  String monto(String tag) {
    final m = val(tag);
    return m.isEmpty ? '0.00' : double.parse(m).toStringAsFixed(2);
  }

  // ✨ Estructura como en el modelo PDF
  final qr = pw.BarcodeWidget(
    data: url,
    barcode: pw.Barcode.qrCode(),
    width: 100,
    height: 100,
  );

  final detallesItems = items.isNotEmpty
      ? items
      : xml.findAllElements('Item').map((item) {
          return [
            item.getElement('CantidadItem')?.text ?? '',
            item.getElement('UnidadMedida')?.text ?? '',
            item.getElement('NombreItem')?.text ?? '',
            monto(item.getElement('PrecioUnitarioItem')?.name.local ?? ''),
            monto(item.getElement('MontoItem')?.name.local ?? ''),
          ];
        }).toList();

  int pagina = 0;

  Uri uriData = Uri.parse(url);
  String fechaFirma = uriData.queryParameters['FechaFirma'] ?? '';

  doc.addPage(
    pw.MultiPage(
      pageFormat: PdfPageFormat.a4,
      footer: (ctx) {
        return pw.Row(
            mainAxisAlignment: pw.MainAxisAlignment.center,
            children: [pw.Text('Pagina ${pagina++}')]);
      },
      header: (ctx) {
        return pw.Column(
            crossAxisAlignment: pw.CrossAxisAlignment.start,
            children: [
              pw.Text(val('RazonSocialEmisor'),
                  style: pw.TextStyle(
                      fontSize: 20, fontWeight: pw.FontWeight.bold)),
              pw.SizedBox(height: 10),
              pw.Text(
                'RNC: ${val('RNCEmisor')}',
              ),
              pw.Row(children: [
                pw.Expanded(
                    child: pw.Column(
                        crossAxisAlignment: pw.CrossAxisAlignment.start,
                        children: [
                      pw.Text('Dirección: ${val('DireccionEmisor')}'),
                      pw.Text('Correo: ${val('CorreoEmisor')}'),
                    ])),
                pw.Expanded(
                    child: pw.Column(
                        crossAxisAlignment: pw.CrossAxisAlignment.end,
                        children: [
                      pw.Text(labelNcf,
                          style: pw.TextStyle(
                              fontSize: 15, fontWeight: pw.FontWeight.bold),
                          textAlign: pw.TextAlign.right),
                      pw.Text('Comprobante: ${val('eNCF')}',
                          textAlign: pw.TextAlign.right),
                      val('NCFModificado') != ''
                          ? pw.Text(
                              'Comprobante Afectado: ${val('NCFModificado')}',
                              textAlign: pw.TextAlign.right)
                          : pw.SizedBox(),
                      pw.Text('Fecha de Emisión: ${val('FechaEmision')}',
                          textAlign: pw.TextAlign.right),
                      pw.Text(
                          'Fecha de Vencimiento: ${val('FechaVencimientoSecuencia') != '' ? val('FechaVencimientoSecuencia') : fechaVencimiento}',
                          textAlign: pw.TextAlign.right),
                    ]))
              ]),
              pw.SizedBox(height: 20),
              pw.Text(
                  'RNC Cliente: ${val('RNCComprador') != '' ? val('RNCComprador') : 'S/N'}'),
              pw.Text(
                  'Razón Social Cliente: ${val('RazonSocialComprador') != '' ? val('RazonSocialComprador') : 'CLIENTE CONTADO'}'),
              pw.Text(
                  'Contacto: ${val('ContactoComprador') != '' ? val('ContactoComprador') : 'S/N'}'),
              pw.Text(
                  'Dirección: ${val('DireccionComprador') != '' ? val('DireccionComprador') : 'S/N'}'),
              pw.SizedBox(height: 20)
            ]);
      },
      build: (ctx) => [
        pw.TableHelper.fromTextArray(
          headerDecoration:
              pw.BoxDecoration(color: PdfColor.fromHex('#4E5C71')),
          headerStyle: pw.TextStyle(color: PdfColor.fromHex('#F8FAFC')),
          rowDecoration: pw.BoxDecoration(
              border: pw.Border(
                  bottom: pw.BorderSide(color: PdfColor.fromHex('#DFE1E5')))),
          border: pw.TableBorder(
              bottom: pw.BorderSide(color: PdfColor.fromHex('#DFE1E5'))),
          headers: ['Cant.', 'U.M', 'Descripción', 'Precio', 'Total'],
          data: detallesItems,
          headerAlignment: pw.Alignment.centerLeft,
          cellAlignment: pw.Alignment.centerLeft,
          cellStyle: pw.TextStyle(fontSize: 10),
        ),
        pw.SizedBox(height: 20),
        pw.Row(children: [
          pw.Expanded(
              child: pw.Column(
                  crossAxisAlignment: pw.CrossAxisAlignment.start,
                  children: [
                qr,
                pw.SizedBox(height: 20),
                pw.Row(children: [
                  pw.Text('Codigo de Seguridad:',
                      style: pw.TextStyle(
                          fontWeight: pw.FontWeight.bold, fontSize: 10)),
                  pw.SizedBox(width: 5),
                  pw.Text(
                      val('CodigoSeguridadeCF') != ''
                          ? val('CodigoSeguridadeCF')
                          : val('SignatureValue').substring(0, 6),
                      style: pw.TextStyle(fontSize: 10)),
                ]),
                pw.Row(children: [
                  pw.Text('Fecha de Firma:',
                      style: pw.TextStyle(
                          fontSize: 10, fontWeight: pw.FontWeight.bold)),
                  pw.SizedBox(width: 5),
                  pw.Text(fechaFirma, style: pw.TextStyle(fontSize: 10)),
                ])
              ])),
          pw.Expanded(
              child: pw.Column(children: [
            pw.Container(
                margin: pw.EdgeInsets.symmetric(vertical: 10),
                child: pw.Row(
                    mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
                    children: [
                      pw.Text(
                        'Total Gravado:',
                      ),
                      pw.Text('RD\$ ${monto('MontoGravadoTotal')}',
                          textAlign: pw.TextAlign.right),
                    ])),
            pw.Divider(height: 0.5, color: PdfColor.fromHex('#DFE1E5')),
            pw.Container(
                margin: pw.EdgeInsets.symmetric(vertical: 10),
                child: pw.Row(
                    mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
                    children: [
                      pw.Text(
                        'Total Itbis:',
                      ),
                      pw.Text('RD\$ ${monto('TotalITBIS')}',
                          textAlign: pw.TextAlign.right),
                    ])),
            pw.Divider(height: 0.5, color: PdfColor.fromHex('#DFE1E5')),
            pw.Container(
                margin: pw.EdgeInsets.symmetric(vertical: 10),
                child: pw.Row(
                    mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
                    children: [
                      pw.Text(
                        'Imp. Adicional:',
                      ),
                      pw.Text('RD\$ ${monto('MontoImpuestoAdicional')}',
                          textAlign: pw.TextAlign.right),
                    ])),
            pw.Divider(height: 0.5, color: PdfColor.fromHex('#DFE1E5')),
            pw.Container(
                margin: pw.EdgeInsets.symmetric(vertical: 10),
                child: pw.Row(
                    mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
                    children: [
                      pw.Text(
                        'Total Itbis Retenido:',
                      ),
                      pw.Text('RD\$ ${monto('TotalITBISRetenido')}',
                          textAlign: pw.TextAlign.right),
                    ])),
            pw.Divider(height: 0.5, color: PdfColor.fromHex('#DFE1E5')),
            pw.Container(
                margin: pw.EdgeInsets.symmetric(vertical: 10),
                child: pw.Row(
                    mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
                    children: [
                      pw.Text(
                        'Total Isr Retenido:',
                      ),
                      pw.Text('RD\$ ${monto('TotalISRRetencion')}',
                          textAlign: pw.TextAlign.right),
                    ])),
            pw.Divider(height: 0.5, color: PdfColor.fromHex('#DFE1E5')),
            pw.Container(
                margin: pw.EdgeInsets.symmetric(vertical: 10),
                child: pw.Row(
                    mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
                    children: [
                      pw.Text(
                        'Total Facturado:',
                      ),
                      pw.Text('RD\$ ${monto('MontoTotal')}',
                          textAlign: pw.TextAlign.right),
                    ])),
          ]))
        ]),
      ],
    ),
  );

  return doc;
}

/// Creando [EcfPdfExtension] del objeto [EcfModel]

extension EcfPdfExtension on EcfModel {
  /// Generar factura del objeto [EcfModel] en formato pdf
  Future<pw.Document> generarPdfFactura() async {
    final doc = pw.Document();

    final qrData = uriEcf.toString();

    String labelNcf = labelEcfTipo(tipo);

    var itbisRetencion = totalItbisRetencion;
    var isrRetencion = totalIsrRetencion;
    var itbisMonto = totalItbis;
    var impuestoAdicional = montoImpuestoAdicional;
    var gravado = totalGravado;

    if (itbisRetencion == '') {
      itbisRetencion = '0.00';
    }

    if (isrRetencion == '') {
      isrRetencion = '0.00';
    }

    if (itbisMonto == '') {
      itbisMonto = '0.00';
    }

    if (impuestoAdicional == '') {
      impuestoAdicional = '0.00';
    }

    if (gravado == '') {
      gravado = '0.00';
    }
    int pagina = 0;

    doc.addPage(
      pw.MultiPage(
          pageTheme: pw.PageTheme(
              theme: pw.ThemeData(defaultTextStyle: pw.TextStyle(fontSize: 8))),
          header: (ctx) {
            return pw.Column(
                crossAxisAlignment: pw.CrossAxisAlignment.start,
                children: [
                  pw.Text(razonSocialEmisor,
                      style: pw.TextStyle(
                          fontSize: 16, fontWeight: pw.FontWeight.bold)),
                  pw.SizedBox(height: 10),
                  pw.Text(
                    'RNC: $rncEmisor',
                  ),
                  pw.Row(children: [
                    pw.Expanded(
                        child: pw.Column(
                            crossAxisAlignment: pw.CrossAxisAlignment.start,
                            children: [
                          pw.Text('Dirección: $direccionEmisor'),
                          pw.Text('Correo: $correoEmisor'),
                        ])),
                    pw.Expanded(
                        child: pw.Column(
                            crossAxisAlignment: pw.CrossAxisAlignment.end,
                            children: [
                          pw.Text(labelNcf,
                              style: pw.TextStyle(
                                  fontSize: 15, fontWeight: pw.FontWeight.bold),
                              textAlign: pw.TextAlign.right),
                          pw.Text('Comprobante: $numeroComprobante',
                              textAlign: pw.TextAlign.right),
                          numeroComprobanteModificado != ''
                              ? pw.Text(
                                  'Comprobante Afectado: $numeroComprobanteModificado',
                                  textAlign: pw.TextAlign.right)
                              : pw.SizedBox(),
                          pw.Text('Fecha de Emisión: $fechaEmision',
                              textAlign: pw.TextAlign.right),
                          pw.Text(
                              'Fecha de Vencimiento: ${fechaVencimiento != '' ? fechaVencimiento : fechaVencimiento}',
                              textAlign: pw.TextAlign.right),
                        ]))
                  ]),
                  pw.SizedBox(height: 20),
                  pw.Text(
                      'RNC Cliente: ${rncComprador != '' ? rncComprador : 'S/N'}'),
                  pw.Text(
                      'Razón Social Cliente: ${razonSocialComprador != '' ? razonSocialComprador : 'CLIENTE CONTADO'}'),
                  pw.Text(
                      'Contacto: ${contactoComprador != '' ? contactoComprador : 'S/N'}'),
                  pw.Text(
                      'Dirección: ${direccionComprador != '' ? direccionComprador : 'S/N'}'),
                  pw.SizedBox(height: 20)
                ]);
          },
          build: (context) => [
                pw.Column(
                  crossAxisAlignment: pw.CrossAxisAlignment.start,
                  children: [
                    pw.SizedBox(height: 10),
                    pw.TableHelper.fromTextArray(
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
                      headerAlignment: pw.Alignment.centerLeft,
                      cellAlignment: pw.Alignment.centerLeft,
                      cellStyle: pw.TextStyle(fontSize: 8),
                      headers: [
                        'Cant',
                        'U.M',
                        'Descripcion',
                        'Precio',
                        'Total'
                      ],
                      data: items
                          .map((item) => [
                                item.cantidad,
                                item.unidadMedida,
                                item.nombreItem,
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
                                pw.BarcodeWidget(
                                  data: qrData,
                                  barcode: pw.Barcode.qrCode(),
                                  width: 120,
                                  height: 120,
                                ),
                                pw.SizedBox(height: 15),
                                pw.Row(children: [
                                  pw.Text('Codigo de Seguridad:',
                                      style: pw.TextStyle(
                                          fontSize: 10,
                                          fontWeight: pw.FontWeight.bold)),
                                  pw.SizedBox(width: 5),
                                  pw.Text(codigoSeguridad,
                                      style: pw.TextStyle(fontSize: 8)),
                                ]),
                                pw.SizedBox(height: 10),
                                pw.Row(children: [
                                  pw.Text('Fecha de Firma:',
                                      style: pw.TextStyle(
                                          fontSize: 10,
                                          fontWeight: pw.FontWeight.bold)),
                                  pw.SizedBox(width: 5),
                                  pw.Text(fechaHoraFirma,
                                      style: pw.TextStyle(fontSize: 8)),
                                ])
                              ])),
                          pw.Expanded(
                              child: pw.Column(
                                  crossAxisAlignment:
                                      pw.CrossAxisAlignment.start,
                                  children: [
                                pw.Container(
                                  margin: pw.EdgeInsets.symmetric(vertical: 10),
                                  child: pw.Row(
                                      mainAxisAlignment:
                                          pw.MainAxisAlignment.spaceBetween,
                                      children: [
                                        pw.Text('Total Gravado:'),
                                        pw.Text('RD\$ $gravado',
                                            textAlign: pw.TextAlign.right),
                                      ]),
                                ),
                                pw.Divider(
                                    height: 0.5,
                                    color: PdfColor.fromHex('#DFE1E5')),
                                pw.Container(
                                  margin: pw.EdgeInsets.symmetric(vertical: 10),
                                  child: pw.Row(
                                      mainAxisAlignment:
                                          pw.MainAxisAlignment.spaceBetween,
                                      children: [
                                        pw.Text('Total ITBIS:'),
                                        pw.Text('RD\$ $itbisMonto',
                                            textAlign: pw.TextAlign.right),
                                      ]),
                                ),
                                pw.Divider(
                                    height: 0.5,
                                    color: PdfColor.fromHex('#DFE1E5')),
                                pw.Container(
                                  margin: pw.EdgeInsets.symmetric(vertical: 10),
                                  child: pw.Row(
                                      mainAxisAlignment:
                                          pw.MainAxisAlignment.spaceBetween,
                                      children: [
                                        pw.Text('Imp. Adicional:'),
                                        pw.Text('RD\$ $impuestoAdicional',
                                            textAlign: pw.TextAlign.right),
                                      ]),
                                ),
                                pw.Divider(
                                    height: 0.5,
                                    color: PdfColor.fromHex('#DFE1E5')),
                                pw.Container(
                                    margin:
                                        pw.EdgeInsets.symmetric(vertical: 10),
                                    child: pw.Row(
                                        mainAxisAlignment:
                                            pw.MainAxisAlignment.spaceBetween,
                                        children: [
                                          pw.Text(
                                            'Total Itbis Retenido:',
                                          ),
                                          pw.Text('RD\$ $itbisRetencion',
                                              textAlign: pw.TextAlign.right),
                                        ])),
                                pw.Divider(
                                    height: 0.5,
                                    color: PdfColor.fromHex('#DFE1E5')),
                                pw.Container(
                                    margin:
                                        pw.EdgeInsets.symmetric(vertical: 10),
                                    child: pw.Row(
                                        mainAxisAlignment:
                                            pw.MainAxisAlignment.spaceBetween,
                                        children: [
                                          pw.Text('Total Isr Retenido:'),
                                          pw.Text('RD\$ $isrRetencion',
                                              textAlign: pw.TextAlign.right),
                                        ])),
                                pw.Divider(
                                    height: 0.5,
                                    color: PdfColor.fromHex('#DFE1E5')),
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
