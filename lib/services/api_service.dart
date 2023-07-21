import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:http/http.dart' as http;

class ApiService {
  void getTodaysData() async {
    String jsonString = await rootBundle.loadString('json/config.json');
    final jsonResponse = json.decode(jsonString);
    final String token = jsonResponse['WPOSInformationTime']['token'];
    final String baseUrl =
        "http://openapi.seoul.go.kr:8088/$token/json/WPOSInformationTime/1/5";
    final url = Uri.parse(baseUrl);
    final response = await http.get(url);
    if (response.statusCode == 200) {
      print(response.body);
      return;
    }
    throw Error();
  }
}
