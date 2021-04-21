import 'package:bill_keep/routes.dart';
import 'package:bill_keep/views/root_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MainApp());
}

class MainApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: RootScreen.routeName,
      theme: ThemeData(
        fontFamily: 'Montserrat',
      ),
      getPages: appPages,
    );
  }
}
