import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controller/login-C/login-controller.dart';

class HomeScreen extends StatelessWidget {
  static const String routeName = "/homePage";
   HomeScreen({super.key});
  final loginController = Get.put(LoginController());

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor: Colors.red,
      body: Column(
        children: [
          ElevatedButton(onPressed: (){}, child:  Text('${loginController.user!.email}'))
        ],

      ),
      floatingActionButton: FloatingActionButton(
      onPressed: (() =>loginController.signout()),
      child: const Icon(Icons.login_rounded),
      ), // FloatingActionButton
    );
  }
}
