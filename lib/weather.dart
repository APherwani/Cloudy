import 'dart:convert';

import 'package:cloudy/location.dart';
import 'package:http/http.dart';
import 'dart:convert';

class Weather {
  String _apiKey = '2a2ce2489341ecb5e10e6ddaa8479171';
  String _owmURL = 'https://api.openweathermap.org/data/2.5/onecall?';

  Future<dynamic> getWeather() async {
    Location location = Location();
    await location.trackLocation();
    String url =
        "${_owmURL}lat=${location.getLatitude()}&lon=${location.getLongitude()}&exclude=minutely,alerts&units=imperial&appid=$_apiKey";
    Response response = await get(url);
    String data = response.body;
    var decoded = jsonDecode(data);
    return decoded;
  }
}
