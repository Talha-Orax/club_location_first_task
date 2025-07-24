import 'package:club_location_first_task/view/card_list.dart';
import 'package:flutter/material.dart';

class FindClubScreen extends StatelessWidget {
  const FindClubScreen({super.key});

  @override
  Widget build(BuildContext context) {
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
                child: const CardListWidget(
                  data: [
                    {
                      'title': 'LDA Tennis',
                      'subtitle': 'Arizona',
                      'icons': [Icons.local_parking, Icons.wifi, Icons.lock],
                      'check': true,
                      'distance': 2.7,
                      'logo':
                          "https://img.icons8.com/external-flat-circle-design-circle/66/external-Profile-Avatar-web-and-networking-flat-circle-design-circle.png",
                    },
                    {
                      'title': 'Padel Box',
                      'subtitle': 'Arizona',
                      'icons': [
                        Icons.local_parking,
                        Icons.wifi,
                        Icons.shower_outlined
                      ],
                      'check': true,
                      'distance': 4.5,
                      'logo':
                          "https://img.icons8.com/external-flat-circle-design-circle/66/external-Profile-Avatar-web-and-networking-flat-circle-design-circle.png",
                    },
                    {
                      'title': 'LDA Tennis',
                      'subtitle': 'Arizona',
                      'icons': [Icons.local_parking, Icons.wifi, Icons.lock],
                      'check': true,
                      'distance': 4.2,
                      'logo':
                          "https://img.icons8.com/external-flat-circle-design-circle/66/external-Profile-Avatar-web-and-networking-flat-circle-design-circle.png",
                    },
                    {
                      'title': 'LDA Tennis',
                      'subtitle': 'Arizona',
                      'icons': [Icons.local_parking, Icons.wifi, Icons.lock],
                      'check': false,
                      'distance': 9.4,
                      'logo':
                          "https://img.icons8.com/external-flat-circle-design-circle/66/external-Profile-Avatar-web-and-networking-flat-circle-design-circle.png",
                    },
                    {
                      'title': 'LDA Tennis',
                      'subtitle': 'Arizona',
                      'icons': [
                        Icons.local_parking,
                        Icons.local_parking,
                        Icons.wifi,
                        Icons.lock
                      ],
                      'check': true,
                      'distance': 3.8,
                      'logo':
                          "https://img.icons8.com/external-flat-circle-design-circle/66/external-Profile-Avatar-web-and-networking-flat-circle-design-circle.png",
                    },
                    {
                      'title': 'LDA Tennis',
                      'subtitle': 'Arizona',
                      'icons': [Icons.local_parking, Icons.wifi, Icons.lock],
                      'check': true,
                      'distance': 2.7,
                      'logo':
                          "https://img.icons8.com/external-flat-circle-design-circle/66/external-Profile-Avatar-web-and-networking-flat-circle-design-circle.png",
                    },
                  ],
                ),
              ),
            )
          ],
        )),
      ),
    );
  }
}
