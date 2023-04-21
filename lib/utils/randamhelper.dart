import 'dart:convert';
import 'package:randamapi/screen/model/randam_model.dart';


import 'package:http/http.dart' as http;


class RandamHelper {
  Future<RandamModel?> RandamApi() async {
    String? apiLink = "https://randomuser.me/api/";
    Uri uri = Uri.parse(apiLink);
    var response = await http.get(uri);

    if (response.statusCode == 200) {
      var json = jsonDecode(response.body);
      RandamModel homeModel = RandamModel.fromJson(json);
      return homeModel;
    } else {
      return null;
    }
  }
}