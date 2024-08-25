import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:redmance/repository/wrapper.dart';
import 'package:redmance/screens/login-screen.dart';

import '../screens/signup-screen.dart';

class Verify extends StatefulWidget {
  const Verify({super.key});
  static const String routeName = "/verifyPage";

  @override
  State<Verify> createState() => _VerifyState();
}

class _VerifyState extends State<Verify> {
  @override
  void initState() {
    super.initState();
    sendVerifyLink();
  }

  // Function to send the verification link
  Future<void> sendVerifyLink() async {
    final user = FirebaseAuth.instance.currentUser!;
    try {
      await user.sendEmailVerification();
      Get.snackbar(
        'Link Sent',
        'A verification link has been sent to your email.',
        margin: const EdgeInsets.all(30),
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: const Color(0xFF34302f),
        colorText: Colors.white,
      );
    } catch (e) {
      Get.snackbar(
        'Error',
        'Failed to send verification email.',
        margin: const EdgeInsets.all(30),
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: const Color(0xFF34302f),
        colorText: Colors.white,
      );
      await GoogleSignIn().signOut();
      await FirebaseAuth.instance.signOut();
      Get.offAllNamed(LoginScreen.routeName);
    }
  }

  // Function to reload and check verification status
  Future<void> reload() async {
    await FirebaseAuth.instance.currentUser!.reload();
    if (FirebaseAuth.instance.currentUser!.emailVerified) {
      Get.offAllNamed(Wrapper.routeName);
    } else {
      Get.snackbar(
        'Not Verified',
        'Please verify your email before proceeding.',
        margin: const EdgeInsets.all(30),
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: const Color(0xFF34302f),
        colorText: Colors.white,
      );
    }
  }

 @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF1b1a1a),
     
      body: Padding(
        padding: const EdgeInsets.all(28.0),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(height: 50),
              const Icon(
                Icons.email_outlined,
                size: 80,
                color: Colors.white,
              ),
              const SizedBox(height: 20),
              const Text(
                "Verify Your Email",
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              const SizedBox(height: 10),
              const Text(
                "Please open your email and click the verification link. Then, reload this page.",
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                ),
              ),
              const SizedBox(height: 40),
              SizedBox(
                width: 150,
                child: ElevatedButton(
                  onPressed: reload,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFFFF7F00),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    padding: const EdgeInsets.symmetric(vertical: 12),
                  ),
                  child: const Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.refresh, color: Colors.white),
                      SizedBox(width: 8),
                      Text(
                        "Reload",
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 20),

              const SizedBox(height: 50),
              GestureDetector(
                onTap: () {
                  Get.offAllNamed(SignInScreen.routeName);
                },
                child: const Text(
                  "Go Back",
                  style: TextStyle(
                    color: Colors.white,
                    decoration: TextDecoration.underline,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
