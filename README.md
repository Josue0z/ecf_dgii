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
import 'package:ecf_dgii/ecf_dgii.dart';
import 'package:ecf_dgii/src/utils/directories.dart';
import 'package:path/path.dart' as path;

void main() async {
  try {
    //GeneratorEndPoint.envEcfType = EnvEcfType.cert;
    final cert = File(path.join(dirProject.path, 'certificado.p12'));

    String password = '*******';

    AuthCertModel authModel = await getAuthP12(cert: cert, password: password);

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
            ImpuestoAdicional(
              tipoImpuesto: '002',
            ),
            ImpuestoAdicional(
              tipoImpuesto: '004',
            )
          ],
          montoItem: '107766.57'),
      EcfDetailsModel(
          cantidad: '1.00',
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
            ImpuestoAdicional(
              tipoImpuesto: '002',
            ),
            ImpuestoAdicional(
              tipoImpuesto: '004',
            )
          ],
          montoItem: '10697.64'),
    ];

    EcfModel ecf = EcfModel(
        tipoEcf: EcfType.e31,
        tempDirName: 'temp_4',
        numeroComprobante: 'E310000000003',
        fechaHoraAprobacionComercial: '18-07-2025 10:11:59',
        codigoModificacion: '',
        fechaEmision: '01-04-2020',
        fechaVencimiento: '31-12-2025',
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
        rncEmisor: '101675489',
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
        fechaOrdenCompra: '10-11-2018',
        numeroOrdenCompra: '4500352238',
        numeroFacturaInterna: '123456789016',
        numeroPedidoInterno: '123456789016',
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
              otrosImpuestosAdicionales: '2369.28'),
          ImpuestoAdicional(
              tipoImpuesto: '004',
              tasaImpuestoAdicional: '10',
              otrosImpuestosAdicionales: '11846.42')
        ],
        montoTotal: '154003.47',
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
    var filePdf = File(path.join(dirProject.path, 'temp_4', 'pdfs',
        '${ecf.rncEmisor}${ecf.numeroComprobante}.PDF'));

    await filePdf.create(recursive: true);
    await filePdf.writeAsBytes(await doc.save());
    print(ecf.uriEcf);
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