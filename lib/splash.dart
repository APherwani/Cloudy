import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'screen.dart';

class SplashPage extends StatefulWidget {
  @override
  _SplashPageState createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  int temp;

  @override
  void initState() {
    super.initState();
    getWeatherInfo();
  }

  void getWeatherInfo() async {
    // grab weather info from api
    Duration three = Duration(seconds: 3);

    // this is temporary. Will replace with another way
    // to move to Screen.

    // Needed to add a delay to let flutter draw the splash page
    await Future.delayed(three, (){Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) {
          return Screen();
        },
      ),
    );});
    
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Cloudy'),
          backgroundColor: Colors.blueGrey,
        ),
        body: Center(
            child: SpinKitRipple(
          color: Colors.white,
          size: 900,
        )));
  }
}
