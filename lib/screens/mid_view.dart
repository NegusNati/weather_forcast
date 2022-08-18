
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:weather_forcast/utill/forcast_utill.dart';

import '../utill/constants.dart';

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
            Icon(FontAwesomeIcons.cloud, color: Colors.pink[300]  , size: 190,),
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
                    Text("${forecastList[0].temp.day.toStringAsFixed(0)}°C", style: const TextStyle(fontSize: 35, fontWeight: FontWeight.w600) ),
                    
                    const SizedBox(width: 10,),
                    Text("${forecastList[0].weather[0].description.toUpperCase()}", style: const TextStyle(fontSize: 25, fontWeight: FontWeight.w200) ),
                  
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 12,vertical: 12),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Column(
                      
                        children: [
                          Text("${forecastList[0].speed.toStringAsFixed(0)} M/s ",style:kSmallTextStyle),
                          const SizedBox(height: 5 ),
                          const Icon(FontAwesomeIcons.wind , size: 20, color:Colors.brown )
                        ],
                      ),
                      Column(
                        children:  [
                          Text("${forecastList[0].humidity}% ",style:kSmallTextStyle),
                          const SizedBox(height: 5 ),

                          const Icon(FontAwesomeIcons.faceGrinBeamSweat , size: 20, color:Colors.brown )
                        ],
                      ),
                      Column(
                        children:  [
                          Text("${forecastList[0].temp.day.toStringAsFixed(0)}°C ", style:kSmallTextStyle ),
                          const SizedBox(height: 5 ),
                           Icon(FontAwesomeIcons.temperatureHalf, color: Colors.brown[400]),
                          // const Icon(Icons.telegram_sharp , size: 20, color:Colors.brown )
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          )
        ],),
    )
  );


  return mid;
}