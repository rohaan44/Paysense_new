

import 'dart:developer';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:paysense/utils/colors.dart';
import 'package:paysense/utils/images.dart';
import 'package:paysense/viewmodel/trans_confirm_viewmodel.dart';
import 'package:paysense/widgets/fingerprint_keyboard.dart';
import 'package:paysense/widgets/ui.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class TransConfirmView extends StatelessWidget {
  const TransConfirmView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final transController = TransConfirmontroller();
    final isDarkMode = Theme.of(context).brightness == Brightness.dark;
                        

    return SafeArea(
      child: Scaffold(
        body: Stack(
          children: [
            const Uitemplate(),
            Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 35, top: 45.0, bottom: 20),
                  child: Row(
                    children: [
                      GestureDetector(
                        onTap: () {
                          Get.back();
                        },
                        child: Image.asset(
                          DummyImg.chevleft,
                          width: 32,
                          height: 32,
                          color: isDarkMode ? Colors.white : Colors.black87,
                        ),
                      ),
                    ],
                  ),
                ),
                Text(
                  "Enter your PIN",
                  style: GoogleFonts.poppins(
                    fontSize: 22.sp,
                    fontWeight: FontWeight.w500,
                    letterSpacing: 1.12,
                  ),
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 45, vertical: 30),
                  child: PinCodeTextField(
                    appContext: context,
                    length: 4,
                    keyboardType: TextInputType.none,
                    obscureText: false,
                    animationType: AnimationType.fade,
                    pinTheme: PinTheme(
                        shape: PinCodeFieldShape.underline,
                        borderRadius: BorderRadius.circular(5),
                        fieldHeight: 40,
                        fieldWidth: 40,
                        activeFillColor:
                            isDarkMode ? Colors.black87 : Colors.white,
                        inactiveFillColor: ColorUtil.whitecolor.withOpacity(0.05),
                        inactiveColor: ColorUtil.bgblue,
                        inactiveBorderWidth: 10),
    
                    animationDuration: const Duration(milliseconds: 300),
                    enableActiveFill: true,
                    // errorAnimationController: errorController,
                    controller: transController.textControl,
                    onCompleted: (v) {
                      if (kDebugMode) {
                        transController.VerifyPin();
                      }
                    },
                    onChanged: (value) {
                      if (kDebugMode) {
                        print(value);
                      }
                      // transController.inputText = value;
                    },
                    beforeTextPaste: (text) {
                      if (kDebugMode) {
                        print("Allowing to paste $text");
                      }
                      //if you return true then it will show the paste confirmation dialog. Otherwise if false, then nothing will happen.
                      //but you can show anything you want here, like your pop up saying wrong paste format or etc
                      return true;
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 30),
                  child: Text(
                    "Forget PIN?",
                    style: GoogleFonts.poppins(
                      fontSize: 17.sp,
                      fontWeight: FontWeight.w500,
                      letterSpacing: 1.12,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 30.0),
                  child: FingerKeypad(
                    onPress: () {
                      // Get.toNamed("/TransScriptView");
                    },
                    onKeyPressed: (value) {
                      if (value == '⌫') {
                        if (transController.textControl.text.isNotEmpty) {
                          transController.textControl.text =
                              transController.textControl.text.substring(
                            0,
                            transController.textControl.text.length - 1,
                          );
                        }
                      } else {
                        transController.textControl.text += value;
                      }
                      transController.onTextChanged(
                        transController.textControl.text,
                      );
                    },
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
