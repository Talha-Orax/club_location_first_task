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
  bool _loadingDistances = false;
  String _currentLocation = "Loading location..."; // Add this line

  Future<void> _loadDistances() async {
    if (mounted) {
      setState(() {
        _loadingDistances = true;
      });

      try {
        final clubViewModel = context.read<ClubViewModel>();
        _clubDistances = await clubViewModel.getAllClubDistances();
      } catch (e) {
        print('Error loading distances: $e');
      } finally {
        if (mounted) {
          setState(() {
            _loadingDistances = false;
          });
        }
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
                Text('Loading clubs...'),
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
          body: Padding(
            padding: const EdgeInsets.only(left: 15, top: 40, right: 15),
            child: Container(
                child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text("Find a Club",
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 30)),
                        Row(
                          children: [
                            Icon(Icons.location_on_outlined),
                            Text(
                              _currentLocation,
                            ),
                          ],
                        )
                      ],
                    ),
                    const SizedBox(
                      width: 40,
                    ),
                    InkWell(
                      borderRadius: BorderRadius.circular(16),
                      onTap: () {},
                      child: Container(
                        padding: const EdgeInsets.all(14),
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.grey),
                          borderRadius: BorderRadius.circular(16),
                        ),
                        child: const Icon(Icons.search),
                      ),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    InkWell(
                      borderRadius: BorderRadius.circular(16),
                      onTap: () {},
                      child: Container(
                        padding: const EdgeInsets.all(14),
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.grey),
                          borderRadius: BorderRadius.circular(16),
                        ),
                        child: const Icon(Icons.filter_alt_outlined),
                      ),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    const CircleAvatar(
                      radius: 28,
                      backgroundImage: NetworkImage(
                          'https://img.icons8.com/external-flat-circle-design-circle/66/external-Profile-Avatar-web-and-networking-flat-circle-design-circle.png'),
                    )
                  ],
                ),
                const SizedBox(height: 20),
                const Text(
                  "Nearby Clubs",
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.w400),
                ),
                const SizedBox(height: 10),
                Expanded(
                  child: Container(
                    child: CardListWidget(
                      data: viewModel.clubs
                          .map((club) => {
                                'title': club.name.length > 15
                                    ? "${club.name.substring(0, 15)}..."
                                    : club.name,
                                'subtitle': club.state.length > 12
                                    ? "${club.state.substring(0, 12)}..."
                                    : club.state,
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
                                        facilityIcons
                                            .add(FontAwesomeIcons.personDress);
                                        break;
                                      case 'food':
                                        facilityIcons
                                            .add(FontAwesomeIcons.pizzaSlice);
                                        break;
                                      case 'drinks':
                                        facilityIcons.add(FontAwesomeIcons
                                            .martiniGlassCitrus);
                                        break;
                                      case 'alcohol':
                                        facilityIcons
                                            .add(FontAwesomeIcons.wineBottle);
                                        break;
                                      case 'parking':
                                        facilityIcons.add(
                                            FontAwesomeIcons.squareParking);
                                        break;
                                      case 'pool':
                                        facilityIcons.add(
                                            FontAwesomeIcons.personSwimming);
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
                                'distance':
                                    _clubDistances[club.masterId] ?? 0.0,
                                'logo': club.logo,
                                'image': club.locationImage1,
                              })
                          .toList(),
                    ),
                  ),
                )
              ],
            )),
          ),
        );
      },
    );
  }
}
