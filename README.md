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
import 'package:intl/intl.dart';
import 'package:path/path.dart' as path;

void main() async {
  try {
    final cert = File(path.join(dirProject.path, 'certificado.p12'));

    String password = '*********';

    AuthCertModel authModel = await getAuthP12(cert: cert, password: password);

    final now = DateTime.now();
    final fechaEmision = DateFormat('dd-MM-yyyy').format(now);

    List<EcfDetailsModel> items = [
      EcfDetailsModel(
          cantidad: '12.00',
          indicadorFacturacion: '4',
          indicadorBienOServ: '2',
          unidadMedida: '43',
          descripcion: 'Gasto personal en comida (kiosko)',
          descripcionItem: '',
          precioUnitario: '330.00',
          montoItem: '3960.00',
          retencion: null
          impuestosAdicionales: []),
    ];

    EcfModel ecf = EcfModel(
        tipoEcf: EcfType.e43,
        numeroComprobante: 'E430000000002',
        codigoModificacion: '',
        fechaEmision: fechaEmision,
        fechaVencimiento: '31-12-2025',
        fechaEmisionNcfModificado: '',
        razonModificacion:
            'ANULACION DEL ENCF31 CON SECUENCIA QUE FINALIZA EN 61',
        tipoIngreso: '',
        tipoPago: '',
        formasDePagos: [],
        sucursal: '',
        direccionEmisor:
            'AVE. ISABEL AGUIAR NO. 269, ZONA INDUSTRIAL DE HERRERA',
        municipio: '010100',
        provincia: '010000',
        telefonoEmisor1: '809-472-7676',
        telefonoEmisor2: '809-491-1918',
        telefonoEmisor3: '',
        totalPaginas: '',
        rncEmisor: '101675489',
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
        municipioComprador: '010100',
        provinciaComprador: '010000',
        codigoInternoComprador: '',
        fechaEntrega: '',
        fechaOrdenCompra: '',
        numeroOrdenCompra: '',
        numeroFacturaInterna: '',
        numeroPedidoInterno: '',
        zonaVenta: '',
        rutaVenta: '',
        indicadorMontoGravado: '',
        totalGravado: '',
        totalGravado18: '',
        totalGravado16: '',
        montoExento: '3960.00',
        totalItbis: '',
        totalItbis18: '',
        totalItbis16: '',
        itbis1: '',
        itbis2: '',
        itbis3: '',
        montoTotal: '3960.00',
        montoAvancePago: '',
        valorPagar: '',
        totalItbisRetencion: '',
        totalIsrRetencion: '',
        porcentajeRetencionIsr: '',
        baseImponibleIsr: '',
        porcentajeRetencionItbis: '',
        baseImponibleItbis: '',
        montoImpuestoAdicional: '',
        impuestosAdicionales: [],
        terminoPago: '',
        bancoPago: '',
        paginas: [],
        items: items,
        privateKey: authModel.privateKey,
        certBase64: authModel.certBase64);

    await ecf.downloadEcfSeed();
    await ecf.validarSign();
    await ecf.signer();
    await ecf.sendEcfSigned();
    print(ecf.uriEcf);
  } catch (e) {
    print('⚠️ Error: $e');
  }
}
