import 'package:club_location_first_task/view/home_screen.dart';
import 'package:club_location_first_task/view_model/club_view_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter/services.dart';

void main() async {
  // Ensure Flutter is initialized
  WidgetsFlutterBinding.ensureInitialized();

  // Set preferred orientations
  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);

  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => ClubViewModel(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          textTheme: const TextTheme(
            bodyMedium: TextStyle(fontSize: 14.0),
            bodyLarge: TextStyle(fontSize: 16.0),
            titleMedium: TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold),
            titleLarge: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
          ),
        ),
        home: const HomeScreen(),
      ),
    );
  }
}
