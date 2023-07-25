class TempModel {
  final String date, time, temp, id;

  TempModel.fromJson(Map<String, dynamic> json)
      : date = json['MSR_DATE'],
        time = json['MSR_TIME'],
        temp = json['W_TEMP'],
        id = json['SITE_ID'];
}
