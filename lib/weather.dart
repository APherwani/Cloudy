import 'package:cloudy/location.dart';
import 'package:http/http.dart';
import 'dart:convert';

const String _apiKey = '2a2ce2489341ecb5e10e6ddaa8479171';

class Weather {
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

  Future<dynamic> getCity() async {
    String _cityURL = 'https://api.openweathermap.org/data/2.5/weather';
    Location location = Location();
    await location.trackLocation();
    String url =
        '$_cityURL?lat=${location.getLatitude()}&lon=${location.getLongitude()}&appid=$_apiKey&units=metric';
    Response response = await get(url);
    String data = response.body;
    var decoded = jsonDecode(data);
    return decoded;
  }
}
