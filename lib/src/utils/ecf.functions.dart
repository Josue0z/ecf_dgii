import 'dart:convert';
import 'dart:io';
import 'package:ecf_dgii/ecf_dgii.dart';
import 'package:http_parser/http_parser.dart';
import 'package:http/http.dart' as http;
import 'package:path/path.dart' as path;
//import 'package:path_provider/path_provider.dart';

Future<File> downloadSeed() async {
  var dir = Directory.systemTemp;
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
    return file.writeAsString(response.body);
  } else {
    throw 'Error al obtener la semilla: ${response.statusCode}';
  }
}

Future<Map<String, String>?> sendSignSeed(File xmlSign) async {
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
    print('✅ Status: ${response.statusCode}');

    if (response.statusCode == 200) {
      dynamic json;
      if (body.contains('{')) {
        json = jsonDecode(body);
        return json;
      } else {
        print('📨 Respuesta: $body');
      }
    } else {
      throw body;
    }
    return null;
  } catch (error) {
    rethrow;
  } finally {
    print(uri.toString());
  }
}

Future<void> sendEcfSign(File xmlSign, EcfType type, String token) async {
  String endPoint = kRecepcionEcfEndPoint;
  switch (type) {
    case EcfType.e31:
      endPoint = kRecepcionEcfEndPoint;
      break;
    case EcfType.e32:
      endPoint = kRecepcionFcEcfEndPoint;
      break;
    default:
  }
  final uri = GeneratorEndPoint.getEndPoint(endPoint);
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
      print('✅ Status: ${response.statusCode}');
      print('📨 Respuesta: $body');
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
