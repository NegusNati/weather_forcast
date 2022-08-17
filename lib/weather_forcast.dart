import 'package:flutter/material.dart';

class WeatheForcast extends StatefulWidget {
  WeatheForcast({Key? key}) : super(key: key);

  @override
  State<WeatheForcast> createState() => _WeatheForcastState();
}

class _WeatheForcastState extends State<WeatheForcast> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('GOOGLE Maps'),
        
      ),
    );
     
}}