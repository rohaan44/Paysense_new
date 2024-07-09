import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import '../utils/util.dart';

class RegisterController extends GetxController {
  final RxBool isLoading = false.obs;
  TextEditingController editemail = TextEditingController();
  TextEditingController editName = TextEditingController();
  TextEditingController editpin = TextEditingController();
  TextEditingController editphone = TextEditingController();
  final FirebaseFirestore firestore = FirebaseFirestore.instance;
  final RxBool isFormValid = false.obs;
  var isHiddenPassword = true.obs;
  String? validateEmail(String value) {
    if (value.isEmpty) {
      isLoading.value = false;
      return 'Please enter your Email';
    }

    return null; // Return null if the input is valid
  }

  String? validateeUserName(String value) {
    if (value.isEmpty) {
      isLoading.value = false;
      return 'Please enter your UserName';
    }

    return null; // Return null if the input is valid
  }

  String? validateePhone(String value) {
    if (value.isEmpty) {
      isLoading.value = false;
      return 'Please enter your PhoneNumber';
    }

    return null; // Return null if the input is valid
  }

  String? validatePin(String value) {
    if (value.isEmpty) {
      isLoading.value = false;
      return 'Please enter your Pin';
    }

    return null; // Return null if the input is valid
  }

  void updateFormValidity(bool isValid, BuildContext context) {
    isFormValid.value = isValid;
  }

  void submitForm(BuildContext context) {
    if (isFormValid.value) {
      postData();
    }
  }

  var responseMessage = "".obs; // Observable variable to store response message

  Future<void> postData() async {
    final String apiUrl = 'http://54.162.54.241:8080/api/user/registerUser';

    try {
      isLoading.value = true;
      var response = await http.post(
        Uri.parse(apiUrl),
        headers: {
          'Content-Type': 'application/json',
        },
        body: jsonEncode({
          "email": editemail.text,
          "username": editName.text,
          "pin": editpin.text,
          "phoneNumber": editphone.text,
        }),
      );
      isLoading.value = true;
      Get.toNamed('loginView');
      isLoading.value = false;

      editemail.clear();
      editName.clear();
      editphone.clear();
      editpin.clear();

      if (response.statusCode == 200) {
        responseMessage.value = 'Data posted successfully!';
        Util.snackBar("Congratulations", "Successfully Registered");
        var data = jsonDecode(response.body.toString());
        print(data['accountNumber']);
        if (kDebugMode) {
          print(data);
          print('Data added to Firestore successfully');
          // print(response.body);
        }
      } else {
        responseMessage.value =
            'Failed to post data. Status code: ${response.statusCode}';
      }
    } catch (e) {
      print(e);
      responseMessage.value = 'Error: ${e}';
    }
  }

  // addDataToFirestore(BuildContext context) async {
  //   try {
  //     isLoading.value = true;
  //     await firestore.collection('UserData').doc().set({
  //       'User Email': editemail.text,
  //       'User Name': editName.text,
  //       'User Pin': editpin.text,
  //     });
  //     isLoading.value = true;
  //     Get.toNamed('loginView');
  //     isLoading.value = false;

  //     editemail.clear();
  //     editName.clear();
  //     editpin.clear();
  //     Util.snackBar("Congratulations", "Successfully Registered");
  //     if (kDebugMode) {
  //       print('Data added to Firestore successfully');
  //     }
  //   } catch (e) {
  //     isLoading.value = false;
  //     Util.snackBar("UserData Not Register", "try again");
  //     if (kDebugMode) {
  //       print('Error adding data to Firestore: $e');
  //     }
  //   }
  // }
}
