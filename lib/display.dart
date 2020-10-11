import 'package:flutter/material.dart';
import 'weather.dart';

class Display extends StatefulWidget {
  Display({this.weatherInfo});
  final weatherInfo;

  @override
  _DisplayState createState() => _DisplayState();
}

class _DisplayState extends State<Display> {

  Color background = Colors.blueGrey;
  var city;
 Weather weather = Weather();

  Widget textOutput(String input)
  {
    return Expanded(
      child: Container(
        padding: EdgeInsets.all(10),
        child: Text(
          input,
          style: TextStyle(
            fontSize: 40,
            fontWeight: FontWeight.bold
          ),
        ),
      ),
    );
  }

  Future<dynamic> getWeather() async {
    var str = await weather.getWeather();
    return str;
  }

  Future<dynamic> getCityName() async {
    Weather weather = Weather();
    var city = await weather.getCity();
    return city['name'];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Cloudy'),
        backgroundColor: background,
      ),
      body: SafeArea(
              child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              textOutput(getCityName()),
              textOutput('${weather['current']['temp']}°'),
              textOutput('Insert Emoji here'),
              Row(
                children: [
                  // get weather, get city
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
