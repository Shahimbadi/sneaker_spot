import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:sneaker_spot/register/signupPage.dart';
import 'package:sneaker_spot/screens/navbarPage.dart';



void main() {
  runApp(const MaterialApp(
    debugShowCheckedModeBanner: false,
    home: SplashScreen(),));
}

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override

  void initState() {
    Timer((const Duration(seconds: 4)), () {
      User? user = FirebaseAuth.instance.currentUser;
      if (user != null) {
        Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => NavBarFlotingWidget()));
      } else {
        Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => Regscrn()));
      }

      // if (UserController.user == null) {
      //   Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const Regscrn()));
      // } else {
      //   Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const NavBarFlotingWidget()));
      // }

      // Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const Regscrn()));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage("assets/bgImages/Splash.png"),
                fit: BoxFit.fill)),
        );
  }
}
