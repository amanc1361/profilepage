import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:task1/model/user.dart';
import 'package:http/http.dart' as http;

class BaseApi {
  static Map<String, String> headeroption = {"Content-Type": "application/json"};
  final String basuUrl = "api.i-re.me";

  Future<dynamic> post(
      {String baseUrl = "", String pathUrl = "", Map<String, dynamic>? body, Map<String, dynamic>? param}) async {
    if (User().token!.isNotEmpty) {
      headeroption.addAll({'Authorization': "Bearer ${User().token}"});
    }

    var responseJson;
    try {
      // ignore: prefer_interpolation_to_compose_strings
      Uri url = Uri.http(baseUrl, "api/rest/user/" + pathUrl, param);
      final response = await http.post(url, body: json.encode(body), headers: headeroption);
      if (response.statusCode == 200) {
        if (response.bodyBytes.isNotEmpty) {
          responseJson = jsonDecode(utf8.decode(response.bodyBytes));
          return responseJson;
        } else {
          return true;
        }
      } else {
        responseJson = jsonDecode(utf8.decode(response.bodyBytes));
        throw responseJson["message"];
      }
    } catch (error) {
      throw error;
    }
  }

  Future<dynamic> get(
      {String baseUrl = "", String pathUrl = "", Map<String, dynamic>? body, Map<String, dynamic>? param}) async {
    Options options = Options(contentType: "application/json");
    if (User().token!.isNotEmpty) {
      options = Options(contentType: "application/json", headers: {'Authorization': "Bearer ${User().token}"});
    }

    final dio = Dio();
    try {
      final response = await dio.get('http://api.i-re.me:8080/api/rest/user/$pathUrl', data: body, options: options);

      return response.data;
    } catch (error) {
      throw error;
    }
  }
}
