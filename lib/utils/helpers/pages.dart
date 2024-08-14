import 'package:get/get.dart';
import 'package:redmance/screens/signup-screen.dart';
import 'package:redmance/utils/helpers/splash-screen.dart';
import '../../controller/Signup-c/signup-controller.dart';
import '../../controller/login-C/login-controller.dart';
import '../../controller/splash-C/splashScreen-controller.dart';
import '../../screens/login-screen.dart';

class AppPages {
  static final List<GetPage> pages = <GetPage>[

    GetPage(
      name: SplashScreen.routeName,
      page: () => const SplashScreen(),
      // binding: BindingsBuilder(() {
      //   Get.lazyPut(() => SplashController());
      // })
    ),

    GetPage(
      name: LoginScreen.routeName,
      page: () =>  LoginScreen(),
      binding: BindingsBuilder(() {
        Get.lazyPut<LoginController>(() => LoginController());
      }),
    ),
    GetPage(
      name: SignInScreen.routeName,
      page: () => SignInScreen(),
      binding: BindingsBuilder(() {
        Get.lazyPut<SignupController>(() => SignupController());
      }),
    ),
    // GetPage(
    //   name: '/profile',
    //   page: () => ProfileView(),
    //   binding: BindingsBuilder(() {
    //     Get.lazyPut<ProfileController>(() => ProfileController());
    //   }),
    // ),
  ];
}