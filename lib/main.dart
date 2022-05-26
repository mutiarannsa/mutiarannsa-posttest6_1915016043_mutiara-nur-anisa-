import 'package:flutter/material.dart';
import 'package:posttest6_1915016043_mutiara/splash_screen.dart';
import 'package:get/get.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: "Posttest6_1915016043_Mutiara Nur Annisa",
      home: SplashScreen(),
    );
  }
}
