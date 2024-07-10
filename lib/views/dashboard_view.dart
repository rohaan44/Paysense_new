import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:paysense/controllers/UserDataController.dart';
import 'package:paysense/utils/images.dart';
import 'package:paysense/widgets/round_button.dart';
import 'package:paysense/widgets/tabbar.dart';
import 'package:paysense/widgets/ui.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class DashView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final UserController userController = Get.put(UserController());
final isDarkMode = Theme.of(context).brightness == Brightness.dark;
    Future<void> _refreshScreen() async {
      await userController.fetchUserData();
    }

    return GetBuilder<UserController>(
      builder: (controller) => SafeArea(
        child: Scaffold(
          body: RefreshIndicator(
            onRefresh: _refreshScreen,
            child: ListView(
              children: [
                Stack(
                  children: [
                    const Uitemplate(),
                    Column(
                      children: [
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
                        Center(
                          child: Obx(() {
                            if (userController.isLoading.value) {
                              return Center(
                                child: LoadingAnimationWidget.staggeredDotsWave(
                                   color: Colors.blue,
                                size: 50,
                                ),
                              );
                            } else if (userController.errorMessage.isNotEmpty) {
                              log('Error: ${userController.errorMessage.value}');
                              return Center(
                                child: Text(userController.errorMessage.value),
                              );
                            } else {
                              var userData = controller.userData.value;
                              return Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    "Rs. ${userData['amount']}",
                                    style: GoogleFonts.inter(
                                      fontSize: 30.sp,
                                      height: 1.15,
                                      fontWeight: FontWeight.w400,
                                    ),
                                  ),
                                  const SizedBox(height: 6),
                                  Text(
                                    'Wallet Id : ${userData['phoneNumber']}',
                                    style: GoogleFonts.poppins(
                                      fontSize: 15.sp,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                  const SizedBox(
                                      height: 6), // Adjust spacing as needed
                                ],
                              );
                            }
                          }),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                              left: 30, right: 30, top: 20),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              GestureDetector(
                                onTap: () {
                                  Get.toNamed('/BePayAmntView');
                                },
                                child: RoundButton(
                                  iconn: Icons.call_made_outlined,
                                  title: " Send\nMoney",
                                ),
                              ),
                              GestureDetector(
                                onTap: () {
                                  Get.toNamed("/RequestMoneyView");
                                },
                                child: RoundButton(
                                  iconn: Icons.call_received_outlined,
                                  title: "Request\n Money",
                                ),
                              ),
                              GestureDetector(
                                onTap: () {
                                  Get.toNamed("/LoadMoneyView");
                                },
                                child: RoundButton(
                                  iconn: Icons.refresh,
                                  title: " Load\nMoney",
                                ),
                              ),
                              RoundButton(
                                iconn: Icons.shopping_bag_outlined,
                                title: "Shop\nNow",
                              ),
                            ],
                          ),
                        ),
                        const TabBarVieww(),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
