// Written by Elbert Tse and Arjun Pherwani for KnightHacks 2020

import 'package:flutter/material.dart';
import 'package:cloudy/weather.dart';

void main() async {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  var str;

  void getWeather() async {
    Weather weather = Weather();
    var str = await weather.getWeather();
    // print(str);
    // print(str['hourly'][0]);
    var cityName = await weather.getCity();
    print(cityName['name']);
  }

  //void getBackgroundColor() {}

  @override
  Widget build(BuildContext context) {
    getWeather();
    return MaterialApp(
      debugShowCheckedModeBanner: true,
      theme: ThemeData.dark(),
      home: Scaffold(
        //backgroundColor: getBackgroundColor(),
        body: Center(
          child: RaisedButton(
            onPressed: () {
              getWeather();
            },
            child: Text(
              'print weather info',
            ),
          ),
        ),
      ),
    );
  }
}
