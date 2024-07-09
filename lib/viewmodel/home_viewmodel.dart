import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  changetheme(BuildContext context) {
    Get.isDarkMode
        ? Get.changeTheme(ThemeData.light())
        : Get.changeTheme(ThemeData.dark());
  }
}
