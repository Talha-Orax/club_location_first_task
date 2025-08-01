import 'package:club_location_first_task/view/book_court_screen/find_club_screen.dart';
import 'package:club_location_first_task/view/community_screen/community_screen.dart';
import 'package:club_location_first_task/view/events_screen/events_screen.dart';
import 'package:club_location_first_task/view/matches_screen/match_screen.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int currentindex = 0;

  // List of all screens to display
  final List<Widget> _screens = const [
    FindClubScreen(),
    FindMatches(),
    EventsScreen(),
    CommunityScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // Show the selected screen based on the current index with animation
      body: IndexedStack(
        index: currentindex,
        children: _screens,
      ),
      // Bottom Navigation //
      bottomNavigationBar: NavigationBar(
        onDestinationSelected: (value) {
          setState(() {
            currentindex = value;
          });
        },

        backgroundColor: Colors.white,
        destinations: const [
          NavigationDestination(
            icon: Icon(Icons.confirmation_num_outlined),
            label: "Book Court",
          ),
          NavigationDestination(
            icon: Icon(Icons.sports_tennis_rounded),
            label: "Matches",
          ),
          NavigationDestination(
              icon: Icon(Icons.calendar_month_outlined), label: "Events"),
          NavigationDestination(
              icon: Icon(Icons.diversity_3_sharp), label: "Community"),
        ],
        elevation: 2, // Add a subtle shadow
        height: 65, // Set a specific height for the navigation bar
        selectedIndex: currentindex,
        // labelBehavior: NavigationDestinationLabelBehavior.onlyShowSelected,
        animationDuration:
            const Duration(milliseconds: 500), // Smooth animation
        indicatorColor: const Color.fromARGB(62, 235, 149, 69),
      ),
    );
  }
}
