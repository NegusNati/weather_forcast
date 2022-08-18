import 'package:flutter/material.dart';
import 'package:weather_forcast/models/weather_model.dart';
import 'package:weather_forcast/network/network.dart';
import 'package:weather_forcast/screens/mid_view.dart';

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
      body: ListView(
        padding: const EdgeInsets.only(top: 20,),
        children: [
          textFieldView(),
          Container(
            child:FutureBuilder<WeatherForecastModel>(
              future: forecastObject,
              builder: ((context,AsyncSnapshot snapshot) {
              if(snapshot.hasData){
                return Column(
                  children: [
                    midview(snapshot),
                  ],
                );
              }else{
                return Container(
                  child: const Center(child: CircularProgressIndicator()),
                );
              }
            })
            )
          )
        ],
      ),
    );
  }

  Widget textFieldView() {
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: Container(
        child: TextField(
          decoration: InputDecoration(
              hintText: "Input City Name",
              prefixIcon: const Icon(Icons.search),
              border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
              contentPadding: const EdgeInsets.all(8)),
          onSubmitted: (value) {},
        ),
      ),
    );
  }
}
