# ecf_dgii 🧾🇩🇴

Librería Dart para generar, firmar y enviar Comprobantes Fiscales Electrónicos (e-CF) conforme al esquema establecido por la DGII (República Dominicana).

Incluye validación de estructura XML, firma digital RSA-SHA256, canonicalización XML usando `xmllint`, y comunicación con el servicio de timbrado oficial.

---

## ⚙️ Requisitos

🔐 **OpenSSL**  
Usado para extraer claves privadas desde certificados `.p12` y generar la firma digital.

- **Windows**: instalar desde [Win32 OpenSSL](https://slproweb.com/products/Win32OpenSSL.html) y agregar la carpeta `bin` al `PATH`.
- **macOS/Linux**: viene preinstalado en la mayoría de distribuciones.

🧰 **xmllint (libxml2-utils)**  
Utilizado para canonicalizar el XML con el algoritmo `c14n`, requerido por XMLDSig antes de calcular el `digestValue`.

### 💡 Instalación en Windows

1. Instala [MSYS2](https://www.msys2.org/)
2. Abre la terminal MSYS2 y ejecuta:

   ```bash
   pacman -S libxml2


## 🚀 Ejemplo de uso completo

```dart
import 'dart:io';
import 'package:ecf_dgii/src/models/ecf.model.dart';
import 'package:ecf_dgii/src/types/ecf.dart';
import 'package:ecf_dgii/src/utils/directories.dart';
import 'package:ecf_dgii/src/utils/generate.endpoint.dart';
import 'package:ecf_dgii/src/utils/p12.parser.dart';
import 'package:intl/intl.dart';
import 'package:path/path.dart' as path;

void main() async {
  try {
    GeneratorEndPoint.envEcfType = EnvEcfType.cert;
    final cert = File(path.join(dirProject.path, 'cert.p12'));

    String password = '*****';

    AuthCertModel authModel = await getAuthP12(cert: cert, password: password);

    final now = DateTime.now();
    final dateFormat = DateFormat('dd-MM-yyyy');

    final fechaEmision = '';

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
        tempDirName: 'july',
        numeroComprobante: 'E310000000002',
        codigoModificacion: '',
        fechaEmision: '01-04-2020',
        fechaVencimiento: '31-12-2028',
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
        rncEmisor: '122017781',
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
        privateKey: authModel.privateKey,
        certBase64: authModel.certBase64);

    await ecf.descargarSemilla();
    await ecf.validarSemilla();
    await ecf.firmar();
    await ecf.enviarEcf();

    var doc = await ecf.generarPdfFactura();
    var filePdf = File(path.join(tempDirPath, 'july', 'pdfs',
        '${ecf.rncEmisor}${ecf.numeroComprobante}.PDF'));

    await filePdf.create(recursive: true);
    await filePdf.writeAsBytes(await doc.save());
    print(ecf.uriEcf);
    print(ecf.trackId);
    print(ecf.token);
    print(filePdf.path);
    print(ecf.ecfFile?.path);

  } catch (e) {
    print('⚠️ Error: $e');
  }
}


// Generar aprobacion comercial

final List<List<String>> datos = [
      [
        '131880681',
        'E310000000003',
        '01-04-2020',
        '154003.47',
        '101675489',
        '20-07-2025 09:17:42'
      ],
      [
        '131880681',
        'E310000000007',
        '01-04-2020',
        '228460.5',
        '101675489',
        '20-07-2025 09:17:42'
      ],
      [
        '131880681',
        'E310000000009',
        '01-04-2020',
        '41450',
        '101675489',
        '20-07-2025 09:17:42'
      ],
      [
        '131880681',
        'E310000000012',
        '01-04-2020',
        '45253',
        '101675489',
        '20-07-2025 09:17:42'
      ],
      [
        '131880681',
        'E330000000001',
        '02-04-2020',
        '400000',
        '101675489',
        '20-07-2025 09:17:42'
      ],
      [
        '131880681',
        'E340000000013',
        '02-04-2020',
        '917095',
        '101675489',
        '20-07-2025 09:17:42'
      ],
      [
        '131880681',
        'E340000000015',
        '02-04-2020',
        '0',
        '101675489',
        '20-07-2025 09:17:42'
      ],
      [
        '131880681',
        'E440000000008',
        '01-04-2020',
        '432000',
        '101675489',
        '20-07-2025 09:17:42'
      ],
      [
        '131880681',
        'E440000000013',
        '01-04-2020',
        '917095',
        '101675489',
        '20-07-2025 09:17:42'
      ],
      [
        '131880657',
        'E450000000001',
        '01-04-2020',
        '35400',
        '101675489',
        '20-07-2025 09:17:42'
      ],
      [
        '131880681',
        'E450000000011',
        '01-04-2020',
        '96657.8',
        '101675489',
        '20-07-2025 09:17:42'
      ],
];

for (var fila in datos) {
      final rncEmisor = fila[0];
      final encf = fila[1];
      final fechaEmision = fila[2];
      final montoTotal = fila[3];
      final rncComprador = fila[4];
      final fechaHoraAprobacionComercial = fila[5];

      final aprobacion = AprobacionComercial(
        rncEmisor: rncEmisor,
        numeroComprobante: encf,
        fechaEmision: fechaEmision,
        montoTotal: montoTotal,
        rncComprador: rncComprador,
        fechaHoraAprobacionComercial:
            fechaHoraAprobacionComercial, // ✔️ Fecha fija del set
        estado: '1',
        detalleMotivoRechazo: '',
        rsaPrivateKey: authModel.privateKey,
        certBase64: authModel.certBase64,
      );

      try {
        print('⏳ Procesando $encf...');
        await aprobacion.descargarSemilla();
        await aprobacion.validarSemilla();
        await aprobacion.enviarAprobacionComercialEcf();
        print('✅ Aprobación enviada: $encf');
      } catch (e) {
        print('⚠️ Error en $encf: $e');
      }

  await Future.delayed(Duration(seconds: 3));
}

``` 

<br>

<a href="https://www.buymeacoffee.com/juanpa0z" target="_blank"><img src="https://cdn.buymeacoffee.com/buttons/v2/default-yellow.png" alt="Buy Me A Coffee" style="height: 60px !important;width: 217px !important;" ></a>