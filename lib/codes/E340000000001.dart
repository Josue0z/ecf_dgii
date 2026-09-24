
import 'package:ecf_dgii/settings.dart';
import 'package:ecf_dgii/src/models/ecf.model.dart';
import 'package:ecf_dgii/src/types/ecf.dart';

  final fechaEmision = '02-04-2020';

    List<EcfDetailsModel> items = [
      EcfDetailsModel(
          cantidad: '15',
          unidadMedida: '31',
          indicadorFacturacion: '1',
          indicadorBienOServ: '1',
          nombreItem: 'TOP BOWL 1',
          descripcionItem: '',
          precioUnitario: '0.00',
          descuentoMonto: '',
          subDescuentos: [],
          impuestosAdicionales: [],
          otraMonedaDetalles: [],
          montoItem: '0.00'),
    ];


    EcfModel ecf = EcfModel(
      tipoEcf: EcfType.e34,
      tempDirName: kTempDirName,          // antes: 'arenal'
      indicadorMontoGravado: '0',
      indicadorNotaCredito: '0',
      rncOtroContribuyente: '',
      numeroComprobante: 'E340000000001',
      numeroComprobanteModificado: 'E310000000001',
      codigoModificacion: '2',
      fechaEmision: fechaEmision,
      fechaVencimiento: '',               // string vacío en notas de crédito
      fechaEmisionNcfModificado: '01-04-2020',
      razonModificacion: 'Error en datos',
      tipoIngreso: '01',
      tipoPago: '1',
      formasDePagos: [],
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
      website: 'www.facturaelectronica.com',
      actividadEconomica: '',
      codigoVendedor: 'AA0000000100000000010000000002000000000300000000050000000006',
      informacionAdicionalEmisor: '',
      rncComprador: '131880681',
      identificadorExtranjero: '',
      razonSocialComprador: 'DOCUMENTOS ELECTRONICOS DE 03',
      nombreComprador: '',
      contactoComprador: 'MARCOS LATIPLOL',
      correoComprador: 'MARCOSLATIPLOL@KKKK.COM',
      telefonoAdicional: '',
      direccionComprador: 'CALLE JACINTO DE LA CONCHA FELIZ ESQUINA 27 DE FEBRERO,FRENTE A DOMINO',
      municipioComprador: '010100',
      provinciaComprador: '010000',
      codigoInternoComprador: '10633440',
      numeroContenedor: '8019289',
      numeroReferencia: '1447',
      fechaEntrega: '10-10-2020',
      fechaOrdenCompra: '10-11-2018',
      numeroOrdenCompra: '4500352238',
      numeroFacturaInterna: '123456789016',
      numeroPedidoInterno: '123456789016',
      zonaVenta: 'NORTE',
      rutaVenta: '',
      totalGravado: '0.00',
      totalGravado18: '0.00',
      totalItbis: '0.00',
      totalItbis18: '0.00',
      itbis1: '18',
      montoTotal: '0.00',
      paginas: [],
      items: items,
      privateKey: '',
      certBase64: '',
    );

  EcfModel kE340000000001 = ecf;

    