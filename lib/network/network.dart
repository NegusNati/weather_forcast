import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:weather_forcast/utill/forcast_utill.dart';
import 'package:http/http.dart';

import '../models/weather_model.dart';

class Network {
  Future<WeatherForecastModel> getWeatherForcast(
      {required String cityName}) async {
    var url =
        "https://api.openweathermap.org/data/2.5/forecast/daily?q=$cityName&cnt=7&appid=${Util.appId}&units=metric";

    final Response response = await get(Uri.parse(url));

    print(response.statusCode);

    // try {

    //     print(json.decode(response.body));
    //     //return the mapped json to our PODO model
    //     return WeatherForecastModel.fromJson(json.decode(response.body));

    // } catch (e) {
    //   print('not found');
    //   throw  Exception("Error reaching the wearther API");
    // }

    if (response.statusCode == 200) {
      print(json.decode(response.body));
      //return the mapped json to our PODO model
      return WeatherForecastModel.fromJson(json.decode(response.body));
    } else if (response.statusCode == 404) {
      String res = response.body;
      var data = jsonDecode(res);

      Fluttertoast.showToast(
          msg: data["message"],
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.CENTER,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.red,
          textColor: Colors.white,
          fontSize: 16.0);
      throw '';
    } else {
      print(response.statusCode);
      throw Exception("Error reaching the wearther API");
    }
  }
}
