// ignore: depend_on_referenced_packages
import 'dart:math';

import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';

class FetchDistance {
  static Future<String> showCurrentPosition() async {
    // Check permissions and location service
    bool serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      return 'Location services disabled';
    }

    LocationPermission permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        return 'Location permission denied';
      }
    }

    if (permission == LocationPermission.deniedForever) {
      return 'Location permissions denied permanently';
    }

    // Get current position
    try {
      Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high,
      );

      List<Placemark> placemarks =
          await placemarkFromCoordinates(position.latitude, position.longitude);

      return placemarks.isNotEmpty
          ? '${placemarks[0].locality}, ${placemarks[0].country}'
          : 'Unknown location';
    } catch (e) {
      return 'Error getting location';
    }
  }
}

Future<double> calculateDistance(
    {required double? targetLat, required double? targetLng}) async {
  if (targetLat == null || targetLng == null) return 0.0;
  bool serviceEnabled;
  LocationPermission permission;

  // Check if location services are enabled
  serviceEnabled = await Geolocator.isLocationServiceEnabled();
  if (!serviceEnabled) {
    return Future.error('Location services are disabled.');
  }

  // Request permission
  permission = await Geolocator.checkPermission();
  if (permission == LocationPermission.denied) {
    permission = await Geolocator.requestPermission();
    if (permission == LocationPermission.denied) {
      return Future.error('Location permissions are denied');
    }
  }

  if (permission == LocationPermission.deniedForever) {
    return Future.error('Location permissions are permanently denied.');
  }

  // Get current position
  Position position = await Geolocator.getCurrentPosition(
    desiredAccuracy: LocationAccuracy.high,
  );

  double _degreeToRadian(double degree) {
    return degree * pi / 180;
  }

  double calculateDistance() {
    final double lat1Rad = _degreeToRadian(position.latitude);
    final double lon1Rad = _degreeToRadian(position.longitude);
    final double lat2Rad = _degreeToRadian(targetLat);
    final double lon2Rad = _degreeToRadian(targetLng);

    final double dlat = lat2Rad - lat1Rad;
    final double dlon = lon2Rad - lon1Rad;
    final double a = pow(sin(dlat / 2), 2) +
        cos(lat1Rad) * cos(lat2Rad) * pow(sin(dlon / 2), 2);
    final double c = 2 * atan2(sqrt(a), sqrt(1 - a));

    const double radiusOfEarthKm = 6371.0;
    return radiusOfEarthKm * c;
  }

  return calculateDistance();
}
