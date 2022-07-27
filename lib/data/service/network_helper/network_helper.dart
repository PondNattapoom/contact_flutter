import 'dart:convert';
import 'package:http/http.dart' as http;
import '/config/index.dart';

class NetworkHelper {
  Future postDataAPI(String module, dynamic data) async {
    var generatePathModule = ApiConstants.projectPath + module;
    var url = Uri.https(ApiConstants.endPoint, generatePathModule);

    http.Response response =
        await http.post(url, body: data, headers: ApiConstants.headerApi);
    print(response);

    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    } else {
      print(response.statusCode);
    }
  }

  Future getDataAPI(String module) async {
    var generatePathModule = ApiConstants.projectPath + module;
    var url = Uri.https(ApiConstants.endPoint, generatePathModule);
    http.Response response = await http.get(url);
    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    } else {
      print(response.statusCode);
    }
  }
}
