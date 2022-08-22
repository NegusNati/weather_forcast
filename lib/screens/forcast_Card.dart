import 'package:flutter/material.dart';
import 'package:weather_forcast/utill/forcast_utill.dart';

Widget forcastCard(AsyncSnapshot snapshot,int index){
var forcastList = snapshot.data!.list;
var dayOfTheWeek = "";
DateTime date = DateTime.fromMillisecondsSinceEpoch(forcastList[index].dt * 1000);
var fullDate = Util.getFormatedDate(date);
dayOfTheWeek = fullDate.split(",").elementAt(0);


return Column(
  mainAxisAlignment: MainAxisAlignment.start,
  crossAxisAlignment: CrossAxisAlignment.start,
  children: [
    Text(dayOfTheWeek),  
  ],
);

}