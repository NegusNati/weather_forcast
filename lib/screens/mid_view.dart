
import 'package:flutter/cupertino.dart';
import 'package:weather_forcast/utill/forcast_utill.dart';

Widget midview(AsyncSnapshot snapshot){
  var forecastList = snapshot.data.list; 

  var cityNameUi = snapshot.data.city.name;
  var cityCountry = snapshot.data.city.country;
  var formatedDate = Util.getFormatedDate(DateTime.fromMillisecondsSinceEpoch(forecastList[0].dt * 1000 ),); // multiply by 1000 to get the current millisecond 
  Container mid = Container(
    child: Padding(
      padding: const EdgeInsets.all(15.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text("$cityNameUi, $cityCountry",
          style: const TextStyle(fontSize: 15, fontWeight: FontWeight.bold),),
          Text(formatedDate),
        ],),
    )
  );


  return mid;
}