import 'package:geolocator/geolocator.dart';

class GeolocatorPosition {
  double? altitude;
  double? longitude;
  Future<void> getcurrentLocation() async {
    try {
      Position position = await Geolocator.getCurrentPosition(
          desiredAccuracy: LocationAccuracy.low);
      altitude = position.latitude;
      longitude = position.longitude;
      print('permission granted $altitude, $longitude');
    } catch (e) {
      print("Error: $e ");
      print('permission denied on latitude $altitude and longitude $longitude');
    }
  }
}
