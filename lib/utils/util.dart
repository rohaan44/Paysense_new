import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:paysense/utils/colors.dart';

class Util {
  static void fieldFocusChange(
      BuildContext context, FocusNode current, FocusNode nextFocus) {
    current.unfocus();
    FocusScope.of(context).requestFocus(nextFocus);
  }

  static toastMessage(String message) {
    Fluttertoast.showToast(
      msg: message,
      backgroundColor: ColorUtil.blackcolor,
      textColor: ColorUtil.whitecolor,
      gravity: ToastGravity.BOTTOM,
      toastLength: Toast.LENGTH_LONG,
    );
  }

  static toastMessageCenter(String message) {
    Fluttertoast.showToast(
      msg: message,
      backgroundColor: ColorUtil.blackcolor,
      gravity: ToastGravity.CENTER,
      toastLength: Toast.LENGTH_LONG,
      textColor: ColorUtil.whitecolor,
    );
  }

  static snackBar(String title, String message,) {
    Get.snackbar(
      
      title,
      message,
      
    );

  }
}
