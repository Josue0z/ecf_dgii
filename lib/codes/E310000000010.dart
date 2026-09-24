
import 'package:ecf_dgii/settings.dart';
import 'package:ecf_dgii/src/models/ecf.model.dart';
import 'package:ecf_dgii/src/types/ecf.dart';

 List<EcfDetailsModel> items = [
      EcfDetailsModel(
          cantidad: '23.00',
          unidadMedida: '43',
          indicadorFacturacion: '1',
          indicadorBienOServ: '1',
          nombreItem: 'LAPICES',
          descripcionItem: '',
          precioUnitario: '35.0000',
          descuentoMonto: '',
          subDescuentos: [],
          recargoMonto: '',
          subRecargos: [],
          otraMonedaDetalles: [
            OtraMonedaDetalle(
                precioOtraMoneda: '3.55',
                descuentoOtraMoneda: '',
                recargoOtraMoneda: '',
                montoItemOtraMoneda: '81.65')
          ],
          impuestosAdicionales: [],
          montoItem: '805.00'),
      EcfDetailsModel(
          cantidad: '547.00',
          unidadMedida: '6',
          indicadorFacturacion: '2',
          indicadorBienOServ: '1',
          nombreItem: 'GALLETAS',
          descripcionItem: '',
          precioUnitario: '145.0000',
          descuentoMonto: '',
          subDescuentos: [],
          recargoMonto: '',
          subRecargos: [],
          otraMonedaDetalles: [
            OtraMonedaDetalle(
                precioOtraMoneda: '4.55',
                descuentoOtraMoneda: '',
                recargoOtraMoneda: '',
                montoItemOtraMoneda: '2488.85')
          ],
          impuestosAdicionales: [],
          montoItem: '79315.00'),
      EcfDetailsModel(
          cantidad: '14.00',
          unidadMedida: '31',
          indicadorFacturacion: '3',
          indicadorBienOServ: '1',
          nombreItem: 'PAN',
          descripcionItem: '',
          precioUnitario: '55.0000',
          descuentoMonto: '',
          subDescuentos: [],
          recargoMonto: '',
          subRecargos: [],
          otraMonedaDetalles: [
            OtraMonedaDetalle(
                precioOtraMoneda: '2.55',
                descuentoOtraMoneda: '',
                recargoOtraMoneda: '',
                montoItemOtraMoneda: '35.70')
          ],
          impuestosAdicionales: [],
          montoItem: '770.00'),
      EcfDetailsModel(
          cantidad: '25.00',
          unidadMedida: '24',
          indicadorFacturacion: '4',
          indicadorBienOServ: '1',
          nombreItem: 'SANDWICH',
          descripcionItem: '',
          precioUnitario: '65.0000',
          descuentoMonto: '',
          subDescuentos: [],
          recargoMonto: '',
          subRecargos: [],
          otraMonedaDetalles: [
            OtraMonedaDetalle(
                precioOtraMoneda: '1.75',
                descuentoOtraMoneda: '',
                recargoOtraMoneda: '',
                montoItemOtraMoneda: '43.75')
          ],
          impuestosAdicionales: [],
          montoItem: '1625.00'),
      EcfDetailsModel(
          cantidad: '35.00',
          unidadMedida: '47',
          indicadorFacturacion: '2',
          indicadorBienOServ: '1',
          nombreItem: 'SALSA',
          descripcionItem: '',
          precioUnitario: '25.0000',
          descuentoMonto: '',
          subDescuentos: [],
          recargoMonto: '',
          subRecargos: [],
          otraMonedaDetalles: [],
          impuestosAdicionales: [],
          montoItem: '875.00'),
    ];

    EcfModel ecf = EcfModel(
      tipoEcf: EcfType.e31,
      tempDirName: kTempDirName, // antes: 'arenal'
      numeroComprobante: 'E310000000010', // comprobante actual
      codigoModificacion: '',
      fechaEmision: '01-04-2020',
      fechaVencimiento: kfechaVencimiento, // antes: '31-12-2028'
      fechaEmisionNcfModificado: '',
      razonModificacion: '',
      tipoIngreso: '01',
      tipoPago: '1',
      formasDePagos: [FormaDePago('1', '96365.30')],
      sucursal: '',
      municipio: '010100',
      provincia: '010000',
      telefonoEmisor1: '809-472-7676',
      telefonoEmisor2: '809-491-1918',
      telefonoEmisor3: '',
      totalPaginas: '',
      rncEmisor: kRncEmisor, // antes: '123006624'
      razonSocialEmisor: 'DOCUMENTOS ELECTRONICOS DE 02',
      nombreComercial: 'DOCUMENTOS ELECTRONICOS DE 02',
      direccionEmisor: 'AVE. ISABEL AGUIAR NO. 269, ZONA INDUSTRIAL DE HERRERA',
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
      numeroContenedor: '',
      numeroReferencia: '',
      zonaVenta: 'NORTE',
      rutaVenta: '',
      indicadorMontoGravado: '0',
      totalGravado: '81765.00',
      totalGravado18: '805.00',
      totalGravado16: '80190.00',
      totalGravadoTasa0: '770.00',
      montoExento: '1625.00',
      totalItbis: '12975.30',
      totalItbis18: '144.90',
      totalItbis16: '12830.40',
      totalItbisTasa0: '0.00',
      itbis1: '18',
      itbis2: '16',
      itbis3: '0',
      montoPeriodo: '96365.30',
      montoAvancePago: '',
      valorPagar: '96365.30',
      totalItbisRetencion: '',
      totalIsrRetencion: '',
      montoImpuestoAdicional: '',
      impuestosAdicionales: [],
      montoTotal: '96365.30',
      terminoPago: '',
      bancoPago: '',
      paginas: [],
      items: items,
      privateKey: '',
      certBase64: ''
    );

  
EcfModel kE310000000010 = ecf;

