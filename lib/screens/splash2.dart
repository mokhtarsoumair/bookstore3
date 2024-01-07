import 'dart:async';

import 'package:chat_app/screens/auth.dart';
import 'package:flutter/material.dart';

class SplashScreen2 extends StatefulWidget {
  @override
  _SplashScreen2State createState() => _SplashScreen2State();
}

class _SplashScreen2State extends State<SplashScreen2> {
  @override
  void initState() {
    super.initState();
    Timer(Duration(seconds: 5), () => Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => AuthScreen())));


  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white, // Or your brand's primary color
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset('assets/images/splash.png', width: 200), // Replace with your logo
            const SizedBox(height: 20),
            const Text(
              'Unleash Your Imagination', // Or a suitable tagline
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const CircularProgressIndicator(),
          ],
        ),
      ),
    );
  }
}
