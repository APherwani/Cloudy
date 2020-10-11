import 'package:flutter/material.dart';

class Display extends StatefulWidget {
  Display({this.weatherInfo});
  final weatherInfo;
  @override
  _DisplayState createState() => _DisplayState();
}

class _DisplayState extends State<Display> {

  Color background = Colors.blueGrey;

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
              textOutput('Orlando, FL'),
              textOutput('90°'),
              textOutput('Insert Emoji here'),
              
            ],
          ),
        ),
      ),
    );
  }
}
