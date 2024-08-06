import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:redmance/screens/signup-screen.dart';

import '../utils/constants/icon-path.dart';
import '../utils/helpers/app-color.dart';
import '../widget/custom/custom-theme-button.dart';
import '../widget/custom/login-signup-textfield.dart';

class LoginScreen extends StatelessWidget {
  static const String routeName = "/loginPage";
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    //final LoginController controller = Get.find();
    return  Scaffold(
        backgroundColor: AppColors.background,
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(25.0),
            child: Column(
              children: [
                const SizedBox(height: 50,),
                const Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("Hello",
                      style: TextStyle(color: AppColors.theme, fontWeight: FontWeight.w600, fontSize: 30,),
                    ),
                    Text(",",
                      style: TextStyle(color: AppColors.text, fontWeight: FontWeight.w600, fontSize: 30,
                      ),
                    )
                  ],
                ),
                const Text("Welcome Back",
                  style: TextStyle(color: AppColors.text, fontWeight: FontWeight.w600, fontSize: 30,),
                ),
          
          
                const SizedBox(height: 50,),
          
                const CustomTextFieldPrimary(hintText: "Enter Email Address",labelText: "E-Mail",),
                const SizedBox(height: 40,),
                const CustomTextFieldPrimary(hintText: "Enter Your Password",labelText: "Password",),
                const SizedBox(height: 10,),
                const Align(
                  alignment: Alignment.centerRight,
                  child: Text("Forget Password ?",
                  style: TextStyle(fontSize: 15, fontWeight: FontWeight.normal, color: AppColors.text)),
                ),
                const SizedBox(height: 40,),
                CustomThemeButton(onPressed: (){},horizontalPadding: 88,verticalPadding: 10,text: "LOG IN",textSize: 18, textWeight: FontWeight.bold,),
          
                const SizedBox(height: 40,),
          
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
                      onPressed: (){},
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
                SizedBox(height: 50,),
                 Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("New to RedMance? ",style: TextStyle(fontSize: 15,color: AppColors.text,fontWeight: FontWeight.w300),),
                    InkWell(
                              onTap: () {
                                Get.toNamed(SignInScreen.routeName); // Navigate to the signup page
                              },
                              child: const Text(
                                "Sign up",
                                style: TextStyle(
                                  fontSize: 15,
                                  color: AppColors.text,
                                  fontWeight: FontWeight.bold, // Make "Sign up" bold
                                ),
                              ),
                            ),                  ],
                )
          
                
          
          
          
              ],
            ),
          ),
        ));
  }
}
