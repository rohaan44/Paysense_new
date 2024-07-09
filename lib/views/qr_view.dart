import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:paysense/utils/colors.dart';
import 'package:paysense/utils/images.dart';
import 'package:paysense/widgets/ui.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class QRView extends StatelessWidget {
  const QRView({super.key});

  @override
  Widget build(BuildContext context) {
    final isDarkMode = Theme.of(context).brightness == Brightness.dark;
    return SafeArea(
      child: Scaffold(
        body: ListView(children: [
          Stack(
            children: [
              const Uitemplate(),
              Column(children: [
                Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 35, vertical: 45.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      GestureDetector(
                        onTap: () {
                          Get.toNamed('/DrawerView');
                        },
                        child: Image.asset(
                          DummyImg.icon,
                          color: isDarkMode ? Colors.white : Colors.black87,
                          width: 32,
                          height: 32,
                        ),
                      ),
                      Text(
                        'Pay Sense',
                        style: GoogleFonts.poppins(
                          fontSize: 23.sp,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          Get.toNamed('/NotiView');
                        },
                        child: const Icon(
                          Icons.notifications_none_outlined,
                          size: 35,
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 30.0),
                  child: Stack(
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 50),
                        child: Card(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(25)),
                          child: Container(
                            height: MediaQuery.of(context).size.height * 0.46,
                            width: MediaQuery.of(context).size.width * 1,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(25),
                              color: const Color(0xff515155),
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Image.asset(
                                  DummyImg.qr,
                                  width: 60.sp,
                                ),
                                Text('@Muhammad Shakir',
                                    style: GoogleFonts.poppins(
                                        fontSize: 18.sp,
                                        color: Colors.white,
                                        fontWeight: FontWeight.w500)),
                              ],
                            ),
                          ),
                        ),
                      ),
                      FractionalTranslation(
                        translation: const Offset(0.0, -0.4),
                        child: Align(
                          alignment: const FractionalOffset(0.5, 0.0),
                          child: CircleAvatar(
                            radius: 35.0,
                            backgroundImage: AssetImage(DummyImg.dp),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 50, right: 50, top: 30),
                  child: Container(
                    height: MediaQuery.of(context).size.height * 0.075,
                    width: MediaQuery.of(context).size.width * 1,
                    decoration: BoxDecoration(
                      color: ColorUtil.bgcolor,
                      borderRadius: BorderRadius.circular(25),
                    ),
                    child: Center(
                      child: Text(
                        "Scan QR",
                        style: GoogleFonts.poppins(
                            fontSize: 22,
                            fontWeight: FontWeight.w400,
                            color: Colors.white),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(
                      left: 50, right: 50, top: 14, bottom: 40),
                  child: Container(
                    height: MediaQuery.of(context).size.height * 0.075,
                    width: MediaQuery.of(context).size.width * 1,
                    decoration: BoxDecoration(
                      color: const Color(0xFFFFFFFF),
                      borderRadius: BorderRadius.circular(25),
                    ),
                    child: Center(
                      child: Text(
                        "Share your QR",
                        style: GoogleFonts.poppins(
                            fontSize: 22,
                            fontWeight: FontWeight.w400,
                            color: Colors.black),
                      ),
                    ),
                  ),
                ),
              ]),
            ],
          ),
        ]),
      ),
    );
  }
}
