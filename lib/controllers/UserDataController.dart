import 'package:get/get.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:developer';

class UserController extends GetxController {
  var userData = {}.obs;
  var isLoading = true.obs;
  var errorMessage = ''.obs;

  FirebaseFirestore firestore = FirebaseFirestore.instance;

  @override
  void onInit() {
    // Initial data fetch when controller is initialized
    fetchUserData(); // You can fetch user data here or in fetchUserData itself
    super.onInit();
  }

  Future <void> fetchUserData() async {
    try {
      isLoading.value = true;
      errorMessage.value = '';

      SharedPreferences prefs = await SharedPreferences.getInstance();
      String phoneNumber = prefs.getString('phoneNumber') ?? '';

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

}
