import 'dart:io';
import 'package:http/http.dart' as http;

class UploadService {
  static Future<void> uploadImage(File imageFile) async {
    var request = http.MultipartRequest(
      'POST',
      Uri.parse("~~~~~"),
    );
    request.files.add(
      await http.MultipartFile.fromPath('image', imageFile.path),
    );

    var response = await request.send();

    if (response.statusCode == 200) {
      var responseData = await response.stream.bytesToString();
      print('Detection result: $responseData');
    } else {
      print('Image upload failed with status: ${response.statusCode}');
    }
  }
}
