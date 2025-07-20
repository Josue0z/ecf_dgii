import 'dart:io';
import 'package:ecf_dgii/ecf_dgii.dart';
import 'package:ecf_dgii/src/utils/directories.dart';
import 'package:intl/intl.dart';
import 'package:path/path.dart' as path;

void main() async {
  try {
    GeneratorEndPoint.envEcfType = EnvEcfType.cert;
    final cert = File(path.join(dirProject.path, 'certificado.p12'));
    final password = 'INES1037';

    final authModel = await getAuthP12(cert: cert, password: password);
    final dateFormat = DateFormat('dd-MM-yyyy HH:mm:ss');

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
      ], // ⚠️ No autorizado
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

      if (rncEmisor != '131880681') {
        print('🚫 Omitiendo $encf — RNC no autorizado en tu modelo');
        continue;
      }

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
  } catch (e) {
    print('⚠️ Error general: $e');
  }
}
