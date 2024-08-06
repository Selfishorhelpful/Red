import 'package:flutter/material.dart';

import '../utils/helpers/app-color.dart';

class SignInScreen extends StatelessWidget {
  static const String routeName = "/signupPage";
  const SignInScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          const Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("Sign Up,",
                      style: TextStyle(color: AppColors.text, fontWeight: FontWeight.w600, fontSize: 30,),
                    ),
                    Column(
                      children: [
                        Text("This is a place for real and natural ",
                          style: TextStyle(color: AppColors.text, fontWeight: FontWeight.normal, fontSize: 14,
                          ),
                        ),
                        Text("Connections. ",
                          style: TextStyle(color: AppColors.theme, fontWeight: FontWeight.normal, fontSize: 14,
                          ),
                        ),
                      ],
                    )
                  ],
                ),
          RichText(
        textAlign: TextAlign.center,
        text: const TextSpan(
          children: [
            TextSpan(
              text: "Sign Up, ", style: TextStyle(color: AppColors.text, fontWeight: FontWeight.w600, fontSize: 30,),
            ),
            TextSpan(
              text: "This is a place for real and natural ", style: TextStyle(color: AppColors.text, fontWeight: FontWeight.normal, fontSize: 14,),
            ),
            TextSpan(
              text: "Connections.", style: TextStyle(color: AppColors.theme, fontWeight: FontWeight.normal, fontSize: 14,
              ),
            ),
          ],
        ),
      ),

        ],
      ),
    );
  }
}
