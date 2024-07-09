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
  Map<String, dynamic>? userData = await verifyPhoneNumber();
  loading.value = false;
  if (userData != null) {
    Get.to(() => AfterPayAmntView( userData: userData));
  } else {
    Util.snackBar("Error", "Account Number is invalid");
  }
}

}
//   Future<void> transfermoney() async {
//     final String sender =
//         loginController.jsonData['accountInfo']['accountNumber'];
//     final String reciever = textacc.text;
//     final String amnt = bePayAmntView.textEdit.text;

//     final String apiUrl =
//         "http://54.162.54.241:8080/api/user/transfer"; // Replace with your API endpoint URL

//     try {
//       final response = await http.post(
//         Uri.parse(apiUrl),
//         body: jsonEncode({
//           'sourceAccountNumber': sender,
//           'destinationAccountNumber': reciever,
//           'amount': amnt
//         }),
//         headers: {'Content-Type': 'application/json'},
//       );

//       if (response.statusCode == 200) {
//         // Successful login
//         // You can parse the response JSON if the API returns user data
//         final responseData = json.decode(response.body);

//         print(response.body);
//         print(responseData);
//         var data = jsonDecode(response.body.toString());
//         print(data['responseMessage']);
//         if (data['responseMessage'] == 'Transfer Successful!') {
//           Util.snackBar("Congratulations", data['responseMessage']);
//           textacc.clear();
//           bePayAmntView.textEdit.clear();
//         } else {
//           Util.snackBar("Oops", data['responseMessage']);
//           textacc.clear();
//           bePayAmntView.textEdit.clear();
//         }
//       } else {
//         Util.snackBar(
//             "Payment Transfer failed", "Please check your credentials.");
//         textacc.clear();
//         bePayAmntView.textEdit.clear();
//       }
//     } catch (e) {
//       Util.snackBar('Error', 'An error occurred. Please try again later.');
//       textacc.clear();
//       bePayAmntView.textEdit.clear();
//     }
//   }
// }
