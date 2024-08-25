import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:redmance/repository/verify.dart';
import 'package:redmance/screens/signup-screen.dart';

import '../screens/home-screen.dart';
import '../screens/login-screen.dart';
class Wrapper extends StatefulWidget {
  const Wrapper({super.key});
  static const String routeName = "/wrapperPage";

  @override
  State<Wrapper> createState() => _WrapperState();
}

class _WrapperState extends State<Wrapper> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: StreamBuilder(
      stream: FirebaseAuth.instance.authStateChanges (),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            if(snapshot.data!.emailVerified){
              return HomeScreen();
            }else{
              return const Verify();
            }
          }else{
            return LoginScreen();
          }
        } ), // StreamBuilder
      ); // Scaffold
  }
}
