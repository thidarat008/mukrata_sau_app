import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:mukrata_sau_app/views/home_ui.dart';

class SplashScreenUI extends StatefulWidget {
  const SplashScreenUI({super.key});

  @override
  State<SplashScreenUI> createState() => _SplashScreenUIState();
}

class _SplashScreenUIState extends State<SplashScreenUI> {
  @override
  void initState() {
    Future.delayed(
      Duration(
        seconds: 3
      ),
      ()=>{
        Navigator.pushReplacement(context,
        MaterialPageRoute(
          builder: (context) => HomeUI(),
        ),
        ),
      }
    );
  }

  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 146, 108, 59),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(15.0),
              child: Image.asset(
              'assets/images/logo.png',
              width: MediaQuery.of(context).size.width *0.7,
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.02,
            ),
            CircularProgressIndicator(
              color: Colors.amber,
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.02,
            ),
            Text(
              'Tech SAU BUFFET',
              style: TextStyle(
                fontSize: MediaQuery.of(context).size.height *0.03,
                color: Colors.amber,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              'Copyright 2024 by NinniN',
              style: TextStyle(
                fontSize: MediaQuery.of(context).size.height * 0.015,
                color: Colors.amber
              ),
            ),
          ],
        ),
      ),
    );
  }
}