
import 'package:ecf_dgii/settings.dart';
import 'package:ecf_dgii/src/models/ecf.model.dart';
import 'package:ecf_dgii/src/types/ecf.dart';

    final fechaEmision = '01-04-2020';

    List<EcfDetailsModel> items = [
      EcfDetailsModel(
          cantidad: '150.00',
          unidadMedida: '6',
          indicadorFacturacion: '3',
          indicadorBienOServ: '1',
          nombreItem: 'Silla',
          descripcionItem: '',
          precioUnitario: '450.0000',
          descuentoMonto: '',
          subDescuentos: [],
          impuestosAdicionales: [],
          otraMonedaDetalles: [
            OtraMonedaDetalle(
                precioOtraMoneda: '7.89',
                descuentoOtraMoneda: '',
                recargoOtraMoneda: '',
                montoItemOtraMoneda: '1184.21')
          ],
          montoItem: '67500.00'),
      EcfDetailsModel(
          cantidad: '100.00',
          unidadMedida: '43',
          indicadorFacturacion: '3',
          indicadorBienOServ: '1',
          nombreItem: 'Mesa',
          descripcionItem: '',
          precioUnitario: '200.0000',
          descuentoMonto: '',
          subDescuentos: [],
          impuestosAdicionales: [],
          otraMonedaDetalles: [
            OtraMonedaDetalle(
                precioOtraMoneda: '3.51',
                descuentoOtraMoneda: '',
                recargoOtraMoneda: '',
                montoItemOtraMoneda: '350.88')
          ],
          montoItem: '20000.00'),
      EcfDetailsModel(
          cantidad: '120.00',
          unidadMedida: '43',
          indicadorFacturacion: '3',
          indicadorBienOServ: '1',
          nombreItem: 'Manteles',
          descripcionItem: '',
          precioUnitario: '250.0000',
          descuentoMonto: '',
          subDescuentos: [],
          impuestosAdicionales: [],
          otraMonedaDetalles: [
            OtraMonedaDetalle(
                precioOtraMoneda: '4.39',
                descuentoOtraMoneda: '',
                recargoOtraMoneda: '',
                montoItemOtraMoneda: '526.32')
          ],
          montoItem: '30000.00'),
    ];

    EcfModel ecf = EcfModel(
      tipoEcf: EcfType.e46,
      tempDirName: kTempDirName, // antes: 'climatic'
      indicadorMontoGravado: '',
      numeroComprobante: 'E460000000007',
      codigoModificacion: '',
      fechaEmision: fechaEmision,
      fechaVencimiento: kfechaVencimiento, // antes: '31-12-2028'
      fechaEmisionNcfModificado: '',
      razonModificacion:
          'ANULACION DEL ENCF31 CON SECUENCIA QUE FINALIZA EN 61',
      tipoIngreso: '01',
      tipoPago: '1',
      formasDePagos: [FormaDePago('1', '117500.00')],
      sucursal: '',
      direccionEmisor: 'AVE. ISABEL AGUIAR NO. 269, ZONA INDUSTRIAL DE HERRERA',
      municipio: '010100',
      provincia: '010000',
      telefonoEmisor1: '809-472-7676',
      telefonoEmisor2: '809-491-1918',
      telefonoEmisor3: '',
      totalPaginas: '',
      rncEmisor: kRncEmisor, // antes: '130897271'
      razonSocialEmisor: 'DOCUMENTOS ELECTRONICOS DE 02',
      nombreComercial: 'DOCUMENTOS ELECTRONICOS DE 02',
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
      numeroOrdenCompra: '4500352238',
      numeroFacturaInterna: '123456789016',
      numeroPedidoInterno: '123456789016',
      zonaVenta: 'NORTE',
      rutaVenta: '',
      conductor: 'Rafael Perez',
      documentoTransporte: '363636',
      ficha: 'J-1234',
      placa: 'A639689',
      rutaTransporte: 'B-Sur',
      zonaTransporte: 'Interior-1',
      numeroAlbaran: '3634258',
      totalGravado: '117500.00',
      totalGravado18: '',
      totalGravado16: '',
      totalGravadoTasa0: '117500.00',
      montoExento: '',
      totalItbis: '0.00',
      totalItbis18: '',
      totalItbis16: '',
      totalItbisTasa0: '0.00',
      itbis1: '',
      itbis2: '',
      itbis3: '0',
      montoTotal: '117500.00',
      montoPeriodo: '117500.00',
      montoAvancePago: '',
      valorPagar: '117500.00',
      tipoMoneda: 'USD',
      tipoCambio: '57.0000',
      montoGravadoTotalOtraMoneda: '2061.40',
      montoGravadoTotalOtraMoneda1: '',
      montoGravadoTotalOtraMoneda2: '',
      montoGravadoTotalOtraMoneda3: '2061.40',
      totalItbisOtraMoneda: '0.00',
      totalItbis1OtraMoneda: '',
      totalItbis2OtraMoneda: '',
      totalItbis3OtraMoneda: '0.00',
      montoExentoOtraMoneda: '',
      montoTotalOtraMoneda: '2061.40',
      totalItbisRetencion: '',
      totalIsrRetencion: '',
      montoImpuestoAdicional: '',
      impuestosAdicionales: [],
      terminoPago: '',
      bancoPago: '',
      paginas: [],
      items: items,
      privateKey: '',
      certBase64: '',
    );

    EcfModel kE460000000007 = ecf;

    