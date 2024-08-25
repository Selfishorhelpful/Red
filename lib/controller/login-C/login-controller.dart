import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';

import '../../repository/verify.dart';
import '../../repository/wrapper.dart';
import '../../screens/login-screen.dart';

class LoginController extends GetxController {

  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  // Use RxBool for reactivity
  RxBool isPasswordVisible = false.obs;

  final user=FirebaseAuth.instance.currentUser;

  String? emailValidator(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter your email';
    }
    if (!RegExp(r'^[^@]+@[^@]+.[^@]+').hasMatch(value)) {
      return 'Please enter a valid email';
    }
    return null;
  }

  String? passwordValidator(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter your password';
    }
    if (value.length < 6) {
      return 'Password must be at least 6 characters';
    }
    return null;
  }

  // Toggle password visibility
  void togglePasswordVisibility() {
    isPasswordVisible.value = !isPasswordVisible.value;
  }

Future<void> signIn() async {
    final emailError = emailValidator(emailController.text);
    final passwordError = passwordValidator(passwordController.text);

    if (emailError == null && passwordError == null) {
      try {
        await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: emailController.text.trim(),
          password: passwordController.text.trim(),
        );
        Get.offAllNamed(Wrapper.routeName);
      } catch (e) {
        Get.snackbar("Error", e.toString(),
            snackPosition: SnackPosition.BOTTOM,
            backgroundColor: CupertinoColors.systemRed,
            colorText: CupertinoColors.white);
      }
    } else {
      // Show errors if any field is invalid
      if (emailError != null) {
        Get.snackbar("Email Error", emailError,
            snackPosition: SnackPosition.BOTTOM,
            backgroundColor: CupertinoColors.systemRed,
            colorText: CupertinoColors.white);
      }
      if (passwordError != null) {
        Get.snackbar("Password Error", passwordError,
            snackPosition: SnackPosition.BOTTOM,
            backgroundColor: CupertinoColors.systemRed,
            colorText: CupertinoColors.white);
      }
    }
  }

  Future<void> googleLogin() async {
    try {
      final googleUser = await GoogleSignIn().signIn();
      if (googleUser == null) return; // User cancelled the sign-in

      final googleAuth = await googleUser.authentication;
      final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );

      await FirebaseAuth.instance.signInWithCredential(credential);
      Get.snackbar("Success", "Logged in successfully",
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Colors.green,
          colorText: Colors.white);
    } catch (e) {
      Get.snackbar("Error", e.toString(),
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Colors.red,
          colorText: Colors.white);
    }
  }


  signout() async{
    await GoogleSignIn().signOut();
    await FirebaseAuth.instance.signOut();
  }



  // signout(BuildContext context) async {
  //   await GoogleSignIn().signOut();
  //   await FirebaseAuth.instance.signOut();
  //
  //   // Navigate to the login screen and remove all previous routes
  //   Navigator.pushAndRemoveUntil(
  //     context,
  //     MaterialPageRoute(builder: (context) => LoginScreen()),
  //     (Route<dynamic> route) => false,
  //   );
  // }


//   Future<void> signOutAndUnverify() async {
//   try {
//     // Get current user
//     User? user = FirebaseAuth.instance.currentUser;
//
//     if (user != null) {
//       // Update Firestore to mark email as unverified
//       await FirebaseFirestore.instance
//           .collection('users') // Your users collection
//           .doc(user.uid) // Document ID for the current user
//           .update({'emailVerified': false});
//
//       // Sign out the user
//       await FirebaseAuth.instance.signOut();
//     }
//   } catch (e) {
//     // Handle error, e.g., show a Snackbar or AlertDialog
//     Get.snackbar(
//       "Error",
//       e.toString(),
//       snackPosition: SnackPosition.BOTTOM,
//       backgroundColor: CupertinoColors.systemRed,
//       colorText: CupertinoColors.white,
//     );
//   }
// }



}
