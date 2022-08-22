import 'dart:convert';

import 'package:weather_forcast/utill/forcast_utill.dart';
import 'package:http/http.dart';

import '../models/weather_model.dart';

class Network{

  Future<WeatherForecastModel> getWeatherForcast({required String cityName}) async {

     var url =  "https://api.openweathermap.org/data/2.5/forecast/daily?q="+cityName+"&cnt=7&appid="+Util.appId+"&units=metric";

     final Response response = await get(Uri.parse(url));
     print(Uri.parse(url));


    

     if(response.statusCode == 200){
      print(json.decode(response.body));
      //return the mapped json to our PODO model  
      return WeatherForecastModel.fromJson(json.decode(response.body)); 
     }else{
      throw Exception("Error reaching the wearther API");
     }

  }

  
}