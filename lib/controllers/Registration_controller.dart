import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:paysense/views/login_view.dart';
import 'package:intl/intl.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Register_Controller extends GetxController {
  final RxBool isLoading = false.obs;
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController phoneNumberController = TextEditingController();
  final TextEditingController pinController = TextEditingController();
  var isHiddenPassword = true.obs;

  Future<void> register() async {
    if (!formKey.currentState!.validate()) {
      return;
    }

    final String email = emailController.text.trim();
    final String username = usernameController.text.trim();
    final String phoneNumber = phoneNumberController.text.trim();
    final String pin = pinController.text.trim();
    // Ensure the pin is at least 6 characters long
    final String adjustedPin = pin.padRight(6, '0');
    const int amount = 5000;
    var formatter = NumberFormat('#,###');
    String formattedNumber = formatter.format(amount);
    try {
      isLoading.value = true;

      // Check if the username is already taken
      final QuerySnapshot result = await FirebaseFirestore.instance
          .collection('users')
          .where('email', isEqualTo: email)
          .get();

      if (result.docs.isNotEmpty) {
        Get.snackbar('Error',
            'The username is already taken. Please choose another one.',
            snackPosition: SnackPosition.BOTTOM);
        isLoading.value = false;
        return;
      }

      // Create user with email and password
      UserCredential userCredential =
          await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email,
        password: adjustedPin,
      );

      await FirebaseFirestore.instance
          .collection('users')
          .doc(phoneNumber)
          .set({
        'email': email,
        'username': username,
        'phoneNumber': phoneNumber,
        'pin': pin,
        'amount': formattedNumber,
      });

      // Save user data locally
      await saveUserDataLocally(email, username, phoneNumber, pin, formattedNumber);

      Get.snackbar(
        'Success',
        'Registration successful',
        snackPosition: SnackPosition.BOTTOM,
      );
      Get.to(LoginView());
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        Get.snackbar('Error', 'The password provided is too weak.',
            snackPosition: SnackPosition.BOTTOM);
      } else if (e.code == 'email-already-in-use') {
        Get.snackbar('Error', 'The account already exists for that email.',
            snackPosition: SnackPosition.BOTTOM);
      }
    } catch (e) {
      Get.snackbar('Error', 'Error: $e', snackPosition: SnackPosition.BOTTOM);
    } finally {
      isLoading.value = false;
    }
  }

  Future<void> saveUserDataLocally(String email, String username,
      String phoneNumber, String pin, String formattedNumber) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String existingEmail = prefs.getString('email') ?? '';
    if (existingEmail.isNotEmpty && existingEmail == email) {
      Get.snackbar(
          'Error', 'User with the same email is already registered locally.',
          snackPosition: SnackPosition.BOTTOM);
    } else {
      await prefs.setString('email', email);
      await prefs.setString('username', username);
      await prefs.setString('phoneNumber', phoneNumber);
      await prefs.setString('pin', pin);
      await prefs.setString('amount', formattedNumber);
      log('User data saved locally.');

      // Verify saved data
      log('Saved Email: ${prefs.getString('email')}');
      log('Saved Username: ${prefs.getString('username')}');
      log('Saved PhoneNumber: ${prefs.getString('phoneNumber')}');
      log('Saved Pin: ${prefs.getString('pin')}');
      log('Saved Amount: ${prefs.getString('amount')}');
    }
  }

  @override
  void onClose() {
    emailController.dispose();
    usernameController.dispose();
    phoneNumberController.dispose();
    pinController.dispose();
    super.onClose();
  }
}
