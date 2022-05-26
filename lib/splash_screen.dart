import 'dart:async';
import 'package:flutter/material.dart';
import 'package:posttest6_1915016043_mutiara/getx_controller/ssControl.dart';
import 'package:posttest6_1915016043_mutiara/landing_page.dart';
import 'package:posttest6_1915016043_mutiara/main.dart';
import 'package:get/get.dart';
import 'dart:async';

class SplashScreen extends StatelessWidget {
  SplashScreen({Key? key}) : super(key: key);

  final ssControl splash_screen = Get.put(ssControl());
  @override
  Widget build(BuildContext context) {
    splash_screen.start();
    return Scaffold(
      body: Center(
        child: Image.asset(
          "assets/icecreamlogo.jpg",
          width: MediaQuery.of(context).size.width / 2,
          height: MediaQuery.of(context).size.height / 2,
        ),
      ),
    );
  }
}
