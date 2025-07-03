# ecf_dgii 🧾🇩🇴

Librería Dart para generar, firmar y enviar Comprobantes Fiscales Electrónicos (e-CF) conforme al esquema DGII en República Dominicana. (Uso de Openssl para validar certificados)

por lo tanto debera instalar Openssl en Windows y agregarla al Path, en caso de MacOs Openssl esta por defecto en las versiones mas recientes de ese sistema operativo

---

## 🚀 Ejemplo de uso completo

```dart
import 'dart:io';
import 'package:ecf_dgii/ecf_dgii.dart';
import 'package:ecf_dgii/src/utils/directories.dart';
import 'package:path/path.dart' as path;

void main() async {
  try {
    // Ruta al certificado digital
    final cert = File(path.join(dirProject.path, 'certificado.p12'));

    // Autenticación usando archivo .p12
    AuthCertModel authModel = await getAuthP12(cert: cert, password: '******');

    // Crear instancia del comprobante
    EcfModel ecf = EcfModel(
      tipoEcf: EcfType.e31,
      rncEmisor: '101675489',
      razonSocialEmisor: 'UREÑA LORENZO & ASOC',
      rncComprador: '131111111',
      fechaEmision: DateTime.now(),
      numeroComprobante: 'E310000000031',
      montoTotal: '52500.00',
      totalItbis: '2500.00',
      privateKey: authModel.privateKey,
      certBase64: authModel.certBase64,
    );

    // Agregar detalles de facturación
    ecf.items.addAll([
      EcfDetailsModel(
        cantidad: '1',
        descripcion: 'IGUALA R LOPEZ 04-2025',
        precioUnitario: '17500.00',
        itbis: '833.33',
      ),
      EcfDetailsModel(
        cantidad: '1',
        descripcion: 'IGUALA R LOPEZ 05-2025',
        precioUnitario: '17500.00',
        itbis: '833.33',
      ),
      EcfDetailsModel(
        cantidad: '1',
        descripcion: 'IGUALA R LOPEZ 06-2025',
        precioUnitario: '17500.00',
        itbis: '833.33',
      ),
    ]);

    // Flujo completo DGII
    await ecf.downloadEcfSeed();   // Obtener semilla
    await ecf.sendEcfSeed();       // Enviar semilla a la DGII
    await ecf.signer();            // Firmar XML localmente
    await ecf.sendEcfSigned();     // Enviar comprobante firmado a la DGII

    print(ecf.ecfSignXml);         // Mostrar XML firmado resultante

    // Limpieza de archivos temporales
    await ecf.seedFile?.delete();
    await ecf.ecfFile?.delete();
  } catch (e) {
    print('⚠️ Error: $e');
  }
}
