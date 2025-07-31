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

  // Calculate distance between coordinates
  // If startLat and startLng are provided, use them as the starting point
  // Otherwise, use the current device location as the starting point
  static Future<double> calculateDistance({
    double? startLat,
    double? startLng,
    required double? targetLat,
    required double? targetLng,
  }) async {
    if (targetLat == null || targetLng == null) return 0.0;

    // If starting coordinates are provided, use them directly
    if (startLat != null && startLng != null) {
      // Use the haversine formula with the provided coordinates
      return _calculateHaversineDistance(
        startLat: startLat,
        startLng: startLng,
        endLat: targetLat,
        endLng: targetLng,
      );
    }

    // Otherwise, get current device location
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

    // Use the current position as the starting point
    return _calculateHaversineDistance(
      startLat: position.latitude,
      startLng: position.longitude,
      endLat: targetLat,
      endLng: targetLng,
    );
  }

  // Helper function to calculate distance using the Haversine formula
  static double _calculateHaversineDistance({
    required double startLat,
    required double startLng,
    required double endLat,
    required double endLng,
  }) {
    double _degreeToRadian(double degree) {
      return degree * pi / 180;
    }

    final double lat1Rad = _degreeToRadian(startLat);
    final double lon1Rad = _degreeToRadian(startLng);
    final double lat2Rad = _degreeToRadian(endLat);
    final double lon2Rad = _degreeToRadian(endLng);

    final double dlat = lat2Rad - lat1Rad;
    final double dlon = lon2Rad - lon1Rad;
    final double a = pow(sin(dlat / 2), 2) +
        cos(lat1Rad) * cos(lat2Rad) * pow(sin(dlon / 2), 2);
    final double c = 2 * atan2(sqrt(a), sqrt(1 - a));

    const double radiusOfEarthKm = 6371.0;
    return radiusOfEarthKm * c;
  }
}
