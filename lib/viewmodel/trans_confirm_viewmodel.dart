import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:paysense/controllers/UserDataController.dart';
import 'package:paysense/controllers/transactionController.dart';
import 'package:paysense/views/transact_script_view.dart';

class TransConfirmontroller extends GetxController {
  TextEditingController textControl = TextEditingController();
  final TextEditingController fieldOne = TextEditingController();
  final TextEditingController fieldTwo = TextEditingController();
  final TextEditingController fieldThree = TextEditingController();
  final TextEditingController fieldFour = TextEditingController();
  var userData = Get.find<UserController>().userData; 
   final transactionController = Get.put(TransactionController());

  String? otp;
  RxString inputText = ''.obs;
  RxBool showError = false.obs;

  void onTextChanged(newText) {
    inputText.value = newText;
    showError.value = false; // Reset error state
  }

 void verifyPin() {
    log(userData['pin']);
    if (textControl.text == userData['pin']) {
      log("Pin is Successful"); 
      transactionController.transaction();
      Get.to(() => TransScriptView());
    } else {
      Get.snackbar("Error", "Pin is incorrect");
    }
  }
}
