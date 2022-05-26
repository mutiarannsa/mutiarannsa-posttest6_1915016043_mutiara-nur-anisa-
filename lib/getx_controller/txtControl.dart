
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TextControl extends GetxController {
  var kota = "".obs;
  var alamat = "".obs;
  var index = 0.obs;
  final kotaCon = TextEditingController();
  final alamatCon = TextEditingController();
  
  onTapPilih(var Index){
    index.value = Index;
  }

}