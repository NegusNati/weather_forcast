import 'package:flutter/material.dart';
import 'package:weather_forcast/models/weather_model.dart';
import 'package:weather_forcast/network/network.dart';

class WeatheForcast extends StatefulWidget {
  const WeatheForcast({Key? key}) : super(key: key);

  @override
  State<WeatheForcast> createState() => _WeatheForcastState();
}

class _WeatheForcastState extends State<WeatheForcast> {
  late Future<WeatherForecastModel> forecastObject;


  final String _city = "London";
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    forecastObject = Network().getWeatherForcast(cityName: _city);


    // forecastObject.then((value) {
    //   print("id ""${value.list[1].weather[0].main}");
    // });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('GOOGLE Maps'),
        
      ),
      body: Container(

      ),
    );
     
}}