import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import '../utils/constants/icon-path.dart';
import '../utils/helpers/app-color.dart';
import '../widget/custom/custom-theme-button.dart';
import '../widget/custom/login-signup-textfield.dart';
import 'signup-screen.dart';

class LoginScreen extends StatefulWidget {
  static const String routeName = "/loginPage";
  const LoginScreen({super.key});

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController emailController = TextEditingController();
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
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(25.0),
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                const SizedBox(height: 50),
                const Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Hello",
                      style: TextStyle(
                        color: AppColors.theme,
                        fontWeight: FontWeight.w600,
                        fontSize: 30,
                      ),
                    ),
                    Text(
                      ",",
                      style: TextStyle(
                        color: AppColors.text,
                        fontWeight: FontWeight.w600,
                        fontSize: 30,
                      ),
                    ),
                  ],
                ),
                const Text(
                  "Welcome back!",
                  style: TextStyle(
                    color: AppColors.text,
                    fontWeight: FontWeight.w600,
                    fontSize: 30,
                  ),
                ),
                const SizedBox(height: 10),
                const Text(
                  "We are happy to see. You can login to continue.",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: AppColors.subText,
                    fontWeight: FontWeight.normal,
                    fontSize: 14,
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
                  controller: passwordController,
                  hintText: "Enter Password",
                  labelText: "Password",
                  obscureText: true,
                  isPasswordVisible: _isPasswordVisible,
                  togglePasswordVisibility: _togglePasswordVisibility,
                  validator: passwordValidator,
                ),
                const SizedBox(height: 10),
                Align(
                  alignment: Alignment.centerRight,
                  child: InkWell(
                    onTap: () {
                      Get.toNamed('/forgotPassword');
                    },
                    child: const Text(
                      "Forgot Password?",
                      style: TextStyle(
                        fontSize: 12,
                        color: AppColors.theme,
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 50),
                CustomThemeButton(
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      // Perform login action
                    }
                  },
                  horizontalPadding: 88,
                  verticalPadding: 10,
                  text: "LOG IN",
                  textSize: 18,
                  textWeight: FontWeight.bold,
                ),
                const SizedBox(height: 50),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      "Don’t have an account yet? ",
                      style: TextStyle(
                          fontSize: 15,
                          color: AppColors.text,
                          fontWeight: FontWeight.w300),
                    ),
                    InkWell(
                      onTap: () {
                        Get.toNamed(SignInScreen.routeName);
                      },
                      child: const Text(
                        "Sign Up",
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
      ),
    );
  }
}
