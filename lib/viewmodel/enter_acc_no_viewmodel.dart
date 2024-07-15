import 'dart:developer';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:paysense/utils/util.dart';
import 'package:paysense/viewmodel/bepay_amnt_viemodel.dart';
import 'package:paysense/viewmodel/login_viewmodel.dart';
import 'package:paysense/views/after_pay_amnt_view.dart';
import '../widgets/custom_keypad.dart';

class EnterAccController extends GetxController {
  TextEditingController textacc = TextEditingController();
  final BePayAmntController bePayAmntView = Get.put(BePayAmntController());
  final LoginController loginController = Get.put(LoginController());
  final RxBool loading = false.obs;
  var verificationMessage = ''.obs;
  var userData = {}.obs; 

  RxString inputText = ''.obs;
  RxBool showError = false.obs;

  void onTextChanged(newText) {
    inputText.value = newText;
    showError.value = false; // Reset error state
  }

  void openModal(BuildContext context) {
    showModalBottomSheet(
      isScrollControlled: true,
      barrierColor: Colors.white.withOpacity(0.05),
      backgroundColor: Colors.transparent,
      context: context,
      shape: const OutlineInputBorder(
          borderSide: BorderSide.none,
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20), topRight: Radius.circular(20))),
      builder: (BuildContext context) {
        return SizedBox(
          height: MediaQuery.of(context).size.height * 0.38,
          child: CustomKeyboard(
            height: 1.5,
            onKeyPressed: (value) {
              if (value == '⌫') {
                if (textacc.text.isNotEmpty) {
                  textacc.text =
                      textacc.text.substring(0, textacc.text.length - 1);
                }
              } else {
                textacc.text += value;
              }
              onTextChanged(textacc.text);
            },
          ),
        );
      },
    );
  }

  Future<Map<String, dynamic>?> verifyPhoneNumber() async {
    String phoneNumber = textacc.text.trim();
    try {
      // Reference to the Firestore collection where user data is stored
      CollectionReference users = FirebaseFirestore.instance.collection('users');

      // Query to check if the phone number exists
      QuerySnapshot querySnapshot = await users.where('phoneNumber', isEqualTo: phoneNumber).get();

      // If the query result is not empty, the phone number exists
      if (querySnapshot.docs.isNotEmpty) {
        // Return the first user's data (assuming phoneNumber is unique)
        return querySnapshot.docs.first.data() as Map<String, dynamic>;
      } else {
        return null;
      }
    } catch (e) {
      log('Error verifying phone number: $e');
      return null;
    }
  }

  void verifyAccountNumber() async {
    loading.value = true;
    Map<String, dynamic>? data = await verifyPhoneNumber();
    loading.value = false;
    if (data != null) {
      userData.value = data; // Assign the data to userData
      Get.to(() => AfterPayAmntView(userData: userData));
    } else {
      Util.snackBar("Error", "Account Number is invalid");
    }
  }
}
