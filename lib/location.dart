import 'package:geolocator/geolocator.dart';

class Location {
  double _latitude, _longitude;

  Future<void> trackLocation() async {
    Position position =
        await getCurrentPosition(desiredAccuracy: LocationAccuracy.low);
    _latitude = position.latitude;
    _longitude = position.longitude;
  }

  int getLatitude() {
    return _latitude.toInt();
  }

  int getLongitude() {
    return _longitude.toInt();
  }
}
