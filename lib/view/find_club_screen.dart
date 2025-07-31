import 'package:club_location_first_task/model/filter_model.dart';
import 'package:club_location_first_task/view/filter_screen.dart';
import 'package:club_location_first_task/view/search_location_screen.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';

import 'package:club_location_first_task/view/card_list.dart';
import 'package:club_location_first_task/view_model/club_view_model.dart';
import 'package:club_location_first_task/view_model/fetch_distance.dart';

class FindClubScreen extends StatefulWidget {
  const FindClubScreen({super.key});

  @override
  State<FindClubScreen> createState() => _FindClubScreenState();
}

class _FindClubScreenState extends State<FindClubScreen> {
  Map<int, double> _clubDistances = {};
  String _currentLocation = "Loading location...";

  Future<void> _loadDistances() async {
    if (mounted) {
      try {
        final clubViewModel = context.read<ClubViewModel>();
        _clubDistances = await clubViewModel.getAllClubDistances();
      } catch (e) {
        print('Error loading distances: $e');
      }
    }
  }

  @override
  void initState() {
    super.initState();
    // Load the clubs when the screen is first displayed
    Future.microtask(() async {
      await context.read<ClubViewModel>().fetchClubs();
      await _loadDistances();

      // Load current location
      String location = await FetchDistance.showCurrentPosition();
      if (mounted) {
        setState(() {
          _currentLocation = location;
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<ClubViewModel>(
      builder: (context, viewModel, child) {
        if (viewModel.isLoading) {
          return const Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CircularProgressIndicator(),
                SizedBox(height: 16),
              ],
            ),
          );
        }

        if (viewModel.error != null) {
          return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Icon(Icons.error_outline, size: 64, color: Colors.red),
                const SizedBox(height: 16),
                Text('Error: ${viewModel.error}'),
                const SizedBox(height: 16),
                ElevatedButton(
                  onPressed: () => viewModel.fetchClubs(),
                  child: const Text('Retry'),
                ),
              ],
            ),
          );
        }

        return Scaffold(
          backgroundColor: Colors.white,
          body: SafeArea(
            child: Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 12.0, vertical: 8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Header section with fixed layout
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Left side - Title and Location (takes available space)
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              "Find a Club",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 28,
                              ),
                            ),
                            const SizedBox(height: 4),
                            Row(
                              children: [
                                const Icon(Icons.location_on_outlined,
                                    size: 16),
                                const SizedBox(width: 4),
                                Expanded(
                                  child: Text(
                                    viewModel.usingCustomLocation
                                        ? viewModel.currentLocationName ??
                                            "No location selected"
                                        : _currentLocation,
                                    style: const TextStyle(fontSize: 14),
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),

                      // Right side - Icons and Avatar (fixed position)
                      Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          // Search icon
                          IconButton(
                            onPressed: () async {
                              await Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) =>
                                      const SearchLocationScreen(),
                                ),
                              );
                              // Reload distances when returning from search screen
                              _loadDistances();
                              setState(() {});
                            },
                            icon: const Icon(Icons.search),
                            style: IconButton.styleFrom(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(12),
                                side: BorderSide(color: Colors.grey.shade300),
                              ),
                            ),
                          ),
                          const SizedBox(width: 8),
                          // Filter icon
                          IconButton(
                            onPressed: () async {
                              final result =
                                  await showModalBottomSheet<FilterModel?>(
                                context: context,
                                isScrollControlled: true,
                                backgroundColor: Colors.transparent,
                                barrierColor: Colors.black.withOpacity(0.5),
                                useSafeArea: true,
                                builder: (context) => DraggableScrollableSheet(
                                  initialChildSize: 0.7, // Reduced from 0.9
                                  minChildSize: 0.5,
                                  maxChildSize: 0.95,
                                  expand:
                                      false, // Ensures it takes minimum required size
                                  builder: (_, scrollController) => Container(
                                    decoration: const BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.vertical(
                                        top: Radius.circular(35),
                                      ),
                                    ),
                                    padding: const EdgeInsets.symmetric(
                                        vertical: 12.0, horizontal: 15.0),
                                    child: FilterScreen(
                                      initialFilter: viewModel.currentFilters,
                                    ),
                                  ),
                                ),
                              );
                              if (result != null) {
                                // Apply the selected filters
                                try {
                                  await viewModel.applyFilters(result);
                                  if (mounted) {
                                    ScaffoldMessenger.of(context).showSnackBar(
                                      SnackBar(
                                        content: Text(
                                          'Filters applied: ${viewModel.clubs.length} clubs found',
                                        ),
                                        backgroundColor: Colors.green,
                                        duration: const Duration(seconds: 2),
                                      ),
                                    );
                                  }
                                } catch (e) {
                                  if (mounted) {
                                    print(viewModel.applyFilters(result));
                                    ScaffoldMessenger.of(context).showSnackBar(
                                      SnackBar(
                                        content: Text(
                                            'Error applying filters: ${e.toString()}'),
                                        backgroundColor: Colors.red,
                                        duration: const Duration(seconds: 2),
                                      ),
                                    );
                                  }
                                }
                              }
                            },
                            icon: const Icon(Icons.filter_alt_outlined),
                            style: IconButton.styleFrom(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(12),
                                side: BorderSide(color: Colors.grey.shade300),
                              ),
                            ),
                          ),
                          const SizedBox(width: 8),
                          // Profile avatar
                          const CircleAvatar(
                            radius: 25,
                            backgroundImage: NetworkImage(
                                'https://img.icons8.com/external-flat-circle-design-circle/66/external-Profile-Avatar-web-and-networking-flat-circle-design-circle.png'),
                          ),
                        ],
                      ),
                    ],
                  ),

                  const SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        "Nearby Clubs",
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.w500),
                      ),
                      if (context.watch<ClubViewModel>().hasFiltersApplied)
                        TextButton.icon(
                          onPressed: () async {
                            await context.read<ClubViewModel>().resetFilters();
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                content: Text(
                                  'Filters cleared',
                                  style: TextStyle(fontWeight: FontWeight.w500),
                                ),
                                backgroundColor:
                                    Color.fromARGB(255, 219, 136, 28),
                                duration: Duration(seconds: 2),
                              ),
                            );
                          },
                          icon: const Icon(Icons.filter_alt_off_outlined,
                              size: 12),
                          label: const Text('Clear Filters',
                              style: TextStyle(
                                  fontSize: 12,
                                  fontWeight: FontWeight.w500,
                                  color: Colors.orange)),
                          style: TextButton.styleFrom(
                              foregroundColor: Colors.orange),
                        ),
                    ],
                  ),
                  const SizedBox(height: 12),

                  // Club list
                  FutureBuilder<Map<int, double>>(
                    future: viewModel.getAllClubDistances(),
                    builder: (context, snapshot) {
                      // Use the latest distances if available, otherwise use the cached ones
                      final Map<int, double> distances =
                          snapshot.data ?? _clubDistances;

                      // Update the cached distances if new data is available
                      if (snapshot.hasData) {
                        _clubDistances = snapshot.data!;
                      }

                      return Expanded(
                        child: CardListWidget(
                          data: viewModel.clubs
                              .map((club) => {
                                    'title': club.name,
                                    'subtitle': club.state,
                                    'icons': () {
                                      // Use switch case to determine icons based on facilities
                                      List<IconData> facilityIcons = [];

                                      // Split the facilities string into individual facilities
                                      List<String> facilitiesList =
                                          club.facilities.split(',');

                                      for (String facility in facilitiesList) {
                                        String trimmed = facility.trim();
                                        switch (trimmed) {
                                          case 'toilets':
                                            facilityIcons
                                                .add(FontAwesomeIcons.toilet);
                                            break;
                                          case 'showers':
                                            facilityIcons
                                                .add(FontAwesomeIcons.shower);
                                            break;
                                          case 'changerooms':
                                            facilityIcons.add(
                                                FontAwesomeIcons.personDress);
                                            break;
                                          case 'food':
                                            facilityIcons.add(
                                                FontAwesomeIcons.pizzaSlice);
                                            break;
                                          case 'drinks':
                                            facilityIcons.add(FontAwesomeIcons
                                                .martiniGlassCitrus);
                                            break;
                                          case 'alcohol':
                                            facilityIcons.add(
                                                FontAwesomeIcons.wineBottle);
                                            break;
                                          case 'parking':
                                            facilityIcons.add(
                                                FontAwesomeIcons.squareParking);
                                            break;
                                          case 'pool':
                                            facilityIcons.add(FontAwesomeIcons
                                                .personSwimming);
                                            break;
                                          case 'sauna':
                                            facilityIcons
                                                .add(FontAwesomeIcons.soap);
                                            break;
                                        }
                                      }

                                      return facilityIcons;
                                    }(),
                                    'check': club.membershipMandatory,
                                    'distance': distances[club.masterId] ?? 0.0,
                                    'logo': club.logo,
                                    'image': club.locationImage1,
                                  })
                              .toList(),
                        ),
                      );
                    },
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
