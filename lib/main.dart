// Written by Elbert Tse and Arjun Pherwani for KnightHacks 2020

import 'package:cloudy/splash.dart';
import 'package:flutter/material.dart';
import 'package:cloudy/weather.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark(),
      title: 'Cloudy',
      home: Scaffold(
        body: SplashPage(),
      ),
    );
  }
}
