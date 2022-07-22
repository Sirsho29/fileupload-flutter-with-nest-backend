import 'dart:developer';
import 'dart:io';
import 'package:http/http.dart' as http;

class FileUploadService {
  static Future<bool> onlyUploadSingleImage(
    File imageFile,
  ) async {
    var request = http.MultipartRequest(
        'POST', Uri.parse('http://10.0.2.2:3000/files/upload'));
    request.files.add(http.MultipartFile.fromBytes(
        'file', imageFile.readAsBytesSync(),
        filename: imageFile.path.split("/").last));
    try {
      request.send().then((value) async {
        await http.Response.fromStream(value).then((res) async {
          if (res.statusCode == 201) {
            log(res.body);
            return true;
          }
        });
      });
      return false;
    } catch (e) {
      log(e.toString());
      return false;
    }
  }
}
