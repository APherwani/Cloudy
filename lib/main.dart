import 'package:cloudy/splash.dart';
import 'package:flutter/material.dart';
import 'package:cloudy/weather.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  void printWeather() async {
    Weather weather = Weather();
    var str = await weather.getWeather();
    print(str);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark(),
      home: Scaffold(
        body: Center(
          child: RaisedButton(
            onPressed: () {
              printWeather();
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
