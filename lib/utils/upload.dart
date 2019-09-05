import 'dart:io';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:image_picker/image_picker.dart';

class Upload {

  final String nodeEndPoint = 'http://192.168.1.4:9000/upload';

  File file;

  void choose() async {
    file = await ImagePicker.pickImage(source: ImageSource.gallery);

    upload(file);
  }

  void upload(File file) {
    if (file == null) return ;
    String base64Image = base64Encode(file.readAsBytesSync());
    String fileName = file.path.split("/").last;
    http.post(nodeEndPoint, body: {
      "image": base64Image,
      "name": fileName,
    }).then((res) async => print(res.statusCode)).catchError((err) {
      print(err);
    });
  }
}