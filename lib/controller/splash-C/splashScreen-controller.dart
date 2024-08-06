import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

import '../../screens/login-screen.dart';

class SplashController extends GetxController {
  @override
  void onInit() {
    super.onInit();
    // Check user authentication or perform initial setup
    Future.delayed(Duration(seconds: 3), () {
      Get.offNamed(LoginScreen.routeName);
    });
  }
}