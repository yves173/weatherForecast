import 'dart:io';

import 'package:flutter/material.dart';
import 'package:weatherforest/screens/location_screen.dart';
import 'package:weatherforest/services/locateweather.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class LoadingScreen extends StatefulWidget {
  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  @override
  initState() {
    super.initState();
    getAvailableWeather();
  }

  Future<void> getAvailableWeather() async {
    //Get the current location
    dynamic result = await allocatedWeathers.climateLocationsByCoordinate();
    if (result != null) {
      int id = result['weather'][0]['id'];
      int temp = ((result['main']['temp']) * (9 / 5) + 32).toInt();
      String city = result['name'];
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) {
            return LocationScreen(
              locationData: result,
            );
          },
        ),
      );
    } else {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) {
            return LocationScreen(
              locationData: null,
            );
          },
        ),
      );
    }
  }

  AllocatedWeathers allocatedWeathers = AllocatedWeathers();
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SpinKitSpinningLines(
          color: Colors.white,
          size: 100.0,
        ),
      ),
    );
  }
}
