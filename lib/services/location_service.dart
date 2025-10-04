import 'package:geolocator/geolocator.dart';

class LocationService {
  static Future<Stream<Position>> getUserLocation() async {
    bool serviceEnabled;
    LocationPermission permission;

    // Check Location Services
    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      throw Exception("Location services are disabled.");
    }

    // Check Location Permission
    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        throw Exception("Location permission denied.");
      }
    }

    // Check if Permission is Denied forever
    if (permission == LocationPermission.deniedForever) {
      throw Exception("Location permission permanently denied.");
    }

    // If everything is fine, return the position stream
    return await Geolocator.getPositionStream(
      locationSettings: LocationSettings(
        accuracy: LocationAccuracy.high,
        distanceFilter: 1, // update setiap 1 meter bergerak
      ),
    );
  }
}
