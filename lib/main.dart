import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:redmance/utils/helpers/pages.dart';
import 'package:redmance/utils/helpers/splash-screen.dart';

import '../../screens/login-screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      theme: ThemeData(fontFamily: 'Quicksand'),
      debugShowCheckedModeBanner: false,
      home:  LoginScreen(),
      initialRoute: SplashScreen.routeName,
      getPages: AppPages.pages,
    );
  }
}
