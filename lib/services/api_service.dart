import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:hangangtemperature/models/temp_model.dart';
import 'package:http/http.dart' as http;

class ApiService {
  static Future<Map<String, dynamic>> getTodaysData() async {
    String jsonString = await rootBundle.loadString('json/config.json');
    final jsonResponse = json.decode(jsonString);
    final String token = jsonResponse['WPOSInformationTime']['token'];
    final String baseUrl =
        "http://openapi.seoul.go.kr:8088/$token/json/WPOSInformationTime/1/5";
    final url = Uri.parse(baseUrl);
    final response = await http.get(url);
    if (response.statusCode == 200) {
      Map<String, dynamic> data = json.decode(response.body);
      return data;
    } else {
      throw Error();
    }
  }

  static Future getData() async {
    final data = getTodaysData();
    late Map<String, dynamic> tmp;
    final List<TempModel> tempInstances = [];
    List<dynamic> minData = ['test', 100];
    List<dynamic> maxData = ['test', 0];
    data.then((value) {
      tmp = value["WPOSInformationTime"];
      if (tmp["RESULT"]["CODE"] == "INFO-000") {
        for (var temp in tmp['row']) {
          if (temp['W_TEMP'] != '점검중') {
            tempInstances.add(TempModel.fromJson(temp));
          }
          if (double.parse(temp['W_TEMP']) >= maxData[1]) {
            maxData = [temp['SITE_ID'], double.parse(temp['W_TEMP'])];
          } else if (double.parse(temp['W_TEMP']) <= minData[1]) {
            minData = [temp['SITE_ID'], double.parse(temp['W_TEMP'])];
          }
        }
      }
      return [tempInstances, minData, maxData];
    });
  }
}
