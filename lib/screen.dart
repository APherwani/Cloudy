import 'package:flutter/material.dart';

class Screen extends StatefulWidget {
  @override
  _ScreenState createState() => _ScreenState();
}

class _ScreenState extends State<Screen> {

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
        backgroundColor: Colors.blueGrey,
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
