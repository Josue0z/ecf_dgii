import 'package:ecf_dgii/settings.dart';
import 'package:ecf_dgii/src/models/ecf.model.dart';
import 'package:ecf_dgii/src/types/ecf.dart';

    final fechaEmision = '01-04-2020';

    List<EcfDetailsModel> items = [
      EcfDetailsModel(
          cantidad: '100.00',
          unidadMedida: '23',
          indicadorFacturacion: '1',
          indicadorBienOServ: '1',
          nombreItem: 'BLOCK',
          descripcionItem: '',
          precioUnitario: '450.0000',
          descuentoMonto: '100.00',
          subDescuentos: [
            SubDescuento(
                tipoSubDescuento: '\$',
                subDescuentoPorcentaje: '',
                montoSubDescuento: '100.00')
          ],
          impuestosAdicionales: [],
          otraMonedaDetalles: [],
          montoItem: '44900.00'),
      EcfDetailsModel(
          cantidad: '300.00',
          unidadMedida: '23',
          indicadorFacturacion: '1',
          indicadorBienOServ: '1',
          nombreItem: 'VARILLAS',
          descripcionItem: '',
          precioUnitario: '350.0000',
          descuentoMonto: '100.00',
          subDescuentos: [
            SubDescuento(
                tipoSubDescuento: '\$',
                subDescuentoPorcentaje: '',
                montoSubDescuento: '100.00')
          ],
          impuestosAdicionales: [],
          otraMonedaDetalles: [],
          montoItem: '104900.00'),
      EcfDetailsModel(
          cantidad: '200.00',
          unidadMedida: '23',
          indicadorFacturacion: '1',
          indicadorBienOServ: '1',
          nombreItem: 'CINZ',
          descripcionItem: '',
          precioUnitario: '425.0000',
          descuentoMonto: '100.00',
          subDescuentos: [
            SubDescuento(
                tipoSubDescuento: '\$',
                subDescuentoPorcentaje: '',
                montoSubDescuento: '100.00')
          ],
          impuestosAdicionales: [],
          otraMonedaDetalles: [],
          montoItem: '84900.00'),
      EcfDetailsModel(
          cantidad: '50.00',
          unidadMedida: '23',
          indicadorFacturacion: '1',
          indicadorBienOServ: '1',
          nombreItem: 'CLAVOS DE MEDIA',
          descripcionItem: '',
          precioUnitario: '550.0000',
          descuentoMonto: '100.00',
          subDescuentos: [
            SubDescuento(
                tipoSubDescuento: '\$',
                subDescuentoPorcentaje: '',
                montoSubDescuento: '100.00')
          ],
          impuestosAdicionales: [],
          otraMonedaDetalles: [],
          montoItem: '27400.00'),
      EcfDetailsModel(
          cantidad: '50.00',
          unidadMedida: '23',
          indicadorFacturacion: '1',
          indicadorBienOServ: '1',
          nombreItem: 'CLAVOS DE CUARTA',
          descripcionItem: '',
          precioUnitario: '325.0000',
          descuentoMonto: '100.00',
          subDescuentos: [
            SubDescuento(
                tipoSubDescuento: '\$',
                subDescuentoPorcentaje: '',
                montoSubDescuento: '100.00')
          ],
          impuestosAdicionales: [],
          otraMonedaDetalles: [],
          montoItem: '16150.00'),
      EcfDetailsModel(
          cantidad: '60.00',
          unidadMedida: '23',
          indicadorFacturacion: '1',
          indicadorBienOServ: '1',
          nombreItem: 'ALAMBRE DULCE',
          descripcionItem: '',
          precioUnitario: '250.0000',
          descuentoMonto: '100.00',
          subDescuentos: [
            SubDescuento(
                tipoSubDescuento: '\$',
                subDescuentoPorcentaje: '',
                montoSubDescuento: '100.00')
          ],
          impuestosAdicionales: [],
          otraMonedaDetalles: [],
          montoItem: '14900.00'),
      EcfDetailsModel(
          cantidad: '250.00',
          unidadMedida: '23',
          indicadorFacturacion: '1',
          indicadorBienOServ: '1',
          nombreItem: 'CEMENTO BLANCO',
          descripcionItem: '',
          precioUnitario: '250.0000',
          descuentoMonto: '100.00',
          subDescuentos: [
            SubDescuento(
                tipoSubDescuento: '\$',
                subDescuentoPorcentaje: '',
                montoSubDescuento: '100.00')
          ],
          impuestosAdicionales: [],
          otraMonedaDetalles: [],
          montoItem: '62400.00'),
      EcfDetailsModel(
          cantidad: '400.00',
          unidadMedida: '23',
          indicadorFacturacion: '1',
          indicadorBienOServ: '1',
          nombreItem: 'CEMENTO GRIS',
          descripcionItem: '',
          precioUnitario: '250.0000',
          descuentoMonto: '100.00',
          subDescuentos: [
            SubDescuento(
                tipoSubDescuento: '\$',
                subDescuentoPorcentaje: '',
                montoSubDescuento: '100.00')
          ],
          impuestosAdicionales: [],
          otraMonedaDetalles: [],
          montoItem: '99900.00'),
      EcfDetailsModel(
          cantidad: '30.00',
          unidadMedida: '23',
          indicadorFacturacion: '1',
          indicadorBienOServ: '1',
          nombreItem: 'COLORANTE',
          descripcionItem: '',
          precioUnitario: '250.0000',
          descuentoMonto: '100.00',
          subDescuentos: [
            SubDescuento(
                tipoSubDescuento: '\$',
                subDescuentoPorcentaje: '',
                montoSubDescuento: '100.00')
          ],
          impuestosAdicionales: [],
          otraMonedaDetalles: [],
          montoItem: '7400.00'),
      EcfDetailsModel(
          cantidad: '60.00',
          unidadMedida: '23',
          indicadorFacturacion: '1',
          indicadorBienOServ: '1',
          nombreItem: 'TINER',
          descripcionItem: '',
          precioUnitario: '250.0000',
          descuentoMonto: '100.00',
          subDescuentos: [
            SubDescuento(
                tipoSubDescuento: '\$',
                subDescuentoPorcentaje: '',
                montoSubDescuento: '100.00')
          ],
          impuestosAdicionales: [],
          otraMonedaDetalles: [],
          montoItem: '14900.00'),
    ];

    EcfModel ecf = EcfModel(
        tipoEcf: EcfType.e45,
        tempDirName: kTempDirName,
        indicadorMontoGravado: '1',
        numeroComprobante: 'E450000000003',
        codigoModificacion: '',
        fechaEmision: fechaEmision,
        fechaVencimiento: kfechaVencimiento,
        fechaEmisionNcfModificado: '',
        razonModificacion:
            'ANULACION DEL ENCF31 CON SECUENCIA QUE FINALIZA EN 61',
        tipoIngreso: '01',
        tipoPago: '1',
        formasDePagos: [FormaDePago('1', '477750.00')],
        sucursal: '',
        direccionEmisor:
            'AVE. ISABEL AGUIAR NO. 269, ZONA INDUSTRIAL DE HERRERA',
        municipio: '010100',
        provincia: '010000',
        telefonoEmisor1: '809-472-7676',
        telefonoEmisor2: '809-491-1918',
        telefonoEmisor3: '',
        totalPaginas: '',
        rncEmisor: kRncEmisor,
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
        numeroContenedor: '',
        numeroReferencia: '',
        zonaVenta: 'NORTE',
        rutaVenta: '',
        conductor: 'Rafael P¿rez',
        documentoTransporte: '363636',
        ficha: 'J-1234',
        placa: 'A639689',
        rutaTransporte: 'B-Sur',
        zonaTransporte: 'Interior-1',
        numeroAlbaran: '3634258',
        totalGravado: '404872.88',
        totalGravado18: '404872.88',
        totalGravado16: '',
        totalGravadoTasa0: '',
        montoExento: '',
        totalItbis: '72877.12',
        totalItbis18: '72877.12',
        totalItbis16: '',
        totalItbisTasa0: '',
        itbis1: '18',
        itbis2: '',
        itbis3: '',
        montoTotal: '477750.00',
        montoPeriodo: '',
        montoAvancePago: '',
        valorPagar: '',
        totalItbisRetencion: '',
        totalIsrRetencion: '',
        montoImpuestoAdicional: '',
        impuestosAdicionales: [],
        terminoPago: '',
        bancoPago: '',
        paginas: [],
        items: items,
        privateKey: '',
        certBase64: '');

    EcfModel kE450000000003 = ecf;

    