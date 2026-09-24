
import 'package:ecf_dgii/settings.dart';
import 'package:ecf_dgii/src/models/ecf.model.dart';
import 'package:ecf_dgii/src/types/ecf.dart';

  List<EcfDetailsModel> items = [
      EcfDetailsModel(
          cantidad: '1.00',
          unidadMedida: '43',
          indicadorFacturacion: '1',
          indicadorBienOServ: '2',
          nombreItem: 'Renta Total',
          descripcionItem: '',
          precioUnitario: '107766.57',
          descuentoMonto: '',
          subDescuentos: [],
          recargoMonto: '',
          subRecargos: [],
          impuestosAdicionales: [
            ImpuestoAdicional(tipoImpuesto: '002'),
            ImpuestoAdicional(tipoImpuesto: '004')
          ],
          montoItem: '107766.57'),
      EcfDetailsModel(
          cantidad: '1.0',
          unidadMedida: '43',
          indicadorFacturacion: '1',
          indicadorBienOServ: '2',
          nombreItem: 'Uso total',
          descripcionItem: '',
          precioUnitario: '10697.64',
          descuentoMonto: '',
          subDescuentos: [],
          recargoMonto: '',
          subRecargos: [],
          impuestosAdicionales: [
            ImpuestoAdicional(tipoImpuesto: '002'),
            ImpuestoAdicional(tipoImpuesto: '004')
          ],
          montoItem: '10697.64'),
    ];

    EcfModel ecf = EcfModel(
      tipoEcf: EcfType.e31,
      tempDirName: kTempDirName, // antes: 'fylauto'
      numeroComprobante: 'E310000000003',
      codigoModificacion: '',
      fechaEmision: '01-04-2020',
      fechaVencimiento: kfechaVencimiento, // antes: '31-12-2025'
      fechaEmisionNcfModificado: '',
      razonModificacion: '',
      tipoIngreso: '01',
      tipoPago: '1',
      formasDePagos: [],
      sucursal: '',
      municipio: '010100',
      provincia: '010000',
      telefonoEmisor1: '809-472-7676',
      telefonoEmisor2: '809-491-1918',
      telefonoEmisor3: '',
      totalPaginas: '',
      rncEmisor: kRncEmisor, // antes: '130718563'
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
      totalGravado: '118464.21',
      totalGravado18: '118464.21',
      totalGravado16: '',
      totalGravadoTasa0: '',
      montoExento: '',
      totalItbis: '21323.56',
      totalItbis18: '21323.56',
      totalItbis16: '',
      totalItbisTasa0: '',
      itbis1: '18',
      itbis2: '',
      itbis3: '',
      montoPeriodo: '',
      montoAvancePago: '',
      valorPagar: '',
      totalItbisRetencion: '',
      totalIsrRetencion: '',
      montoImpuestoAdicional: '14215.71',
      impuestosAdicionales: [
        ImpuestoAdicional(
          tipoImpuesto: '002',
          tasaImpuestoAdicional: '2',
          otrosImpuestosAdicionales: '2369.28',
        ),
        ImpuestoAdicional(
          tipoImpuesto: '004',
          tasaImpuestoAdicional: '10',
          otrosImpuestosAdicionales: '11846.42',
        ),
      ],
      montoTotal: '154003.47',
      terminoPago: '',
      bancoPago: '',
      paginas: [],
      items: items,
      privateKey: '',
      certBase64: ''
    );

EcfModel kE310000000003 = ecf;
