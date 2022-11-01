import 'package:weatherforest/services/location.dart';
import 'package:weatherforest/services/networking.dart';

class AllocatedWeathers {
  Future<dynamic> climateLocationsByCoordinate() async {
    GeolocatorPosition geolocatorPosition = GeolocatorPosition();
    await geolocatorPosition.getcurrentLocation();
    if (geolocatorPosition.altitude == null ||
        geolocatorPosition.longitude == null) {
      return null;
    } else {
      try {
        return await apiLocation(
            geolocatorPosition.altitude, geolocatorPosition.longitude);
      } catch (e) {
        print('Error $e ');
        return null;
      }
    }
  }

  Future<dynamic> apiLocation(double? latitude, double? longitude) async {
    String url =
        'https://api.openweathermap.org/data/2.5/weather?lat=$latitude&lon=$longitude&appid=0f3443b74f32c79bd91e71cf9aa36596';
    DataFromAPI dataFromAPI = DataFromAPI(url: url);
    return await dataFromAPI.getHttpBody();
  }

  Future<dynamic> cityAPILocation(String cityName) async {
    try {
      String url =
          'https://api.openweathermap.org/data/2.5/weather?q=$cityName&appid=0f3443b74f32c79bd91e71cf9aa36596';
      DataFromAPI dataFromAPI = DataFromAPI(url: url);
      return await dataFromAPI.getHttpBody();
    } catch (e) {
      return null;
    }
  }
}
