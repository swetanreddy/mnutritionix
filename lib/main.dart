import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mnutritionix/auth/authenticate.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
          primaryColor: const Color(0xFF4F4F4F),
          textTheme: GoogleFonts.rubikTextTheme(Theme.of(context).textTheme)
      ),
      debugShowCheckedModeBanner: false,
      home: Authenticate(),
    );
  }
}