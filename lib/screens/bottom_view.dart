import 'package:flutter/material.dart';
import 'package:weather_forcast/screens/forcast_Card.dart';

Widget bottomView(AsyncSnapshot<dynamic> snapshot, BuildContext context) {
  var forcastList = snapshot.data!.list;

  return Column(
    mainAxisAlignment: MainAxisAlignment.start,
    children: [
      Text(
        "7 Days Weather Forcast".toUpperCase(),
        style:
            const TextStyle(fontWeight: FontWeight.bold, color: Colors.black38),
      ),
      Container(
        height: 200,
        padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 10),
        child: ListView.separated(
          scrollDirection: Axis.horizontal,
          separatorBuilder: ((context, index) {
            return const SizedBox(
              width: 10,
            );
          }),
          itemCount: forcastList.length,
          itemBuilder: ((context, index) {
            return ClipRRect(
              borderRadius: const BorderRadius.all(
                Radius.circular(10),
              ),
              child: Container(
                width: MediaQuery.of(context).size.width / 2.6,
                height: 180,
                decoration: const BoxDecoration(
                    gradient: LinearGradient(
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                        colors: [Color(0xff9661c3), Colors.white])),
                child: forcastCard(snapshot, index),
              ),
            );
          }),
        ),
      ),
    ],
  );
}
