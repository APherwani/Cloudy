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
  Weather weather = Weather();
  var city;
  double temp;
  List <int> day = [];
  List <int> min = [];
  List <int> max = [];


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
      if(weatherInfo == null){
        city = '';
        temp = 0;
      }
      //city = getCityName();
      //print(city);
      temp = weatherInfo['current']['temp'];
      //print('$temp');
      for(int i = 1; i <=5; i++){
        day[i] = weatherInfo['daily'][i]['temp']['day'];
        min[i] = weatherInfo['daily'][i]['temp']['min'];
        max[i] = weatherInfo['daily'][i]['temp']['max'];
      }
    });
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
              textOutput('${temp.toInt()} °F'),
              //textOutput('${weather['current']['temp']}°'),
              Row(
                children: [
                  Column(
                    children: [
                      Text(
                        'Day: ${weatherInfo['daily'][1]['temp']['day']}'
                      ),
                      Text(
                        'Min: ${min[1]}'
                      ),
                      Text(
                        'MAx: ${max[1]}'
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      textOutput('${temp.toInt()} °F'),
                    ],
                  ),
                  Column(
                    children: [
                      textOutput('${temp.toInt()} °F'),
                    ],
                  ),
                  Column(
                    children: [
                      textOutput('${temp.toInt()} °F'),
                    ],
                  ),
                  Column(
                    children: [
                      textOutput('${temp.toInt()} °F'),
                    ],
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
