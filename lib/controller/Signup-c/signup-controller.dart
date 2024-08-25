import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../../repository/wrapper.dart';

class SignupController extends GetxController {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController fullNameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  // Use RxBool for reactivity
  RxBool isPasswordVisible = false.obs;

  // Validators
  String? emailValidator(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter your email';
    }
    if (!RegExp(r'^[^@]+@[^@]+\.[^@]+').hasMatch(value)) {
      return 'Please enter a valid email';
    }
    return null;
  }

  String? nameValidator(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter your full name';
    }
    if (!RegExp(r'^[a-zA-Z\s]+$').hasMatch(value)) {
      return 'Please enter a valid name';
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

  // Sign up function with manual validation
  Future<void> signUp() async {
    final emailError = emailValidator(emailController.text.trim());
    final nameError = nameValidator(fullNameController.text.trim());
    final passwordError = passwordValidator(passwordController.text.trim());

    if (emailError == null && nameError == null && passwordError == null) {
      try {
        await FirebaseAuth.instance.createUserWithEmailAndPassword(
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
      Get.snackbar(
        "Error",
        "Please correct the errors in the form",
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: CupertinoColors.systemRed,
        colorText: CupertinoColors.white,
      );
    }
  }
}
