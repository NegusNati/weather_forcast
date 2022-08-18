
import 'package:flutter/cupertino.dart';

Widget midview(AsyncSnapshot snapshot){
  var forecastList = snapshot.data.list; 

  var cityNameUi = snapshot.data.city.name;
  var cityCountry = snapshot.data.city.country;
  Container mid = Container(
    child: Padding(
      padding: const EdgeInsets.all(15.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text("$cityNameUi, $cityCountry",
          style: const TextStyle(fontSize: 15, fontWeight: FontWeight.bold),),
        ],),
    )
  );


  return mid;
}