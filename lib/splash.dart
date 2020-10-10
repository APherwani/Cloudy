import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class SplashPage extends StatefulWidget {
  @override
  _SplashPageState createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {

  @override
  void initState() {
    super.initState();
    getWeatherInfo();
  }

  void getWeatherInfo(){
    // TODO
    // grab weather info from api
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Cloudy'),
          backgroundColor: Colors.blueGrey,
        ),
        body: SafeArea(
          child: Center(
              child: SpinKitRipple(
            color: Colors.white,
            size: 900,
          )),
        ));
  }
}
