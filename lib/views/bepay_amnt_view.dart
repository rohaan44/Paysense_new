import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:paysense/controllers/BePay_Controller.dart';
import 'package:paysense/utils/images.dart';
import 'package:paysense/viewmodel/bepay_amnt_viemodel.dart';
import 'package:paysense/views/send_money_view.dart';
import 'package:paysense/widgets/custom_keypad.dart';
import 'package:paysense/widgets/ui.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class BePayAmnt extends StatelessWidget {
  BePayAmnt({super.key});
final BePayAmnt_Controller bepay = BePayAmnt_Controller();
  @override
  Widget build(BuildContext context) {
    final isDarkMode = Theme.of(context).brightness == Brightness.dark;
    final BePayAmntController bePayAmntView = Get.put(BePayAmntController());
    return SafeArea(
      child: Scaffold(
        body: Stack(children: [
          const Uitemplate(),
          Column(
            children: [
               Padding(
              padding:
                  const EdgeInsets.only(left: 35, top: 38.0, bottom: 30),
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
                    Padding(
                      padding: const EdgeInsets.only(left: 55),
                      child: getAmount(), 
                      // Text(
                      //   "Current Balance \n \t\t\t\t\t\t\t10,000",
                      //   style: GoogleFonts.poppins(
                      //     height: 1.7,
                      //     fontSize: 18.sp,
                      //     fontWeight: FontWeight.w500,
                      //   ),
                      // ),
                    ),
                  ],
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Rs.  ",
                    style: GoogleFonts.poppins(
                      fontSize: 30,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  SizedBox(
                    width: 150,
                    child: Obx(
                      () => TextField(
                        onChanged: (newText) {
                          bePayAmntView.onTextChanged(newText);
                        },
                        controller: bePayAmntView.textEdit,
                        keyboardType: TextInputType.none,
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: '0',
                          hintStyle: TextStyle(
                            fontSize: 40,
                            color: isDarkMode ? Colors.white : Colors.black87,
                          ),
                          // errorText: bePayAmntView.showError.value
                          //     ? 'Value must be <= 200000'
                          //     : null,
                        ),
                        style:
                            TextStyle(fontSize: bePayAmntView.fontSize.value),
                      ),
                    ),
                  )
                ],
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 30.0),
                child: CustomKeyboard(
                  height: 2,
                  onKeyPressed: (value) {
                    if (value == '⌫') {
                      if (bePayAmntView.textEdit.text.isNotEmpty) {
                        bePayAmntView.textEdit.text =
                            bePayAmntView.textEdit.text.substring(
                                0, bePayAmntView.textEdit.text.length - 1);
                      }
                    } else {
                      bePayAmntView.textEdit.text += value;
                    }
                    bePayAmntView.onTextChanged(bePayAmntView.textEdit.text);
                  },
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 35, vertical: 25),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Obx(
                      () => GestureDetector(
                        onTap: () {},
                        child: Container(
                          width: MediaQuery.of(context).size.width * 0.35,
                          height: MediaQuery.of(context).size.height * 0.07,
                          decoration: BoxDecoration(
                            color: bePayAmntView.isButtonEnabled.value
                                ? const Color(0xff75b3fc)
                                : Colors.grey,
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: const Center(
                            child: Text(
                              "Request",
                              style: TextStyle(
                                  fontSize: 20,
                                  color: Colors.black,
                                  fontWeight: FontWeight.w400,
                                  letterSpacing: 0.8),
                            ),
                          ),
                        ),
                      ),
                    ),
                    Obx(
                      () => GestureDetector(
                        onTap: () {
                          bePayAmntView.isButtonEnabled.value
                              ? Get.to(()=>const SendMoney())
                              : null;
                        },
                        child: Container(
                          width: MediaQuery.of(context).size.width * 0.35,
                          height: MediaQuery.of(context).size.height * 0.07,
                          decoration: BoxDecoration(
                            color: bePayAmntView.isButtonEnabled.value
                                ? const Color(0xff75b3fc)
                                : Colors.grey,
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: const Center(
                            child: Text(
                              "Send",
                              style: TextStyle(
                                fontSize: 20,
                                letterSpacing: 0.8,
                                color: Colors.black,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ]),
      ),
    );
  }
Widget getAmount() {
    return StreamBuilder(
      stream: bepay.getUserAmount(),
      builder: (context, AsyncSnapshot<List<Map<String, dynamic>>> snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return CircularProgressIndicator();
        } else if (snapshot.hasError) {
          log(snapshot.error.toString());
          return Text('Error: ${snapshot.error}');
        } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
          return Text('No data available');
        } else {
          var amountData = snapshot.data!.first;
          return Text(
            'Current Balance \n \t\t\t\t\t\t\t Rs. ${amountData['amount']}',  // Adjust the key according to your data structure
            style: GoogleFonts.poppins(
                           height: 1.7,
                           fontSize: 18.sp,
                           fontWeight: FontWeight.w500,
            ),
          );
        }
      },
    );
  }
}
