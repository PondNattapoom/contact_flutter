import 'dart:convert';
import 'package:http/http.dart' as http;
import '/config/index.dart';

class NetworkDemo {
  Future postDataAPI(String module, dynamic data) async {
    var url = Uri.http(ApiConstants.baseUrl, module);
    http.Response response =
        await http.post(url, body: data, headers: ApiConstants.headerApi);
    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    } else {
      print(response.statusCode);
    }
  }

  Future getDataAPI(String module) async {
    var url = Uri.http(ApiConstants.baseUrl, module);
    http.Response response = await http.get(url);
    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    } else {
      print(response.statusCode);
    }
  }
}
