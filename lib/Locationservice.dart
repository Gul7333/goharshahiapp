import 'dart:async';

import 'package:geolocator/geolocator.dart';


class LocationService {
  // Request location permission
  static Future<bool> requestPermission() async {

    LocationPermission permission = await Geolocator.checkPermission();

    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        return false; // Permission denied
      }
    }

    if (permission == LocationPermission.deniedForever) {
      return false; // Permission permanently denied
    }

    return true; // Permission granted
  }

static Future<Position?> getLastKnownPosition()  {
  return Geolocator.getLastKnownPosition();
}
  /// Checks if location services are enabled
  static Future<bool> isLocationServiceEnabled() async {
    bool enabled = await Geolocator.isLocationServiceEnabled();
      // Test if location services are enabled.
  if (!enabled) {
    // Location services are not enabled don't continue
    await Geolocator.openLocationSettings();
    // return false;
  }
  return Geolocator.isLocationServiceEnabled();
  }

  // Get the user's current location
  static Future<Position?> getCurrentLocation() async {

    try {
      
  
    bool serviceEnabled = await Geolocator.isLocationServiceEnabled();

    if (!serviceEnabled) {
      return null; // Location services are disabled
    }

    if (!await requestPermission()) {
      return null; // Permission not granted
    }    

    return await Geolocator.getCurrentPosition(
      locationSettings: const LocationSettings(
        accuracy: LocationAccuracy.lowest,
        timeLimit: Duration(seconds: 12),
      )
    );
    } on TimeoutException {
      return null;
      } catch (e) {
      return null;
    }
  }


  // Save the current location
 
}
