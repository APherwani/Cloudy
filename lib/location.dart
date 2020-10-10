import 'package:geolocator/geolocator.dart';

class Location {
  double _latitude, _longitude;

  Location() {
    trackLocation();
  }
  Future<void> trackLocation() async {
    Position position =
        await getCurrentPosition(desiredAccuracy: LocationAccuracy.low);
    _latitude = position.latitude;
    _longitude = position.longitude;
  }

  double getLatitude() {
    return _latitude;
  }

  double getLongitude() {
    return _longitude;
  }
}
