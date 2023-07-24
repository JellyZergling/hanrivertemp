class TempModel {
  final String date, time, temp;

  TempModel.fromJson(Map<String, dynamic> json)
      : date = json['MSR_DATE'],
        time = json['MSR_TIME'],
        temp = json['W_TEMP'];
}
