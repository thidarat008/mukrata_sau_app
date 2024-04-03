import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mukrata_sau_app/views/splash_screen_ui.dart';

void main() {
  runApp(
    MyApp(),
  );
}

//-----------
class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SplashScreenUI(),
      theme: ThemeData(
        textTheme: GoogleFonts.itimTextTheme(
          Theme.of(context).textTheme,
        ),
      ),
    );
  }
}
