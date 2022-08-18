
import 'package:flutter/material.dart';
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
          Text(formatedDate, style:const TextStyle(fontSize: 15) ),
          const SizedBox(height: 15,),
          const Icon(Icons.sunny, size: 190,),
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text("${forecastList[0].temp.day.toStringAsFixed(0)}°C", style: TextStyle(fontSize: 35, fontWeight: FontWeight.w600) ),
                    
                    const SizedBox(width: 10,),
                    Text("${forecastList[0].weather[0].description.toUpperCase()}", style: TextStyle(fontSize: 25, fontWeight: FontWeight.w200) ),
                  
                  ],
                ),
                Row(),
              ],
            ),
          )
        ],),
    )
  );


  return mid;
}