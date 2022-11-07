import 'package:finleprojectflutter/firebase_options.dart';
import 'package:finleprojectflutter/screen/home_screen.dart';
import 'package:finleprojectflutter/screen/login_screen.dart';
import 'package:finleprojectflutter/screen/sigupscreen.dart';
import 'package:finleprojectflutter/screen/test_screen.dart';
import 'package:finleprojectflutter/screen/uplode_scrssn.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SigupScreen(),
      theme: ThemeData(
          textTheme:
              GoogleFonts.josefinSansTextTheme(Theme.of(context).textTheme),
          primarySwatch: Colors.blue,
          visualDensity: VisualDensity.adaptivePlatformDensity),
    );
  }
}
