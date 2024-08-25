import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import '../controller/login-C/login-controller.dart';
import '../utils/constants/icon-path.dart';
import '../utils/helpers/app-color.dart';
import '../widget/custom/custom-theme-button.dart';
import '../widget/custom/login-signup-textfield.dart';
import 'forget-pass.dart';
import 'signup-screen.dart';

class LoginScreen extends StatelessWidget {
  static const String routeName = "/loginPage";
  final LoginController c = Get.put(LoginController());
   LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(25.0),
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
                controller: c.emailController,
                hintText: "Enter Email Address",
                labelText: "E-Mail",
                validator: c.emailValidator,
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
              Align(
                alignment: Alignment.centerRight,
                child: InkWell(
                  onTap: () {
                    Get.toNamed(Forgot.routeName);
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
                  c.signIn();
                },
                horizontalPadding: 88,
                verticalPadding: 10,
                text: "LOG IN",
                textSize: 18,
                textWeight: FontWeight.bold,
              ),
              const SizedBox(height: 20,),
               Padding(
                padding: const EdgeInsets.only(left: 20,right: 20),
                child: Row(
                children: [
                  Expanded(
                    child: Container(
                      margin: const EdgeInsets.symmetric(horizontal: 10.0),
                      child: const Divider(color: AppColors.subText, thickness: 1),
                    ),
                  ),
                  const Text("OR LOG IN WITH",
                      style: TextStyle(color: AppColors.subText, fontSize: 12)),
                  Expanded(
                    child: Container(
                      margin: const EdgeInsets.symmetric(horizontal: 10.0),
                      child: const Divider(color: AppColors.subText, thickness: 1),
                    ),
                  ),
                ],
                ),

              ),

               SizedBox(height: 20,),

                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 40),
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(backgroundColor: Colors.black,
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(13),
                        side: BorderSide(color: AppColors.theme, width: 1),
                      ),
                    ),
                    onPressed: (){c.googleLogin();},
                    child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 10),
                      child: Stack(alignment: Alignment.center,
                        children: [
                          Align(
                            alignment: Alignment.centerLeft,
                            child: SvgPicture.asset(IconPaths.googleLogo, height: 20, width: 20,),
                          ),
                          const Text("Google",
                            style: TextStyle(fontSize: 15, fontWeight: FontWeight.normal, color: Colors.white,),
                          ),
                        ],
                      ),
                    ),
                  ),
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
    );
  }
}