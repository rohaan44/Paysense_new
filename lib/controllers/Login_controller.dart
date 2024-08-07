import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:paysense/res/routes/routes_name.dart';
import 'package:paysense/utils/util.dart';
import 'package:paysense/views/dashboard_view.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:developer';

class Login_Controller extends GetxController {
  var emailController = TextEditingController();
  var pinController = TextEditingController();
  var isLoading = false.obs;
  var ispasswordHidden = true.obs;
  var userData = {}.obs;

  Future<void> login() async {
    final String pin = pinController.text;
    final String adjustedPin = pin.padRight(6, '0');
    
    isLoading.value = true;

    try {
      // Sign in with Firebase
      UserCredential userCredential = await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: emailController.text.toString(),
        password: adjustedPin,
      );
      String signedInEmail = userCredential.user?.email ?? '';

      await retrieveUserDataLocally(signedInEmail);

      isLoading.value = false;
      Util.snackBar("Congratulations", "User Logged In Successfully");
      Get.offAllNamed(RouteName.dashboardView);

    } catch (error) {
      isLoading.value = false;
      log(error.toString());
      Util.snackBar("Error", error.toString());
    }
  }

  Future<void> retrieveUserDataLocally(String signedInEmail) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String email = prefs.getString('email') ?? '';
    String username = prefs.getString('username') ?? '';
    String phoneNumber = prefs.getString('phoneNumber') ?? '';
    String pin = prefs.getString('pin') ?? '';
    String formattedNumber = prefs.getString('amount') ?? '';

    if (email == signedInEmail) {
      userData.value = {
        'email': email,
        'username': username,
        'phoneNumber': phoneNumber,
        'pin': pin,
        'amount': formattedNumber,
      };
      log('Locally retrieved user data: $userData');
    } else {
      log('No matching local user data found for the signed-in email.');
    }
  }
}