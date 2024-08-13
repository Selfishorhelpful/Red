import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../utils/helpers/app-color.dart';
import '../widget/custom/custom-theme-button.dart';
import '../widget/custom/login-signup-textfield.dart';
import 'login-screen.dart';

class SignInScreen extends StatefulWidget {
  static const String routeName = "/signupPage";
  const SignInScreen({super.key});

  @override
  _SignInScreenState createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController mobileController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  bool _isPasswordVisible = false;

  String? emailValidator(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter your email';
    }
    if (!RegExp(r'^[^@]+@[^@]+\.[^@]+').hasMatch(value)) {
      return 'Please enter a valid email';
    }
    return null;
  }

  String? mobileValidator(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter your mobile number';
    }
    if (!RegExp(r'^[0-9]+$').hasMatch(value)) {
      return 'Please enter a valid mobile number';
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

  void _togglePasswordVisibility() {
    setState(() {
      _isPasswordVisible = !_isPasswordVisible;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: Padding(
        padding: const EdgeInsets.all(25.0),
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                "Sign Up,",
                style: TextStyle(
                  color: AppColors.text,
                  fontWeight: FontWeight.w600,
                  fontSize: 30,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 10),
              RichText(
                textAlign: TextAlign.center,
                text: const TextSpan(
                  children: [
                    TextSpan(
                      text: "This is a place for real and natural ",
                      style: TextStyle(
                        color: AppColors.text,
                        fontWeight: FontWeight.normal,
                        fontSize: 14,
                      ),
                    ),
                    TextSpan(
                      text: "Connections.",
                      style: TextStyle(
                        color: AppColors.theme,
                        fontWeight: FontWeight.normal,
                        fontSize: 14,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 50),
              CustomTextFieldPrimary(
                controller: emailController,
                hintText: "Enter Email Address",
                labelText: "E-Mail",
                validator: emailValidator,
              ),
              const SizedBox(height: 40),
              CustomTextFieldPrimary(
                controller: mobileController,
                hintText: "Enter Mobile Number",
                labelText: "Mobile",
                validator: mobileValidator,
              ),
              const SizedBox(height: 40),
              CustomTextFieldPrimary(
                controller: passwordController,
                hintText: "Enter Your Password",
                labelText: "Password",
                obscureText: true,
                isPasswordVisible: _isPasswordVisible,
                togglePasswordVisibility: _togglePasswordVisibility,
                validator: passwordValidator,
              ),
              const SizedBox(height: 10),
              const SizedBox(height: 50),
              RichText(
                textAlign: TextAlign.center,
                text: const TextSpan(
                  children: [
                    TextSpan(
                      text: "By signing up you are agreeing to our ",
                      style: TextStyle(
                        color: AppColors.text,
                        fontWeight: FontWeight.normal,
                        fontSize: 14,
                      ),
                    ),
                    TextSpan(
                      text: "Terms & Conditions",
                      style: TextStyle(
                        color: AppColors.theme,
                        fontWeight: FontWeight.normal,
                        fontSize: 14,
                      ),
                    ),
                    TextSpan(
                      text: " and ",
                      style: TextStyle(
                        color: AppColors.text,
                        fontWeight: FontWeight.normal,
                        fontSize: 14,
                      ),
                    ),
                    TextSpan(
                      text: "Privacy Policy",
                      style: TextStyle(
                        color: AppColors.theme,
                        fontWeight: FontWeight.normal,
                        fontSize: 14,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 50),
              CustomThemeButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    // Perform sign-up action
                  }
                },
                horizontalPadding: 88,
                verticalPadding: 10,
                text: "SIGN UP",
                textSize: 18,
                textWeight: FontWeight.bold,
              ),
              const SizedBox(height: 50),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    "Already a RedMancer? ",
                    style: TextStyle(
                        fontSize: 15,
                        color: AppColors.text,
                        fontWeight: FontWeight.w300),
                  ),
                  InkWell(
                    onTap: () {
                      Get.toNamed(LoginScreen.routeName);
                    },
                    child: const Text(
                      "Log In",
                      style: TextStyle(
                        fontSize: 15,
                        color: AppColors.text,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
