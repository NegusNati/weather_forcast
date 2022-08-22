import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:weather_forcast/utill/convertIcon.dart';
import 'package:weather_forcast/utill/forcast_utill.dart';

Widget forcastCard(AsyncSnapshot snapshot, int index) {
  var forcastList = snapshot.data!.list;
  var dayOfTheWeek = "";
  DateTime date =
      DateTime.fromMillisecondsSinceEpoch(forcastList[index].dt * 1000);
  var fullDate = Util.getFormatedDate(date);
  dayOfTheWeek = fullDate.split(",").elementAt(0);

  return Padding(
    padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 10),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Center(child: Text(dayOfTheWeek)),
        const SizedBox(height: 7,),
        Row(mainAxisAlignment: MainAxisAlignment.start, children: [
          CircleAvatar(
            
           backgroundColor: Colors.white,
            radius: 33,
            child: getWeatherIcon(
                weatherDescription: forcastList[index].weather[0].main,
                color: Colors.pink[300],
                size: 37),

          ),
          const SizedBox(width: 5,),
          Column(
       
            children: [
              Row(
                children: [
                  Text("${forcastList[index].temp.min.toStringAsFixed(0)}°C  "),
                  const Icon(FontAwesomeIcons.solidCircleDown  ,color: Colors.white, size: 10,)
                ],
              ),
              Row(
                children: [
                  Text("${forcastList[index].temp.max.toStringAsFixed(0)}°C  "),
                   const Icon(FontAwesomeIcons.solidCircleUp  ,color: Colors.white, size: 10,)
                ],
              ),
                 Text("Hum:${forcastList[index].humidity}%",),
                 Text("Win:${forcastList[index].speed.toStringAsFixed(0)}M/s",)
                   
               
            ],
          ),
        ]),
      ],
    ),
  );
}
