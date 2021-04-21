import 'package:bill_keep/controllers/controllers.dart';
import 'package:bill_keep/views/dashboard.dart';
// import 'package:bill_keep/views/home_screen/home_screen.dart';
import 'package:bill_keep/views/login_screen/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RootScreen extends StatelessWidget {
  static const routeName = 'root_screen';
  @override
  Widget build(BuildContext context) {
    return GetX<AuthController>(
      builder: (authController) {
        print('Root builder called ${authController.user?.uid}');
        // return LoginScreen();
        if (authController.user?.uid != null) {
          print('returning home');
          return Dashboard();
        } else {
          return LoginScreen();
        }
      },
    );
  }
}
