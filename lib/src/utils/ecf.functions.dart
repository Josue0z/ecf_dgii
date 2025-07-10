import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:ecf_dgii/ecf_dgii.dart';
import 'package:ecf_dgii/src/utils/directories.dart';
import 'package:http_parser/http_parser.dart';
import 'package:http/http.dart' as http;
import 'package:path/path.dart' as path;
//import 'package:path_provider/path_provider.dart';

Future<File> downloadSeed() async {
  var dir = Directory(dirProject.path);
  Uri uri = GeneratorEndPoint.getEndPoint(kSemillaEndPoint);
  final response = await http.get(
    uri,
    headers: {'accept': 'application/xml'},
  );

  final tempDir = Directory(path.join(dir.path, 'temp'));
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

FutureOr<Map<String, dynamic>?> validarSignSeed(File xmlSign) async {
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

Future<Map<String, dynamic>> sendEcfSign(
    File xmlSign, EcfType ecfType, String token, String montoTotal) async {
  String endPoint = kRecepcionEcfEndPoint;
  double monto = double.parse(montoTotal);

  if (ecfType == EcfType.e32 && monto < 250000.00) {
    endPoint = kRecepcionFcEcfEndPoint;
  }
  final uri = GeneratorEndPoint.getEndPoint(endPoint, ecfType: ecfType);
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

Future<Map<String, dynamic>> getEcfStatus(String trackId, String token) async {
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

Future<Map<String, String>> sendAprobacionComercial(
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
