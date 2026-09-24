
import 'package:ecf_dgii/settings.dart';
import 'package:ecf_dgii/src/models/ecf.model.dart';
import 'package:ecf_dgii/src/types/ecf.dart';

    final fechaEmision = '01-04-2020';

    List<EcfDetailsModel> items = [
      EcfDetailsModel(
          cantidad: '15.00',
          unidadMedida: '23',
          indicadorFacturacion: '1',
          indicadorBienOServ: '2',
          nombreItem: 'Servicio Profesional Legislativo',
          descripcionItem: '',
          precioUnitario: '385.0000',
          descuentoMonto: '385.00',
          subDescuentos: [
            SubDescuento(
                tipoSubDescuento: '\$',
                subDescuentoPorcentaje: '',
                montoSubDescuento: '385.00')
          ],
          montoItem: '5390.00',
          retencion: Retencion(
              indicadorAgenteRetencionoPercepcion: '1',
              montoITBISRetenido: '961.20',
              montoISRRetenido: '539.00'),
          impuestosAdicionales: []),

     EcfDetailsModel(
          cantidad: '5.00',
          unidadMedida: '43',
          indicadorFacturacion: '1',
          indicadorBienOServ: '2',
          nombreItem: 'Asesoria Legal',
          descripcionItem: '',
          precioUnitario: '550.0000',
          descuentoMonto: '275.00',
          subDescuentos: [
            SubDescuento(
                tipoSubDescuento: '%',
                subDescuentoPorcentaje: '10.00',
                montoSubDescuento: '275.00')
          ],
          montoItem: '2475.00',
          retencion: Retencion(
              indicadorAgenteRetencionoPercepcion: '1',
              montoITBISRetenido: '436.50',
              montoISRRetenido: '247.50'),
          impuestosAdicionales: []),

     EcfDetailsModel(
          cantidad: '9.00',
          unidadMedida: '13',
          indicadorFacturacion: '1',
          indicadorBienOServ: '2',
          nombreItem: 'Gestiones Legales',
          descripcionItem: '',
          precioUnitario: '250.0000',
          descuentoMonto: '150.00',
          subDescuentos: [
            SubDescuento(
                tipoSubDescuento: '\$',
                subDescuentoPorcentaje: '',
                montoSubDescuento: '150.00')
          ],
          montoItem: '2100.00',
          retencion: Retencion(
              indicadorAgenteRetencionoPercepcion: '1',
              montoITBISRetenido: '369.00',
              montoISRRetenido: '210.00'),
          impuestosAdicionales: []),

         EcfDetailsModel(
          cantidad: '23.00',
          unidadMedida: '15',
          indicadorFacturacion: '1',
          indicadorBienOServ: '2',
          nombreItem: 'Legalizacion de documentos',
          descripcionItem: '',
          precioUnitario: '185.0000',
          descuentoMonto: '200.00',
          subDescuentos: [
            SubDescuento(
                tipoSubDescuento: '\$',
                subDescuentoPorcentaje: '',
                montoSubDescuento: '200.00')
          ],
          montoItem: '4055.00',
          retencion: Retencion(
              indicadorAgenteRetencionoPercepcion: '1',
              montoITBISRetenido: '720.90',
              montoISRRetenido: '405.50'),
          impuestosAdicionales: []),

             EcfDetailsModel(
          cantidad: '7.00',
          unidadMedida: '23',
          indicadorFacturacion: '1',
          indicadorBienOServ: '2',
          nombreItem: 'Servicios ambulatorio',
          descripcionItem: '',
          precioUnitario: '125.0000',
          descuentoMonto: '8.75',
          subDescuentos: [
            SubDescuento(
                tipoSubDescuento: '%',
                subDescuentoPorcentaje: '1.00',
                montoSubDescuento: '8.75')
          ],
          montoItem: '866.25',
          retencion: Retencion(
              indicadorAgenteRetencionoPercepcion: '1',
              montoITBISRetenido: '146.93',
              montoISRRetenido: '86.63'),
          impuestosAdicionales: []),
    ];



    EcfModel ecf = EcfModel(
      tipoEcf: EcfType.e41,
      tempDirName: kTempDirName,          // antes: 'arenal'
      numeroComprobante: 'E410000000008',
      codigoModificacion: '',
      fechaEmision: fechaEmision,
      fechaVencimiento: kfechaVencimiento, // antes: '31-12-2028'
      fechaEmisionNcfModificado: '',
      razonModificacion: 'ANULACION DEL ENCF31 CON SECUENCIA QUE FINALIZA EN 61',
      tipoIngreso: '',
      tipoPago: '1',
      formasDePagos: [FormaDePago('1', '17565.78')],
      sucursal: '',
      direccionEmisor: 'AVE. ISABEL AGUIAR NO. 269, ZONA INDUSTRIAL DE HERRERA',
      municipio: '010100',
      provincia: '010000',
      telefonoEmisor1: '809-472-7676',
      telefonoEmisor2: '809-491-1918',
      telefonoEmisor3: '',
      totalPaginas: '',
      rncEmisor: kRncEmisor,              // antes: '123006624'
      razonSocialEmisor: 'DOCUMENTOS ELECTRONICOS DE 02',
      nombreComercial: 'DOCUMENTOS ELECTRONICOS DE 02',
      correoEmisor: 'DOCUMENTOSELECTRONICOSDE0612345678969789+9000000000000000000000000000001@123.COM',
      website: '',
      actividadEconomica: '',
      codigoVendedor: '',
      informacionAdicionalEmisor: '',
      rncComprador: '533445861',
      razonSocialComprador: 'DOCUMENTOS ELECTRONICOS DE 11',
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
      indicadorMontoGravado: '0',
      totalGravado: '14886.25',
      totalGravado18: '14886.25',
      totalGravado16: '',
      totalGravadoTasa0: '',
      montoExento: '',
      totalItbis: '2679.53',
      totalItbis18: '2679.53',
      totalItbis16: '',
      totalItbisTasa0: '',
      itbis1: '18',
      itbis2: '',
      itbis3: '',
      montoTotal: '17565.78',
      montoPeriodo: '',
      montoAvancePago: '',
      valorPagar: '',
      totalItbisRetencion: '2634.53',
      totalIsrRetencion: '1488.63',
      montoImpuestoAdicional: '',
      impuestosAdicionales: [],
      terminoPago: '',
      bancoPago: '',
      paginas: [],
      items: items,
      privateKey: '',
      certBase64: '',
    );
    EcfModel kE410000000008 = ecf;

    