// Written by Elbert Tse and Arjun Pherwani for KnightHacks 2020

// ADD LOCATION PERMISSION STUFF TO ANDROID AND IOS FOLDERS

import 'package:cloudy/splash.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: true,
      theme: ThemeData.dark(),
      home: SplashPage(),
    );
  }
}