import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:paysense/utils/util.dart';
import 'package:paysense/views/dashboard_view.dart';

class Login_Controller extends GetxController {
  final RxBool isLoading = false.obs;
  var ispasswordHidden = true.obs;
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController pinController = TextEditingController();
  FirebaseAuth auth = FirebaseAuth.instance;
     

  String? validatePin(String value) {
    if (value.isEmpty) {
      return 'Please enter your Pin';
    }
    return null;
  }

void login() {
    final String pin = pinController.text;
    final String adjustedPin = pin.padRight(6, '0');
    
    isLoading.value = true;

    // Example of Firebase authentication with GetX usage
    auth.signInWithEmailAndPassword(
      email: emailController.text.toString(),
      password: adjustedPin,
    ).then((value) {
      isLoading.value = false;
      Util.snackBar("Congratulations", "User Logged In Successfully");
      Get.to(() => DashView()); // Navigate to dashboard using GetX
    }).catchError((error) {
      isLoading.value = false;
      log(error.toString());
      Util.snackBar("Error", error.toString());
    });

    log("Login button pressed");
  }
  @override
  void onClose() {
    emailController.dispose();
    pinController.dispose();
    super.onClose();
  }
}
