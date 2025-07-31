import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:club_location_first_task/view_model/club_view_model.dart';

class SearchLocationScreen extends StatefulWidget {
  const SearchLocationScreen({Key? key}) : super(key: key);

  @override
  State<SearchLocationScreen> createState() => _SearchLocationScreenState();
}

class _SearchLocationScreenState extends State<SearchLocationScreen> {
  final TextEditingController _searchController = TextEditingController();
  List<String> _filteredLocations = [];
  List<String> _allLocations = [];
  bool _isSearching = false;

  @override
  void initState() {
    super.initState();
    _loadLocations();
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  void _loadLocations() {
    final clubViewModel = context.read<ClubViewModel>();
    // Extract unique city and country combinations
    Set<String> uniqueLocations = {};

    for (var club in clubViewModel.clubs) {
      // Format: "City, Country"
      String location = "${club.city}, ${club.country}";
      uniqueLocations.add(location);
    }

    setState(() {
      _allLocations = uniqueLocations.toList()..sort();
      _filteredLocations = List.from(_allLocations);
    });
  }

  void _filterSearchResults(String query) {
    if (query.isEmpty) {
      setState(() {
        _filteredLocations = List.from(_allLocations);
        _isSearching = false;
      });
    } else {
      List<String> searchResults = _allLocations
          .where((location) =>
              location.toLowerCase().contains(query.toLowerCase()))
          .toList();

      setState(() {
        _filteredLocations = searchResults;
        _isSearching = true;
      });
    }
  }

  void _onLocationSelected(String location) async {
    final viewModel = context.read<ClubViewModel>();
    // Find a club in this city to get coordinates
    final locationClub = viewModel.clubs.firstWhere(
      (club) => "${club.city}, ${club.country}" == location,
      orElse: () => viewModel.clubs.first, // Fallback
    );

    double? lat = double.tryParse(locationClub.latitude);
    double? lng = double.tryParse(locationClub.longitude);

    if (lat != null && lng != null) {
      // Set the custom location
      await viewModel.setCustomLocation(
        latitude: lat,
        longitude: lng,
        locationName: location,
      );

      // Force recalculation of all club distances
      await viewModel.getAllClubDistances();

      if (mounted) {
        Navigator.pop(context);
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Location updated to $location'),
            backgroundColor: Colors.green,
            duration: const Duration(seconds: 1),
          ),
        );
      }
    } else {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Could not find coordinates for $location'),
            backgroundColor: Colors.red,
          ),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        leading: IconButton(
          highlightColor: Colors.transparent,
          padding: const EdgeInsets.only(left: 16.0),
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.of(context).pop(),
        ),
        backgroundColor: Colors.white,
        elevation: 0,
        leadingWidth: 35,
        title: Container(
          height: 48,
          decoration: BoxDecoration(
            border: Border.all(color: Colors.grey.shade300),
            borderRadius: BorderRadius.circular(12),
          ),
          child: TextField(
            controller: _searchController,
            autofocus: true,
            decoration: InputDecoration(
              border: InputBorder.none,
              prefixIcon: const Icon(Icons.search, color: Colors.grey),
              hintText: 'Search Location',
              suffixIcon: _searchController.text.isNotEmpty
                  ? IconButton(
                      icon: const Icon(Icons.clear, color: Colors.grey),
                      onPressed: () {
                        _searchController.clear();
                        _filterSearchResults('');
                      },
                    )
                  : null,
            ),
            onChanged: _filterSearchResults,
          ),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 8.0),
            child: IconButton(
              onPressed: () async {
                final viewModel = context.read<ClubViewModel>();
                await viewModel.resetToUserLocation();

                // Force recalculation of all club distances
                await viewModel.getAllClubDistances();

                if (mounted) {
                  Navigator.pop(context);
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text('Reset to your current location'),
                      backgroundColor: Colors.blue,
                      duration: Duration(seconds: 1),
                    ),
                  );
                }
              },
              icon: const Icon(Icons.near_me_outlined),
              style: IconButton.styleFrom(
                side: BorderSide(color: Colors.grey.shade300),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
            ),
          ),
        ],
      ),
      body: ListView.separated(
        itemCount: _filteredLocations.length,
        separatorBuilder: (context, index) =>
            const Divider(height: 1, indent: 16, endIndent: 16),
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(_filteredLocations[index]),
            trailing: const Icon(Icons.call_made, color: Colors.grey, size: 20),
            onTap: () => _onLocationSelected(_filteredLocations[index]),
          );
        },
      ),
    );
  }
}
