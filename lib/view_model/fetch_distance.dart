// ignore: depend_on_referenced_packages
import 'package:geolocator/geolocator.dart';

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
      locationSettings: const LocationSettings(
          accuracy: LocationAccuracy.high, distanceFilter: 100));

  // Calculate distance in meters
  double distanceInMeters = Geolocator.distanceBetween(
    position.latitude,
    position.longitude,
    targetLat,
    targetLng,
  );

  // Optionally convert to kilometers
  return distanceInMeters / 1000;
}
