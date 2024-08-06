import 'package:flutter/material.dart';

import '../../screens/login-screen.dart';
import '../constants/image-path.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'dart:async'; // For Timer

class SplashScreen extends StatefulWidget {
  static const String routeName = "/splashscreen";
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  @override
  void initState() {
    super.initState();
    // Start a timer to transition to LoginScreen after a delay
    Timer(Duration(seconds: 3), () {
      Get.offNamed(LoginScreen.routeName); // Navigate to LoginScreen
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage(ImagePaths.splashScreenImage), // Replace with your image path
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}

