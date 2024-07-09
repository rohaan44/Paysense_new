import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:paysense/utils/util.dart';
import 'package:paysense/views/login_view.dart';

class DrawController extends GetxController {
  changetheme(BuildContext context) {
    Get.isDarkMode
        ? Get.changeTheme(ThemeData.light())
        : Get.changeTheme(ThemeData.dark());
  }

  signOutUser(BuildContext context) async {
    FirebaseAuth auth = FirebaseAuth.instance;
    try {
      await auth.signOut();
      // ignore: use_build_context_synchronously
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => LoginView()));
      // ignore: use_build_context_synchronously
      Util.snackBar(
        "Congratulations",
        "SignOut Successfully",
      );
      if (kDebugMode) {
        print('SignOut Successfully');
      }
    } catch (e) {
      Util.snackBar("Error in SignOut", "try Again");
      if (kDebugMode) {
        print('Error in SignOut: $e');
      }
    }
  }
}
