
import 'package:ecf_dgii/settings.dart';
import 'package:ecf_dgii/src/models/ecf.model.dart';
import 'package:ecf_dgii/src/types/ecf.dart';



List<EcfDetailsModel> items = [
      EcfDetailsModel(
          cantidad: '2.00',
          unidadMedida: '6',
          cantidadReferencia: '24',
          unidadReferencia: '5',
          indicadorFacturacion: '1',
          indicadorBienOServ: '1',
          nombreItem: 'PTE. CJ 24/12OZ',
          descripcionItem: '',
          precioUnitarioReferencia: '65.00',
          precioUnitario: '1615.00',
          descuentoMonto: '',
          subCantidades: [
            SubCantidad(
                subCantidad: '0.355',
                codigoSubCantidad: '24'
            )
          ],
          gradosAlcohol: '5.00',
          subDescuentos: [],
          recargoMonto: '',
          subRecargos: [],
          impuestosAdicionales: [
            ImpuestoAdicional( 
                tipoImpuesto: '006'
            ),
            ImpuestoAdicional(
                tipoImpuesto: '023'
            )
          ],
          montoItem: '3230.00'),
    ];

    EcfModel ecf = EcfModel(
        tipoEcf: EcfType.e31,
        tempDirName: kTempDirName,
        numeroComprobante: 'E310000000002',
        codigoModificacion: '',
        fechaEmision: '01-04-2020',
        fechaVencimiento: kfechaVencimiento,
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
        rncEmisor: kRncEmisor,
        razonSocialEmisor: 'DOCUMENTOS ELECTRONICOS DE 02',
        nombreComercial: 'DOCUMENTOS ELECTRONICOS DE 02',
        direccionEmisor:
            'AVE. ISABEL AGUIAR NO. 269, ZONA INDUSTRIAL DE HERRERA',
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
        fechaEmbarque: '',
        fechaOrdenCompra: '10-11-2018',
        numeroOrdenCompra: '4500352238',
        numeroFacturaInterna: '123456789016',
        numeroPedidoInterno: '123456789016',
        numeroContenedor: '',
        numeroReferencia: '',
        numeroEmbarque: '',
        pesoBruto: '',
        pesoNeto: '',
        unidadPesoBruto: '',
        unidadPesoNeto: '',
        cantidadBulto: '',
        unidadBulto: '',
        volumenBulto: '',
        unidadVolumen: '',
        zonaVenta: 'NORTE',
        rutaVenta: '',
        indicadorMontoGravado: '0',
        totalGravado: '3230.00',
        totalGravado18: '3230.00',
        totalGravado16: '',
        totalGravadoTasa0: '',
        montoExento: '',
        totalItbis: '713.04',
        totalItbis18: '713.04',
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
        montoImpuestoAdicional: '731.32',
        impuestosAdicionales: [
            ImpuestoAdicional(
                tipoImpuesto: '006',
                tasaImpuestoAdicional: '633.85',
                montoImpuestoSelectivoConsumoEspecifico: '540.04'
            ),
            ImpuestoAdicional(
                tipoImpuesto: '023',
                tasaImpuestoAdicional: '10',
                montoImpuestoSelectivoConsumoAdvalorem: '191.28'

            )
        ],
        montoTotal: '4674.35',
        terminoPago: '',
        bancoPago: '',
        paginas: [],
        items: items,
        privateKey: '',
        certBase64: '');
    
EcfModel kE310000000002 = ecf;
