import 'dart:io';
import 'dart:convert';
import 'package:http/http.dart' as http;

class DataFromAPI {
  DataFromAPI({required this.url});
  String url;

  Future<dynamic> getHttpBody() async {
    http.Response response = await http.get(Uri.parse(this.url));
    if (response.statusCode == 200) {
      // print(response.body);
      return jsonDecode(response.body);
      // print(decodedData['main']['temp']);
      // print(decodedData['name']);
      // print(decodedData['weather'][0]['id']);
    } else {
      print('something went wrong');
    }
  }
}
