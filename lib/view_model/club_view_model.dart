import 'package:flutter/material.dart';
import 'package:club_location_first_task/model/club_data_model.dart';
import 'package:club_location_first_task/model/api_calling.dart';
import 'package:club_location_first_task/view_model/fetch_distance.dart';
import 'package:club_location_first_task/model/filter_model.dart';

class ClubViewModel extends ChangeNotifier {
  final ApiService _apiService = ApiService();

  // State variables
  //these are Private variables so no one directly access them, to access them we used getter functions
  DataContainer? _dataContainer;
  bool _isLoading = false;
  String? _error;
  FilterModel? currentFilters; // Store current active filters
  bool hasFiltersApplied = false; // Track if filters are active
  double? customLatitude; // Custom latitude for user-defined location
  double? customLongitude; // Custom longitude for user-defined location
  String? currentLocationName;
  bool usingCustomLocation = false; // Track if custom location is used

  // Getters functions to access variables
  List<ClubDataModel> get clubs => _dataContainer?.locations ?? [];
  bool get isLoading => _isLoading;
  String? get error => _error;

  // Load clubs from API
  Future<void> fetchClubs() async {
    try {
      _isLoading = true;
      _error = null;
      notifyListeners();

      _dataContainer = await _apiService.fetchLocations();

      _isLoading = false;
      notifyListeners();
    } catch (e) {
      _error = e.toString();
      _isLoading = false;
      notifyListeners();
    }
  }

//set custom location
  Future<void> setCustomLocation(
      {required double latitude,
      required double longitude,
      required String locationName}) async {
    customLatitude = latitude;
    customLongitude = longitude;
    currentLocationName = locationName;
    usingCustomLocation = true; // Mark that we are using a custom location
    notifyListeners();
  }

  // Reset to default location
  Future<void> resetToUserLocation() async {
    customLatitude = null;
    customLongitude = null;
    currentLocationName =
        await FetchDistance.showCurrentPosition(); // Reset to default name
    usingCustomLocation = false; // Mark that we are not using a custom location
    notifyListeners();
  }

// Get unique cities from all clubs
  List<String> get uniqueCities {
    Set<String> citySet = {};
    for (var club in clubs) {
      if (club.city.isNotEmpty) {
        citySet.add(club.city);
      }
    }
    return citySet.toList()..sort(); // Return sorted list
  }

// Get unique countries/states from all clubs
  List<String> get uniqueStates {
    Set<String> stateSet = {};
    for (var club in clubs) {
      if (club.state.isNotEmpty) {
        stateSet.add(club.state);
      }
    }
    return stateSet.toList()..sort(); // Return sorted list
  }

// Apply filters to the club list
  Future<void> applyFilters(FilterModel filter) async {
    try {
      _isLoading = true;
      notifyListeners();

      // Get filtered Data
      _dataContainer = await _apiService.fetchfilteredLocations(filter);

      // filter clubs based on distance if specified
      if (filter.distance != null && _dataContainer != null) {
        double? maxdistance = double.tryParse(filter.distance!);
        if (maxdistance == null) {
          throw FormatException("Invalid distance value: ${filter.distance}");
          // check which type of maxdistance we are getting
        }

        // Filter clubs based on distance
        List<ClubDataModel> filteredClubs;
        if (usingCustomLocation && customLatitude != null && customLongitude != null) {
          // Use custom location coordinates if available
          filteredClubs = await filterClubsByDistance(
            _dataContainer!.locations,
            maxdistance,
            startLat: customLatitude,
            startLng: customLongitude,
          );
        } else {
          // Use default device location
          filteredClubs = await filterClubsByDistance(
            _dataContainer!.locations,
            maxdistance,
          );
        }

        print('Found ${filteredClubs.length} clubs within $maxdistance km');
        _dataContainer = DataContainer(locations: filteredClubs);
        print('Filtered clubs: ${_dataContainer!.locations.length}');
      }
      // If distance filter is not applied, use the original data
      currentFilters = filter; // Store the applied filters
      hasFiltersApplied = true; // Mark filters as applied
      _isLoading = false;
      notifyListeners();
    } catch (e) {
      _isLoading = false;
      notifyListeners();
      rethrow;
    }
  }

// Reset filters to show all clubs
  Future<void> resetFilters() async {
    try {
      _isLoading = true;
      notifyListeners();
      _dataContainer = await _apiService.fetchLocations();
      currentFilters = null; // Clear the applied filters
      hasFiltersApplied = false; // Mark filters as not applied
      _isLoading = false;
      notifyListeners();
    } catch (e) {
      _error = e.toString();
      notifyListeners();
      return;
    }
  }

