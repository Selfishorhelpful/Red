import 'package:flutter/material.dart';
import 'package:get/get.dart'; // Import Get package for navigation
import 'dart:async'; // For Timer

import '../../repository/wrapper.dart';
import '../../screens/login-screen.dart';
import '../constants/image-path.dart';

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
    // Start a timer to transition to Wrapper after a delay
    Timer(const Duration(seconds: 3), () {
      // Navigate to Wrapper using Get package
      Get.offAll(() => Wrapper());
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
