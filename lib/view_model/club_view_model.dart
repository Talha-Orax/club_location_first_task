import 'package:flutter/material.dart';
import 'package:club_location_first_task/model/club_data_model.dart';
import 'package:club_location_first_task/model/api_calling.dart';

class ClubViewModel extends ChangeNotifier {
  final ApiService _apiService = ApiService();

  // State variables
  //these are Private variables so no one directyl acces them,to access them we used getter functions
  List<ClubDataModel> _clubs = [];
  bool _isLoading = false;
  String? _error;

  // Getters functions to access variables
  List<ClubDataModel> get clubs => _clubs; //this get the data of the clubs
  bool get isLoading =>
      _isLoading; // this get the info about data loading or not
  String? get error => _error; // throws the error on api calling

  // Load clubs from API
  Future<void> fetchClubs() async {
    try {
      _isLoading = true;
      _error = null;
      notifyListeners();

      _clubs = await _apiService.fetchLocations();

      _isLoading = false;
      notifyListeners();
    } catch (e) {
      _error = e.toString();
      _isLoading = false;
      notifyListeners();
    }
  }

  // Get club by ID
  ClubDataModel? getClubById(int masterId) {
    try {
      return _clubs.firstWhere((club) => club.masterId == masterId);
    } catch (e) {
      return null;
    }
  }

  // Search clubs by name
  List<ClubDataModel> searchClubs(String query) {
    return _clubs
        .where((club) => club.name.toLowerCase().contains(query.toLowerCase()))
        .toList();
  }

  // Filter clubs by city
  List<ClubDataModel> filterByCity(String city) {
    return _clubs
        .where((club) => club.city.toLowerCase() == city.toLowerCase())
        .toList();
  }

  ///
  // Get available facilities across all clubs
  Set<String> get availableFacilities {
    // Create an empty Set to store unique facilities
    Set<String> allFacilities = {};

    // Go through each club
    for (var club in _clubs) {
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
    return _clubs
        .where((club) =>
            club.facilities.toLowerCase().contains(facility.toLowerCase()))
        .toList();
  }
}
