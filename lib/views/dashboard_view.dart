import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:paysense/controllers/BePay_Controller.dart';
import 'package:paysense/controllers/Registration_controller.dart';
import 'package:paysense/controllers/UserDataController.dart';
import 'package:paysense/utils/images.dart';
import 'package:paysense/widgets/round_button.dart';
import 'package:paysense/widgets/tabbar.dart';
import 'package:paysense/widgets/ui.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class DashView extends StatelessWidget {
  DashView({super.key});

  final BePayAmnt_Controller bepay = BePayAmnt_Controller();
  final Register_Controller register_controller =
      Get.put(Register_Controller());
  final UserController userController = Get.put(UserController());

  @override
  Widget build(BuildContext context) {
    final isDarkMode = Theme.of(context).brightness == Brightness.dark;

    return SafeArea(
      child: Scaffold(
        body: FutureBuilder(
          future: userController.retrieveUserDataLocally(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(child: CircularProgressIndicator());
            } else if (snapshot.hasError) {
              return Center(child: Text('Error: ${snapshot.error}'));
            } else {
              final phoneNumber = userController.userData['phoneNumber'];
              if (phoneNumber != null && phoneNumber.isNotEmpty) {
                userController.fetchUserData(phoneNumber);
              }
              return ListView(
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
                                    color: isDarkMode
                                        ? Colors.white
                                        : Colors.black87,
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
                                return Center(child: CircularProgressIndicator());
                              } else if (userController.errorMessage.isNotEmpty) {
                                return Center(child: Text(userController.errorMessage.value));
                              } else if (userController.userData.isEmpty) {
                                return Center(child: Text('No data available'));
                              } else {
                                var userData = userController.userData.value;
                                return Text(userData['amount'],
                                    style: GoogleFonts.poppins(
                                        fontSize: 30.sp,
                                        height: 1.15,
                                        fontWeight: FontWeight.w500));
                              }
                            }),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 6.0),
                            child: Obx(() {
                              if (userController.isLoading.value) {
                                return Center(child: CircularProgressIndicator());
                              } else if (userController.errorMessage.isNotEmpty) {
                                return Center(child: Text(userController.errorMessage.value));
                              } else if (userController.userData.isEmpty) {
                                return Center(child: Text('No data available'));
                              } else {
                                var userData = userController.userData.value;
                                return Text('Wallet Id : ${userData['phoneNumber']} ',
                                    style: GoogleFonts.poppins(
                                      fontSize: 15.sp,
                                      fontWeight: FontWeight.w500,
                                    ));
                              }
                            }),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 30, right: 30, top: 20),
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
              );
            }
          },
        ),
      ),
    );
  }
}
