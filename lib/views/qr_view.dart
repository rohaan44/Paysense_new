import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:paysense/controllers/UserDataController.dart';
import 'package:paysense/utils/colors.dart';
import 'package:paysense/utils/images.dart';
import 'package:paysense/widgets/ui.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:qr_flutter/qr_flutter.dart'; 

class QRView extends StatelessWidget {
  const QRView({super.key});

  @override
  Widget build(BuildContext context) {
    final isDarkMode = Theme.of(context).brightness == Brightness.dark;
    String accountNumber = '1234567890'; // Your account number
final UserController userController = Get.find<UserController>();
    return GetBuilder<UserController>(
      builder:(controller) => SafeArea(
          child: Scaffold(
            body: Stack(children: [
              const Uitemplate(),
              ListView(
                children: [
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
                                  color: Color.fromARGB(71, 81, 81, 85),
                                ),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                  children: [
                                    Obx(() {
                                      if (userController.isLoading.value) {
                              return Center(
                                child: LoadingAnimationWidget.staggeredDotsWave(
                                   color: Colors.blue,
                                size: 50,
                                ),
                              );
                            }else if (userController.errorMessage.isNotEmpty) {
                              log('Error: ${userController.errorMessage.value}');
                              return Center(
                                child: Text(userController.errorMessage.value),
                              );
                            } else {
                              var userData = controller.userData.value;
                              log(userData['phoneNumber']); 
                             return QrImageView(
                                          data: userData['phoneNumber'], // Embed account number here
                                          version: QrVersions.auto,
                                          size: 60.sp,
                                        );
                                      }
  }),
                                    Obx(() {
                                      var userData = controller.userData.value;
                                        return Text('${userData['fullName']}',
                                            style: GoogleFonts.poppins(
                                                fontSize: 18.sp,
                                                color: Colors.white,
                                                fontWeight: FontWeight.w500));
                                      }
                                    ),
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
        ));
      }
  }
