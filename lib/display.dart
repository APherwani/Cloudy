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
      print('$temp');
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
              textOutput('Insert Emoji here'),
              RaisedButton(onPressed: (){
                updateInfo(widget.weatherInfo);
              }),
              Row(
                children: [
                  textOutput('${temp.toInt()} °F'),
                  textOutput('${temp.toInt()} °F'),
                  textOutput('${temp.toInt()} °F'),
                  textOutput('${temp.toInt()} °F'),
                  textOutput('${temp.toInt()} °F'),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
