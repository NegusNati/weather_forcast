import 'package:flutter/material.dart';
import 'package:weather_forcast/models/weather_model.dart';
import 'package:weather_forcast/network/network.dart';

class WeatheForcast extends StatefulWidget {
  WeatheForcast({Key? key}) : super(key: key);

  @override
  State<WeatheForcast> createState() => _WeatheForcastState();
}

class _WeatheForcastState extends State<WeatheForcast> {
  late Future<WeatherForecastModel> forecastObject;


  String _city = "London";
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    forecastObject = Network().getWeatherForcast(cityName: _city);

    forecastObject.then((value) {
      print(value.city.id);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('GOOGLE Maps'),
        
      ),
    );
     
}}