  // Get club by ID
  ClubDataModel? getClubById(int masterId) {
    if (_dataContainer == null) return null;

    try {
      return clubs.firstWhere((club) => club.masterId == masterId);
    } catch (e) {
      return null;
    }
  }

  // Search clubs by name
  List<ClubDataModel> searchClubs(String query) {
    return clubs
        .where((club) => club.name.toLowerCase().contains(query.toLowerCase()))
        .toList();
  }

  // Filter clubs by city
  List<ClubDataModel> filterByCity(String city) {
    return clubs
        .where((club) => club.city.toLowerCase() == city.toLowerCase())
        .toList();
  }

  ///
  // Get available facilities across all clubs
  Set<String> get availableFacilities {
    // Create an empty Set to store unique facilities
    Set<String> allFacilities = {};

    // Go through each club
    for (var club in clubs) {
      // Split the facilities string into a list
      List<String> clubFacilities = club.facilities.split(',');

      // Add only non-empty facilities to our set
      for (var facility in clubFacilities) {
        if (facility.isNotEmpty) {
          allFacilities.add(facility);
        }
      }
    }
    // this is the final list of non empty facilities
    return allFacilities;
  }

  ///
  // Filter clubs by facility
  List<ClubDataModel> filterByFacility(String facility) {
    return clubs
        .where((club) =>
            club.facilities.toLowerCase().contains(facility.toLowerCase()))
        .toList();
  }

  // Get distance for a club
  Future<double> getClubDistance(ClubDataModel club) async {
    try {
      // safely parse latitude and longitude
      double? lat = double.tryParse(club.latitude);
      double? lng = double.tryParse(club.longitude);

      //return 0.0 if coordinates are invalid
      if (lat == null || lng == null) {
        return 0.0;
      }
      // Calculate distance using Haversine formula
      double distance;
      if (usingCustomLocation &&
          customLatitude != null &&
          customLongitude != null) {
        // Use custom location if available
        distance = await FetchDistance.calculateDistance(
          startLat: customLatitude,
          startLng: customLongitude,
          targetLat: lat,
          targetLng: lng,
        );
      } else {
        // Use current device location
        distance = await FetchDistance.calculateDistance(
          targetLat: lat,
          targetLng: lng,
        );
      }
      // Round to one decimal place
      return double.parse(distance.toStringAsFixed(1));
    } catch (e) {
      print('Error calculating distance: "${club.name}" $e');
      return 0.0;
    }
  }

  // Get distances for all clubs
  Future<Map<int, double>> getAllClubDistances() async {
    Map<int, double> distances = {};

    for (var club in clubs) {
      double distance = await getClubDistance(club);
      print(distance);
      distances[club.masterId] = distance;
    }

    return distances;
  }
}

// Filter clubs by distance radius
Future<List<ClubDataModel>> filterClubsByDistance(
    List<ClubDataModel> clubs, double maxDistance, {double? startLat, double? startLng}) async {
  List<ClubDataModel> filteredClubs = [];

  for (var club in clubs) {
    try {
      // Parse latitude and longitude safely
      double? lat = double.tryParse(club.latitude);
      double? lng = double.tryParse(club.longitude);

      // skip clubs with invalid coordinates
      if (lat == null || lng == null) {
        continue;
      }

      // Calculate distance
      double distance;
      if (startLat != null && startLng != null) {
        // Use provided starting coordinates
        distance = await FetchDistance.calculateDistance(
          startLat: startLat,
          startLng: startLng,
          targetLat: lat,
          targetLng: lng,
        );
      } else {
        // Use device location
        distance = await FetchDistance.calculateDistance(
          targetLat: lat,
          targetLng: lng,
        );
      }

      if (distance <= maxDistance) {
        filteredClubs.add(club);
      }
    } catch (e) {
      print('Error calculating distance for club ${club.name}: $e');
      continue; // Skip this club if there's an error
    }
  }
  print('Filtering ${clubs.length} clubs by distance (max: $maxDistance km)');

  return filteredClubs;
}
