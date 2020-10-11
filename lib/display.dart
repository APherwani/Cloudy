import 'package:flutter/material.dart';
import 'weather.dart';

class Display extends StatefulWidget {
  Display({this.weatherInfo});
  final weatherInfo;

  @override
  _DisplayState createState() => _DisplayState();
}

class _DisplayState extends State<Display> {
  Color background;
  Weather weather = Weather();
  var city;
  double temp;
  double d1Max, d2Max, d3Max, d4Max, d5Max;
  double d1Min, d2Min, d3Min, d4Min, d5Min;
  double d1Day, d2Day, d3Day, d4Day, d5Day;
  double h1, h2, h3, h4, h5;
  String condition;

  Widget textOutput(String input) {
    return Expanded(
      child: Container(
        padding: EdgeInsets.all(10),
        child: Text(
          input,
          style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }

  Future<dynamic> getWeather() async {
    var str = await weather.getWeather();
    return str;
  }

  Future<String> getCityName() async {
    Weather weather = Weather();
    var city = await weather.getCity();
    print(city['name']);
    String name = city['name'];
    return name;
  }

  @override
  void initState() {
    super.initState();
    updateInfo(widget.weatherInfo);
  }

  void updateInfo(dynamic weatherInfo) {
    print('in update info');
    setState(() {
      print('in setState');
      if (weatherInfo == null) {
        city = '';
        temp = 0;
      }
      temp = weatherInfo['current']['temp'];
      print('$temp');
      d1Day = weatherInfo['daily'][1]['temp']['day'];
      d2Day = weatherInfo['daily'][2]['temp']['day'];
      d3Day = weatherInfo['daily'][3]['temp']['day'];
      d4Day = weatherInfo['daily'][4]['temp']['day'];
      d5Day = weatherInfo['daily'][5]['temp']['day'];
      d1Min = weatherInfo['daily'][1]['temp']['min'];
      d2Min = weatherInfo['daily'][2]['temp']['min'];
      d3Min = weatherInfo['daily'][3]['temp']['min'];
      d4Min = weatherInfo['daily'][4]['temp']['min'];
      d5Min = weatherInfo['daily'][5]['temp']['min'];
      d1Max = weatherInfo['daily'][1]['temp']['max'];
      d2Max = weatherInfo['daily'][2]['temp']['max'];
      d3Max = weatherInfo['daily'][3]['temp']['max'];
      d4Max = weatherInfo['daily'][4]['temp']['max'];
      d5Max = weatherInfo['daily'][5]['temp']['max'];
      h1 = weatherInfo['hourly'][1]['temp'];
      h2 = weatherInfo['hourly'][2]['temp'];
      h3 = weatherInfo['hourly'][3]['temp'];
      h4 = weatherInfo['hourly'][4]['temp'];
      h5 = weatherInfo['hourly'][5]['temp'];
      condition = weatherInfo['current']['weather'][0]['main'];
      print('$h1');
      // set background color
      int dt = weatherInfo['current']['dt'];
      int sunrise = weatherInfo['current']['sunrise'];
      int sunset = weatherInfo['current']['sunset'];
      if (dt >= sunrise && dt <= sunset) {
        background = Colors.blueAccent;
      }
      background = Colors.redAccent;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              textOutput('${temp.toInt()} °F'),
              //textOutput('${weather['current']['temp']}°'),
              textOutput('Insert Emoji here'),
              Text(
                '5 Hour Forecast',
                style: TextStyle(
                  fontSize: 20,
                ),
              ),
              SizedBox(
                height: 20.0,
                width: double.infinity,
                child: Divider(
                  color: Colors.teal.shade100,
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text('${h1.toInt()}'),
                  Text('${h2.toInt()}'),
                  Text('${h3.toInt()}'),
                  Text('${h4.toInt()}'),
                  Text('${h5.toInt()}'),
                ],
              ),
              SizedBox(height: 100),
              Text(
                '5 Day Forecast',
                style: TextStyle(
                  fontSize: 20,
                ),
              ),
              SizedBox(
                height: 20.0,
                width: double.infinity,
                child: Divider(
                  color: Colors.teal.shade100,
                ),
              ),
              Expanded(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Column(
                      children: [
                        Text('Day: ${d1Day.toInt()}'),
                        Text('Max: ${d1Max.toInt()}'),
                        Text('Min: ${d1Min.toInt()}'),
                      ],
                    ),
                    Column(
                      children: [
                        Text('Day: ${d2Day.toInt()}'),
                        Text('Max: ${d2Max.toInt()}'),
                        Text('Min: ${d2Min.toInt()}'),
                      ],
                    ),
                    Column(
                      children: [
                        Text('Day: ${d3Day.toInt()}'),
                        Text('Max: ${d3Max.toInt()}'),
                        Text('Min: ${d3Min.toInt()}'),
                      ],
                    ),
                    Column(
                      children: [
                        Text('Day: ${d4Day.toInt()}'),
                        Text('Max: ${d4Max.toInt()}'),
                        Text('Min: ${d4Min.toInt()}'),
                      ],
                    ),
                    Column(
                      children: [
                        Text('Day: ${d5Day.toInt()}'),
                        Text('Max: ${d5Max.toInt()}'),
                        Text('Min: ${d5Min.toInt()}'),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
