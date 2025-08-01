import 'package:club_location_first_task/view/book_court_screen/find_club_screen.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});
  final int currentindex = 0;
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: const FindClubScreen(),
      // Bottom Navigation //
      bottomNavigationBar: NavigationBar(
        backgroundColor: Colors.white,
        destinations: const [
          NavigationDestination(
              icon: Icon(Icons.confirmation_num_outlined), label: "Book Court"),
          NavigationDestination(
              icon: Icon(Icons.sports_tennis_rounded), label: "Matches"),
          NavigationDestination(
              icon: Icon(Icons.calendar_month_outlined), label: "Events"),
          NavigationDestination(
              icon: Icon(Icons.diversity_3_sharp), label: "Community"),
        ],
        // height: 10,
        indicatorColor: const Color.fromARGB(103, 185, 129, 108),
      ),
    );
  }
}
