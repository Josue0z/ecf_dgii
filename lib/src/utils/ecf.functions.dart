import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:ecf_dgii/src/types/ecf.dart';
import 'package:ecf_dgii/src/types/endpoints.dart';
import 'package:ecf_dgii/src/utils/directories.dart';
import 'package:ecf_dgii/src/utils/generate.endpoint.dart';
import 'package:http_parser/http_parser.dart';
import 'package:http/http.dart' as http;
import 'package:path/path.dart' as path;

/// Descargar semilla original de la DGII
Future<File> descargarSemillaDgii(String dirName) async {
  Uri uri = GeneratorEndPoint.getEndPoint(kSemillaEndPoint);
  final response = await http.get(
    uri,
    headers: {'accept': 'application/xml'},
  );

  final tempDir = Directory(path.join(tempDirPath, dirName));
  await tempDir.create(recursive: true);

  if (response.statusCode == 200) {
    final file = File(path.join(tempDir.path, 'semilla.xml'));
    print(uri.toString());
    await file.writeAsBytes(response.bodyBytes);

    return file;
  } else {
    throw 'Error al obtener la semilla: ${response.statusCode}';
  }
}

/// Validar semilla firmada de la DGII

FutureOr<Map<String, dynamic>?> validarSemillaFirmada(File xmlSign) async {
  final uri = GeneratorEndPoint.getEndPoint(kValidarSemillaEndPoint);
  try {
    final request = http.MultipartRequest('POST', uri)
      ..headers['accept'] = 'application/json'
      ..files.add(await http.MultipartFile.fromPath(
        'xml',
        xmlSign.path,
        contentType: MediaType('text', 'xml'),
        filename: path.basename(xmlSign.path),
      ));

    final response = await request.send();
    final body = await response.stream.bytesToString();

    if (response.statusCode == 200) {
      return jsonDecode(body);
    } else {
      throw body;
    }
  } catch (error) {
    rethrow;
  } finally {
    print(uri.toString());
  }
}

/// Enviar [EcfModel] firmado a la DGII
Future<Map<String, dynamic>> enviarEcfFirmado(
    File xmlSign, EcfType ecfType, String token, bool esResumen) async {
  String endPoint = kRecepcionEcfEndPoint;

  if (esResumen) {
    endPoint = kRecepcionFcEcfEndPoint;
  }

  final uri = GeneratorEndPoint.getEndPoint(endPoint, esResumen: esResumen);

  try {
    final request = http.MultipartRequest('POST', uri)
      ..headers['accept'] = 'application/json'
      ..headers['Authorization'] = 'Bearer $token'
      ..files.add(await http.MultipartFile.fromPath(
        'xml',
        xmlSign.path,
        contentType: MediaType('text', 'xml'),
        filename: path.basename(xmlSign.path),
      ));

    final response = await request.send();
    final body = await response.stream.bytesToString();

    if (response.statusCode == 200) {
      return jsonDecode(body);
    } else {
      throw body;
    }
  } catch (error) {
    print(error);
    rethrow;
  } finally {
    print(uri.toString());
  }
}

/// Obtener estado del [EcfModel]

Future<Map<String, dynamic>> obtenerEcfEstado(
    String trackId, String token) async {
  final uri =
      GeneratorEndPoint.getEndPoint('$kTrackIdEcfEndPoint?trackId=$trackId');
  try {
    final request = http.MultipartRequest('GET', uri)
      ..headers['accept'] = 'application/json'
      ..headers['Authorization'] = 'Bearer $token';

    final response = await request.send();
    final body = await response.stream.bytesToString();

    if (response.statusCode == 200) {
      print('✅ Status: ${response.statusCode}');
      print('📨 Respuesta: $body');
      return jsonDecode(body);
    } else {
      throw body;
    }
  } catch (error) {
    print(error);
    rethrow;
  } finally {
    print(uri.toString());
  }
}

/// Enviar [AprobacionComercial] a la DGII
Future<Map<String, dynamic>> enviarAprobacionComercial(
    File file, String token) async {
  final uri = GeneratorEndPoint.getEndPoint(kAprobacionEcfEndPoint);
  try {
    final request = http.MultipartRequest('POST', uri)
      ..headers['accept'] = 'application/json'
      ..headers['Authorization'] = 'Bearer $token'
      ..files.add(await http.MultipartFile.fromPath(
        'xml',
        file.path,
        contentType: MediaType('text', 'xml'),
        filename: path.basename(file.path),
      ));

    final response = await request.send();
    final body = await response.stream.bytesToString();

    if (response.statusCode == 200) {
      print('✅ Status: ${response.statusCode}');
      print('📨 Respuesta: $body');
      return jsonDecode(body);
    } else {
      throw body;
    }
  } catch (error) {
    print(error);
    rethrow;
  } finally {
    print(uri.toString());
  }
}
