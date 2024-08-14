import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controller/Signup-c/signup-controller.dart';
import '../utils/helpers/app-color.dart';
import '../widget/custom/custom-theme-button.dart';
import '../widget/custom/login-signup-textfield.dart';
import 'login-screen.dart';

class SignInScreen extends StatelessWidget {
  static const String routeName = "/signupPage";
  final SignupController c = Get.put(SignupController());

  SignInScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(25.0),
          child: Form(
            key: c.formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(height: 50),
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
                  controller: c.emailController,
                  hintText: "Enter Email Address",
                  labelText: "E-Mail",
                  validator: c.emailValidator,
                ),
                const SizedBox(height: 40),
                CustomTextFieldPrimary(
                  controller: c.fullNameController,
                  hintText: "Enter Full Name",
                  labelText: "Full Name",
                  validator: c.nameValidator,
                ),
                const SizedBox(height: 40),
                Obx(() => CustomTextFieldPrimary(
                      controller: c.passwordController,
                      hintText: "Enter Your Password",
                      labelText: "Password",
                      obscureText: true,
                      isPasswordVisible: c.isPasswordVisible.value,
                      togglePasswordVisibility: c.togglePasswordVisibility,
                      validator: c.passwordValidator,
                    )),
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
                    if (c.formKey.currentState!.validate()) {
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
      ),
    );
  }
}
