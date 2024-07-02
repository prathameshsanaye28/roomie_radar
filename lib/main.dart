import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:roomie_radar/views/splash_screen/splash_screen.dart';
import 'package:roomie_radar/views/search/adopt_home.dart';

void main () async {

  WidgetsFlutterBinding.ensureInitialized();
  Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
            seedColor: const Color.fromARGB(255, 10, 49, 112)),
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
        textTheme: GoogleFonts.oswaldTextTheme(),
      ),
      home: SplashScreen(),
      
    );
  }
}

/*class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      // Initialize FlutterFire
      future: Firebase.initializeApp(),
      builder: (context, snapshot) {
        // Check for errors
        if (snapshot.hasError) {
          print('Some error');
        }

        // Once complete, show your application
        if (snapshot.connectionState == ConnectionState.done) {
          return const SplashScreen();
        }

        // Otherwise, show something whilst waiting for initialization to complete
        return const SplashScreen();
      },
    );
  }
}*/