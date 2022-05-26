

import 'dart:async';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:posttest6_1915016043_mutiara/landing_page.dart';

class ssControl extends GetxController{
  start(){
    final duration = Duration(seconds: 3);
    return Timer(duration, (){
      Get.off(landing_page());
    });
  }
}