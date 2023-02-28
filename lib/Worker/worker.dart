import 'package:http/http.dart';
import 'dart:convert';

class Worker {
  String? location;

  Worker({this.location}) {
    //location = this.location;
  }

  String? temp;
  String? humidity;
  String? airSpeed;
  String? description;
  String? main;
  String? icon;

  Future<void> getData() async {
    try {
      Response response = await get(
        Uri.parse(
          "https://api.openweathermap.org/data/2.5/weather?q=$location&appid=df989052fc3d2f063569a963398e2024",
        ),
      );
      Map data = jsonDecode(response.body);

      Map tempdata = data['main'];
      String getHumidity = tempdata['humidity'].toString();
      double getTemp = tempdata['temp'] - 273.15;

      Map wind = data['wind'];
      double getAirSpeed = wind["speed"] / 0.27777777777778;

      List weatherData = data['weather'];
      Map weatherMainData = weatherData[0];
      String getMainDes = weatherMainData['main'];
      String getDesc = weatherMainData['description'];

      temp = getTemp.toString();
      humidity = getHumidity;
      airSpeed = getAirSpeed.toString();
      description = getDesc;
      main = getMainDes;
      icon = weatherMainData["icon"].toString();
    } catch (e) {
      temp = "NA";
      humidity = "NA";
      airSpeed = "NA";
      description = "NA";
      main = "NA";
      icon = "03n";
    }
  }
}
