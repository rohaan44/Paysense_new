import 'dart:convert';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:paysense/utils/util.dart';
import 'package:http/http.dart' as http;

class LoginController extends GetxController {
  final RxBool isLoading = false.obs;
  final RxBool isFormValid = false.obs;

  RxMap jsonData = {}.obs;
  var ispasswordHidden = true.obs;
   String? validateaccNo(String value) {
    if (value.isEmpty) {
      isLoading.value = false;
      return 'Please enter your Acc. No';
    }

    return null; // Return null if the input is valid
  }
  String? validatepin(String value) {
    if (value.isEmpty) {
      isLoading.value = false;
      return 'Please enter your Pin';
    }

    return null; // Return null if the input is valid
  }

  void updateFormValidity(bool isValid, BuildContext context) {
    isFormValid.value = isValid;
  }

  // void submitForm(BuildContext context) {
  //   if (isFormValid.value) {
  //     // loginUser(context);
  //     chkk();
  //   }
  // }

  @override
  void onClose() {
    editpin.dispose();
    super.onClose();
  }

  var responseMessage = "".obs;

  Future<void> login() async {
    final String username = editaccount.text;
    final String password = editpin.text;
    isLoading.value = true;
    final String apiUrl =
        "http://54.162.54.241:8080/api/user/pinVerification"; // Replace with your API endpoint URL

    try {
      final response = await http.post(
        Uri.parse(apiUrl),
        body: jsonEncode({
          'accountNumber': username,
          'pin': password,
        }),
        headers: {'Content-Type': 'application/json'},
      );

      if (response.statusCode == 200) {
        // Successful login
        // You can parse the response JSON if the API returns user data
        final responseData = json.decode(response.body);

        print(response.body);
        // print(responseData);
        jsonData.value = jsonDecode(response.body.toString());
        print(jsonData['responseMessage']);

        print(jsonData['accountInfo']['accountName']);
        print(jsonData['accountInfo']['accountNumber']);
        print(jsonData['accountInfo']['accountBalance']);
        if (jsonData['responseMessage'] == 'Pin verification Success!') {
          isLoading.value = true;
          Get.toNamed('/SelfieCameraView');
          editpin.clear();
          Util.snackBar("Congratulations", "User Logged In Successfully");
          isLoading.value = false;
        } else {
          isLoading.value = true;
          Util.snackBar("Pin Verification failed", "try again");
          isLoading.value = false;
        }
      } else {
        // Failed login
        isLoading.value = true;
        Util.snackBar("Invalid Pin", "try again");
        isLoading.value = false;
      }
    } catch (e) {
      // Handle network errors or other exceptions
      Util.snackBar("An Error Occurred", "try again");
      isLoading.value = false;
    }
  }
  // FirebaseFirestore firestore = FirebaseFirestore.instance;
  // Future<bool> loginUser(BuildContext context) async {
  //   isLoading.value = true;
  //   try {
  //     QuerySnapshot snapshot = await firestore
  //         .collection('UserData')
  //         .where('User Pin',
  //             isEqualTo: editpin.text) // Hash the password and compare it
  //         .limit(1)
  //         .get();

  //     if (snapshot.docs.isNotEmpty) {
  //       isLoading.value = true;
  //       Get.toNamed('/SelfieCameraView');
  //       editpin.clear();
  //       Util.snackBar("Congratulations", "User Logged In Successfully");

  //       // Fluttertoast.showToast(
  //       //     msg: "User Logged In Successfully",
  //       //     backgroundColor: Colors.indigoAccent);
  //       isLoading.value = false;

  //       return true;
  //     } else {
  //       isLoading.value = true;
  //       Util.snackBar("Invalid Pin", "try again");
  //       isLoading.value = false;

  //       return false;
  //     }
  //   } catch (e) {
  //     isLoading.value = true;
  //     Util.snackBar("$e", "try again");
  //     if (kDebugMode) {
  //       print(e);
  //     }
  //     isLoading.value = false;

  //     return false;
  //   }
  // }

  TextEditingController editaccount = TextEditingController();
  TextEditingController editpin = TextEditingController();
}
