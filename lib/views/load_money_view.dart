import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:paysense/utils/colors.dart';
import 'package:paysense/utils/images.dart';
import 'package:paysense/widgets/ui.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../viewmodel/login_viewmodel.dart';

class LoadMoneyView extends StatelessWidget {
  const LoadMoneyView({super.key});

  @override
  Widget build(BuildContext context) {
    final isDarkMode = Theme.of(context).brightness == Brightness.dark;
    final LoginController loginController = Get.put(LoginController());

    return SafeArea(
      child: Scaffold(
        body: Stack(
          children: [
            const Uitemplate(),
            Column(
              children: [
                Padding(
                  padding:
                      const EdgeInsets.only(left: 35, top: 45.0, bottom: 20),
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
                  padding: const EdgeInsets.only(left: 35, top: 16),
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      "Load Money",
                      style: GoogleFonts.poppins(
                        fontSize: 23.5.sp,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 35, vertical: 10),
                  child: RichText(
                      text: TextSpan(children: [
                    TextSpan(
                        text: 'Rs. 200,000',
                        style: GoogleFonts.poppins(
                            fontSize: 18.sp,
                            color: ColorUtil.bgblue,
                            fontWeight: FontWeight.w500)),
                    TextSpan(
                        text: ' incoming limit left this month ',
                        style: GoogleFonts.poppins(
                          fontSize: 16.8.sp,
                          fontWeight: FontWeight.w400,
                          color: isDarkMode ? Colors.white : Colors.black87,
                        )),
                  ])),
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 35, vertical: 17),
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Text('Receive local transfers',
                        style: GoogleFonts.poppins(
                            fontSize: 19.sp, fontWeight: FontWeight.w500)),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 35,
                  ),
                  child: GestureDetector(
                    onTap: () {
                      Get.toNamed('CardView');
                    },
                    child: Container(
                      width: MediaQuery.of(context).size.width * 1,
                      height: MediaQuery.of(context).size.height * 0.18,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        border: Border.all(
                            color: ColorUtil.containercolor, width: 2),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.only(top: 17, left: 15),
                        child: Column(
                          children: [
                            Align(
                              alignment: Alignment.centerLeft,
                              child: Text('My Pay Sense account number',
                                  style: GoogleFonts.poppins(
                                      fontSize: 15.5.sp,
                                      fontWeight: FontWeight.w500)),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 8, bottom: 6),
                              child: Align(
                                alignment: Alignment.centerLeft,
                                child: Text(
                                    loginController.jsonData['accountInfo']
                                        ['accountNumber'],
                                    style: GoogleFonts.poppins(
                                        fontSize: 18.5.sp,
                                        fontWeight: FontWeight.w500)),
                              ),
                            ),
                            Row(
                              children: [
                                Icon(
                                  Icons.copy,
                                  color: ColorUtil.bgblue,
                                ),
                                Text('  Copy',
                                    style: GoogleFonts.poppins(
                                        fontSize: 17.sp,
                                        fontWeight: FontWeight.w500,
                                        color: ColorUtil.bgblue)),
                              ],
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
