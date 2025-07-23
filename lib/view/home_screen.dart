import 'package:club_location_first_task/view/find_club_screen.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FindClubScreen(),
      // Bottom Navigation //
      bottomNavigationBar: Container(
        padding: const EdgeInsets.symmetric(horizontal: 2),
        child: BottomNavigationBar(
          backgroundColor: Colors.white,
          type: BottomNavigationBarType.fixed,
          unselectedItemColor: Colors.black,
          unselectedFontSize: 14,
          showUnselectedLabels: true,
          selectedFontSize: 15,
          selectedItemColor: Colors.brown,
          selectedIconTheme: const IconThemeData(
            color: Colors.brown,
            size: 30,
          ),
          selectedLabelStyle: const TextStyle(fontWeight: FontWeight.bold),
          onTap: (value) {},
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.confirmation_num_outlined),
              label: "Book Courts",
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.sports_tennis_rounded),
              label: "Matches",
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.calendar_month_outlined),
              label: "Events",
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.diversity_3_sharp),
              label: "Community",
            ),
          ],
        ),
      ),
    );
  }
}
