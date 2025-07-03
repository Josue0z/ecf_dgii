import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';
import 'package:xml/xml.dart';
import 'package:pointycastle/export.dart';
import 'package:crypto/crypto.dart' as crypto;

class XmlSignerModel {
  String xmlStr;
  File xmlFile;
  XmlSignerModel({required this.xmlStr, required this.xmlFile});
}

class XmlSignerService {
  final RSAPrivateKey privateKey;
  final String certificateBase64;

  XmlSignerService({required this.privateKey, required this.certificateBase64});

  String canonicalize(XmlElement element) {
    final builder = XmlBuilder();
    builder.element(element.name.local, nest: () {
      for (final attr in element.attributes) {
        builder.attribute(attr.name.local, attr.value);
      }
      for (final child in element.children.whereType<XmlElement>()) {
        builder.text(child.toXmlString());
      }
    });
    return builder.buildDocument().toXmlString();
  }

  Future<XmlSignerModel> signXml(String xmlOriginal, File fileOutpath) async {
    final doc = XmlDocument.parse(xmlOriginal);
    final root = doc.rootElement;
    final canonicalXml = canonicalize(root);

    // 1. Digest value
    final digest = crypto.sha256.convert(utf8.encode(canonicalXml)).bytes;
    final digestBase64 = base64.encode(digest);

    // 2. Build <SignedInfo>
    final signedInfoXml = '''
<SignedInfo xmlns="http://www.w3.org/2000/09/xmldsig#">
  <CanonicalizationMethod Algorithm="http://www.w3.org/TR/2001/REC-xml-c14n-20010315"/>
  <SignatureMethod Algorithm="http://www.w3.org/2001/04/xmldsig-more#rsa-sha256"/>
  <Reference URI="">
    <Transforms>
      <Transform Algorithm="http://www.w3.org/2000/09/xmldsig#enveloped-signature"/>
    </Transforms>
    <DigestMethod Algorithm="http://www.w3.org/2001/04/xmlenc#sha256"/>
    <DigestValue>$digestBase64</DigestValue>
  </Reference>
</SignedInfo>
''';

    // 3. Canonicalize <SignedInfo> again
    final signedInfoNode = XmlDocument.parse(signedInfoXml).rootElement;
    final canonicalSignedInfo = canonicalize(signedInfoNode);

    // 4. Sign with RSA
    final signer = Signer('SHA-256/RSA');
    final privParams = PrivateKeyParameter<RSAPrivateKey>(privateKey);
    signer.init(true, privParams);

    final sig = signer.generateSignature(
        Uint8List.fromList(utf8.encode(canonicalSignedInfo)));
    final sigBytes = (sig as RSASignature).bytes;
    final signatureBase64 = base64.encode(sigBytes);

    // 5. Build <Signature>
    final signatureXml = '''
<Signature xmlns="http://www.w3.org/2000/09/xmldsig#">
$signedInfoXml
<SignatureValue>$signatureBase64</SignatureValue>
<KeyInfo>
  <X509Data>
    <X509Certificate>$certificateBase64</X509Certificate>
  </X509Data>
</KeyInfo>
</Signature>
''';

    // 6. Insert <Signature> before closing root
    final index = xmlOriginal.lastIndexOf('</');
    final xmlFirmado = xmlOriginal.substring(0, index) +
        signatureXml +
        xmlOriginal.substring(index);

    File xmlFile = File(fileOutpath.path);
    await xmlFile.create(recursive: true);
    await xmlFile.writeAsString(xmlFirmado);
    return XmlSignerModel(xmlStr: xmlFirmado, xmlFile: xmlFile);
  }
}
