
import 'package:ecf_dgii/settings.dart';
import 'package:ecf_dgii/src/models/ecf.model.dart';
import 'package:ecf_dgii/src/types/ecf.dart';

    final fechaEmision = '01-04-2020';

    List<EcfDetailsModel> items = [
      EcfDetailsModel(
          cantidad: '7.00',
          unidadMedida: '43',
          indicadorFacturacion: '4',
          indicadorBienOServ: '2',
          nombreItem: 'Peajes viaje semana I',
          descripcionItem: '',
          precioUnitario: '100.00',
          descuentoMonto: '',
          subDescuentos: [],
          montoItem: '700.00',
          impuestosAdicionales: []),
    ];

    EcfModel ecf = EcfModel(
      tipoEcf: EcfType.e43,
      tempDirName: kTempDirName, // antes: 'climatic'
      indicadorMontoGravado: '',
      numeroComprobante: 'E430000000001',
      codigoModificacion: '',
      fechaEmision: fechaEmision,
      fechaVencimiento: kfechaVencimiento, // antes: '31-12-2028'
      fechaEmisionNcfModificado: '',
      razonModificacion: '',
      tipoIngreso: '',
      tipoPago: '',
      formasDePagos: [],
      sucursal: '',
      direccionEmisor: 'AVE. ISABEL AGUIAR NO. 269, ZONA INDUSTRIAL DE HERRERA',
      municipio: '010101',
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
      codigoVendedor: '',
      informacionAdicionalEmisor: '',
      rncComprador: '',
      razonSocialComprador: '',
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
      numeroFacturaInterna: '123456789016',
      numeroPedidoInterno: '123456789016',
      zonaVenta: '',
      rutaVenta: '',
      totalGravado: '',
      totalGravado18: '',
      totalGravado16: '',
      totalGravadoTasa0: '',
      montoExento: '700.00',
      totalItbis: '',
      totalItbis18: '',
      totalItbis16: '',
      totalItbisTasa0: '',
      itbis1: '',
      itbis2: '',
      itbis3: '',
      montoTotal: '700.00',
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
      certBase64:'',
    );

    EcfModel kE430000000001 = ecf;

    