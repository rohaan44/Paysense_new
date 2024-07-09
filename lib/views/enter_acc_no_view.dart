import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:paysense/utils/colors.dart';
import 'package:paysense/utils/images.dart';
import 'package:paysense/viewmodel/enter_acc_no_viewmodel.dart';
import 'package:paysense/views/after_pay_amnt_view.dart';
import 'package:paysense/widgets/buttons.dart';
import 'package:paysense/widgets/ui.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

// ignore: must_be_immutable
class EnterAccNo extends StatelessWidget {
  String namee;
  String imgg;
  EnterAccNo({super.key, required this.namee, required this.imgg});

  @override
  Widget build(BuildContext context) {
    EnterAccController enterAccController = Get.put(EnterAccController());
    final isDarkMode = Theme.of(context).brightness == Brightness.dark;

    return SafeArea(
      child: Scaffold(
        body: Stack(
          children: [
            const Uitemplate(),
            Column(children: [
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
              Padding(
                padding: const EdgeInsets.only(
                  left: 30,
                ),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "Enter account number",
                    style: GoogleFonts.poppins(
                      fontSize: 22.sp,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                child: ListTile(
                  leading: CircleAvatar(
                    backgroundColor: ColorUtil.whitecolor,
                    backgroundImage: AssetImage(imgg),
                  ),
                  title: Text(
                    namee,
                    style: const TextStyle(
                        fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 35, top: 5),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "Account number",
                    style: GoogleFonts.poppins(
                      fontSize: 19.sp,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 35, vertical: 10),
                child: SizedBox(
                  height: 40,
                  child: TextField(
                    controller: enterAccController.textacc,
                    onTap: () => enterAccController.openModal(context),
                    readOnly: true,
                    decoration: InputDecoration(
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                        borderSide: BorderSide(
                          color: ColorUtil.bordercolor,
                          width: 1,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              // Padding(
              //   padding:
              //       const EdgeInsets.symmetric(horizontal: 35, vertical: 40),
              //   child: GestureDetector(
              //     onTap: () {
              //       Navigator.push(
              //           context,
              //           MaterialPageRoute(
              //               builder: (BuildContext context) => AfterPayAmntView(
              //                     imgg: imgg,
              //                   )));
              //       enterAccController.verifyPhoneNumber();
              //     },
              //     child: Container(
              //       width: MediaQuery.of(context).size.width * 1,
              //       height: MediaQuery.of(context).size.height * 0.09,
              //       decoration: BoxDecoration(
              //         boxShadow: const [
              //           BoxShadow(
              //               color: Color(0xff55a3fe),
              //               spreadRadius: 1,
              //               blurRadius: 15)
              //         ],
              //         color: const Color(0xff55a3fe),
              //         borderRadius: BorderRadius.circular(15),
              //       ),
              //       child: Padding(
              //         padding: const EdgeInsets.symmetric(horizontal: 25),
              //         child: Row(
              //           mainAxisAlignment: MainAxisAlignment.spaceBetween,
              //           children: [
              //             Text(
              //               "Continue",
              //               style: GoogleFonts.poppins(
              //                   fontSize: 20.sp,
              //                   fontWeight: FontWeight.w500,
              //                   color: ColorUtil.whitecolor),
              //             ),
              //             Icon(
              //               Icons.arrow_forward_sharp,
              //               size: 30,
              //               color: ColorUtil.whitecolor,
              //             ),
              //           ],
              //         ),
              //       ),
              //     ),
              //   ),
              // )
              SizedBox(height: Get.height * 0.05,),
              Obx(() {
                  return DummyButton(
                    isLoading: enterAccController.loading.value,
                    title: "Continue", clr: Colors.blue, onPress: ()=> enterAccController.verifyAccountNumber(), 
                    height: Get.height*0.08, width: Get.width * 0.84);
                }
              ),
            ]),
          ],
        ),
      ),
    );
  }
}
