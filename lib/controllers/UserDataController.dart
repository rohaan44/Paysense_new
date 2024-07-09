import 'package:get/get.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:developer';

class UserController extends GetxController {
  var userData = {}.obs;
  var isLoading = true.obs;
  var errorMessage = ''.obs;

  FirebaseFirestore firestore = FirebaseFirestore.instance;

  void fetchUserData(String phoneNumber) async {
    try {
      isLoading.value = true;
      errorMessage.value = '';
      
      QuerySnapshot querySnapshot = await firestore
          .collection('users')
          .where('phoneNumber', isEqualTo: phoneNumber)
          .get();
      
      if (querySnapshot.docs.isNotEmpty) {
        userData.value = querySnapshot.docs.first.data() as Map<String, dynamic>;
        log('User data fetched: ${userData.value}');
      } else {
        errorMessage.value = 'No user found for phone number: $phoneNumber';
        log('No user found for phone number: $phoneNumber');
      }
    } catch (e) {
      errorMessage.value = 'Failed to fetch user data: $e';
      log('Failed to fetch user data: $e');
    } finally {
      isLoading.value = false;
    }
  }

  Future<void> retrieveUserDataLocally() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String email = prefs.getString('email') ?? '';
    String username = prefs.getString('username') ?? '';
    String phoneNumber = prefs.getString('phoneNumber') ?? '';
    String pin = prefs.getString('pin') ?? '';
    String formattedNumber = prefs.getString('amount') ?? '';

    // Assign the retrieved data to userData
    userData.value = {
      'email': email,
      'username': username,
      'phoneNumber': phoneNumber,
      'pin': pin,
      'amount': formattedNumber,
    };

    // Log the retrieved data
    log('Locally retrieved user data: $userData');

  }
@override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    retrieveUserDataLocally();
  }
}