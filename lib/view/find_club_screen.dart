import 'package:club_location_first_task/view/card_list.dart';
import 'package:club_location_first_task/view_model/club_view_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class FindClubScreen extends StatefulWidget {
  const FindClubScreen({super.key});

  @override
  State<FindClubScreen> createState() => _FindClubScreenState();
}

class _FindClubScreenState extends State<FindClubScreen> {
  @override
  void initState() {
    super.initState();
    // Load the clubs when the screen is first displayed
    Future.microtask(() {
      context.read<ClubViewModel>().fetchClubs();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<ClubViewModel>(
      builder: (context, viewModel, child) {
        if (viewModel.isLoading) {
          return CircularProgressIndicator();
        }

        if (viewModel.error != null) {
          return Text('Error: ${viewModel.error}');
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
                    const Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text("Find a Club",
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 30)),
                        Row(
                          children: [
                            Icon(Icons.location_on_outlined),
                            Text("Newtwon, USA"),
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
                                'icons': [
                                  // Parse facilities string to determine which icons to show
                                  if (club.facilities.contains('toilets'))
                                    FontAwesomeIcons.toilet,
                                  if (club.facilities.contains('showers'))
                                    FontAwesomeIcons.shower,
                                  if (club.facilities.contains('changerooms'))
                                    FontAwesomeIcons.personDress,
                                  if (club.facilities.contains('food'))
                                    FontAwesomeIcons.pizzaSlice,
                                  if (club.facilities.contains('drinks'))
                                    FontAwesomeIcons.martiniGlassCitrus,
                                  if (club.facilities.contains('alcohol'))
                                    FontAwesomeIcons.wineBottle,
                                  if (club.facilities.contains('parking'))
                                    FontAwesomeIcons.squareParking,
                                  if (club.facilities.contains('pool'))
                                    FontAwesomeIcons.personSwimming,
                                  if (club.facilities.contains('sauna'))
                                    FontAwesomeIcons.soap,
                                ],
                                'check': club.membershipMandatory,
                                'distance':
                                    5.0, // You might want to calculate this based on latitude/longitude
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
