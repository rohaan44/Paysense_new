import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:paysense/utils/colors.dart';
import 'package:paysense/utils/images.dart';
import 'package:paysense/widgets/ui.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../viewmodel/login_viewmodel.dart';

class BeCardView extends StatelessWidget {
  const BeCardView({super.key});

  @override
  Widget build(BuildContext context) {
    final LoginController loginController = Get.put(LoginController());
    final isDarkMode = Theme.of(context).brightness == Brightness.dark;
    return SafeArea(
      child: Scaffold(
          body: ListView(children: [
        Stack(children: [
          const Uitemplate(),
          Column(
            children: [
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 35, vertical: 45.0),
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
              Stack(children: [
                AspectRatio(
                  aspectRatio: 14 / 9, // Set your desired aspect ratio
                  child: Image.asset(DummyImg.card2),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 28.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(left: 20.0),
                              child: Image.asset(
                                DummyImg.logowhite,
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(
                                left: 20.0,
                              ),
                              child: Text(
                                'Holder Name',
                                style: GoogleFonts.poppins(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w300,
                                    fontStyle: FontStyle.normal,
                                    color: Colors.white),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 20),
                              child: Obx(
                                () => Text(
                                  loginController.jsonData['accountInfo']
                                      ['accountName'],
                                  style: GoogleFonts.poppins(
                                      fontSize: 19.sp,
                                      fontWeight: FontWeight.w400,
                                      fontStyle: FontStyle.normal,
                                      color: Colors.white),
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 20.0),
                              child: Text(
                                'Vault Id',
                                style: GoogleFonts.poppins(
                                    fontSize: 16.sp,
                                    fontWeight: FontWeight.w300,
                                    fontStyle: FontStyle.normal,
                                    color: Colors.white),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 20.0),
                              child: Text(
                                '*** *** **764',
                                style: GoogleFonts.poppins(
                                    fontSize: 21.sp,
                                    fontWeight: FontWeight.w400,
                                    fontStyle: FontStyle.normal,
                                    color: Colors.white),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Column(
                        children: [
                          Container(
                            width: 43.sp,
                            height: 25.sp,
                            decoration: BoxDecoration(
                              color: ColorUtil.bgcolor,
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: Center(
                              child: Text(
                                "view",
                                style: GoogleFonts.poppins(
                                  fontSize: 18.sp,
                                  color: Colors.white,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 45,
                          ),
                          Stack(children: [
                            Image.asset(
                              DummyImg.qr,
                              width: 100,
                            )
                          ]),
                        ],
                      ),
                    ],
                  ),
                )
              ]),

              Stack(children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25.0),
                  child: Image.asset(
                    DummyImg.cardyellow,
                    width: MediaQuery.of(context).size.width * 1,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 45.0, top: 60),
                  child: Padding(
                    padding: const EdgeInsets.only(right: 45.0),
                    child: Stack(
                      children: [
                        Align(
                          alignment: Alignment.centerRight,
                          child: Container(
                            width: MediaQuery.of(context).size.width * 0.26,
                            height: 37,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                color: Colors.white),
                            child: Center(
                              child: Text(
                                'Join Now⚡',
                                style: GoogleFonts.poppins(
                                    fontSize: 15.sp,
                                    fontWeight: FontWeight.w400,
                                    fontStyle: FontStyle.normal,
                                    color: Colors.black),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 10),
                  child: Column(
                    children: [
                      Text(
                        'Join 1% Club',
                        style: GoogleFonts.poppins(
                            fontSize: 20.sp,
                            fontWeight: FontWeight.w500,
                            fontStyle: FontStyle.normal,
                            color: Colors.white),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 35.0, top: 3),
                        child: Text(
                          'Unlock premium QR card by\njoining our 1% club.',
                          style: GoogleFonts.poppins(
                              fontSize: 15.sp,
                              fontWeight: FontWeight.w400,
                              fontStyle: FontStyle.normal,
                              color: Colors.white),
                        ),
                      ),
                    ],
                  ),
                ),
              ]),
              Stack(children: [
                Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 5.0, horizontal: 25),
                  child: Image.asset(DummyImg.cardgrey),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 45.0, top: 60),
                  child: Padding(
                    padding: const EdgeInsets.only(right: 45.0),
                    child: Stack(
                      children: [
                        Align(
                          alignment: Alignment.centerRight,
                          child: Container(
                            width: MediaQuery.of(context).size.width * 0.26,
                            height: 37,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                color: Colors.white),
                            child: Center(
                              child: Text(
                                'Join Now⚡',
                                style: GoogleFonts.poppins(
                                    fontSize: 15.sp,
                                    fontWeight: FontWeight.w500,
                                    fontStyle: FontStyle.normal,
                                    color: Colors.black),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 10),
                  child: Column(
                    children: [
                      Text(
                        'Join 10% Club',
                        style: GoogleFonts.poppins(
                            fontSize: 20.sp,
                            fontWeight: FontWeight.w500,
                            fontStyle: FontStyle.normal,
                            color: Colors.white),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 35.0, top: 3),
                        child: Text(
                          'Unlock customized QR card by\njoining our 10% club.',
                          style: GoogleFonts.poppins(
                              fontSize: 15.sp,
                              fontWeight: FontWeight.w400,
                              fontStyle: FontStyle.normal,
                              color: Colors.white),
                        ),
                      ),
                    ],
                  ),
                ),
              ]),
              Stack(children: [
                Padding(
                  padding: const EdgeInsets.only(
                      left: 25.0, right: 25.0, bottom: 15),
                  child: Image.asset(DummyImg.cardblue),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 45.0, top: 60),
                  child: Padding(
                    padding: const EdgeInsets.only(right: 45.0),
                    child: Stack(
                      children: [
                        Align(
                          alignment: Alignment.centerRight,
                          child: Container(
                            width: MediaQuery.of(context).size.width * 0.26,
                            height: 37,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                color: Colors.white),
                            child: Center(
                              child: Text(
                                'Order Now👈',
                                style: GoogleFonts.poppins(
                                    fontSize: 15.sp,
                                    fontWeight: FontWeight.w500,
                                    fontStyle: FontStyle.normal,
                                    color: Colors.black),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 10),
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 27.0),
                        child: Text(
                          'Order your card',
                          style: GoogleFonts.poppins(
                              fontSize: 20.sp,
                              fontWeight: FontWeight.w500,
                              fontStyle: FontStyle.normal,
                              color: Colors.white),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 35.0, top: 3),
                        child: Text(
                          'Order your Pay Sense QR card.',
                          style: GoogleFonts.poppins(
                              fontSize: 15.sp,
                              fontWeight: FontWeight.w400,
                              fontStyle: FontStyle.normal,
                              color: Colors.white),
                        ),
                      ),
                    ],
                  ),
                ),
              ]),
              // CardTemplate(
              //   title: "Join 1% Club",
              //   subtitle: "Unlock premium QR card by\njoining our 1% club.",
              //   imgg: Image.asset(
              //     DummyImg.contyellow,
              //   ),
              //   textt: 'Join Now⚡',
              // ),
              // CardTemplate(
              //   title: "Join 10% Club",
              //   subtitle: "Unlock customized QR card by\njoining our 10% club.",
              //   imgg: Image.asset(DummyImg.contgrey),
              //   textt: 'Join Now⚡',
              // ),
              // CardTemplate(
              //   title: "  Order you card",
              //   subtitle: "Order you Pay Sense QR card.",
              //   imgg: Image.asset(DummyImg.contblue),
              //   textt: 'Order Now👈',
              // ),
            ],
          ),
          //
        ])
      ])),
    );
  }
}
