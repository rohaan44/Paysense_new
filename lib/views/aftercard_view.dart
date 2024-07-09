import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:paysense/utils/colors.dart';
import 'package:paysense/viewmodel/login_viewmodel.dart';
import 'package:paysense/widgets/ui.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:switcher_button/switcher_button.dart';

import '../utils/images.dart';

class CardView extends StatelessWidget {
  const CardView({super.key});

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
                                child: Text(
                                  loginController.jsonData['accountInfo']
                                      ['accountName'],
                                  style: GoogleFonts.poppins(
                                      fontSize: 19.sp,
                                      fontWeight: FontWeight.w400,
                                      fontStyle: FontStyle.normal,
                                      color: Colors.white),
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
                        GestureDetector(
                          onTap: () {
                            Get.toNamed('/BeCardView');
                          },
                          child: Column(
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
                        ),
                      ],
                    ),
                  )
                ]),
                ListTile(
                  leading: CircleAvatar(
                    backgroundColor: ColorUtil.bgcolor,
                    radius: 35,
                    child: Image.asset(
                      DummyImg.money,
                      width: 32,
                    ),
                  ),
                  title: Text(
                    'Spending Control',
                    style: GoogleFonts.poppins(
                      fontSize: 18,
                      fontWeight: FontWeight.w400,
                      fontStyle: FontStyle.normal,
                    ),
                  ),
                  subtitle: Text(
                    'Set a monthly spending limit of your debit card.',
                    style: GoogleFonts.poppins(
                      fontSize: 10,
                      fontWeight: FontWeight.w400,
                      fontStyle: FontStyle.normal,
                    ),
                  ),
                  trailing: SwitcherButton(
                    size: 40,
                    offColor: ColorUtil.dividercolor,
                  ),
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 60, vertical: 5),
                  child: Divider(
                    color: ColorUtil.dividercolor,
                    thickness: 0.6,
                  ),
                ),
                ListTile(
                  leading: CircleAvatar(
                      backgroundColor: ColorUtil.bgcolor,
                      radius: 35,
                      child: Icon(
                        Icons.watch_later_outlined,
                        color: isDarkMode ? Colors.white : Colors.white,
                        size: 35,
                      )),
                  title: Text(
                    'Card Transactions',
                    style: GoogleFonts.poppins(
                      fontSize: 18,
                      fontWeight: FontWeight.w400,
                      fontStyle: FontStyle.normal,
                    ),
                  ),
                  subtitle: Text(
                    'Track and monitor your expenses',
                    style: GoogleFonts.poppins(
                      fontSize: 10,
                      fontWeight: FontWeight.w400,
                      fontStyle: FontStyle.normal,
                    ),
                  ),
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 60, vertical: 5),
                  child: Divider(
                    color: ColorUtil.dividercolor,
                    thickness: 0.6,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 30, top: 6),
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      'Card Limit',
                      style: GoogleFonts.poppins(
                        fontSize: 20.sp,
                        fontWeight: FontWeight.w400,
                        fontStyle: FontStyle.normal,
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 30),
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      'Daily Online Transactions',
                      style: GoogleFonts.poppins(
                        fontSize: 18.sp,
                        fontWeight: FontWeight.w500,
                        fontStyle: FontStyle.normal,
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 40, vertical: 3),
                  child: Divider(
                    color: ColorUtil.dividercolor,
                    thickness: 4,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 28),
                  child: ListTile(
                    leading: Column(
                      children: [
                        Text(
                          'Rs. 0',
                          style: GoogleFonts.poppins(
                            fontSize: 18.sp,
                            fontWeight: FontWeight.w500,
                            fontStyle: FontStyle.normal,
                          ),
                        ),
                        Text(
                          'Spent',
                          style: GoogleFonts.poppins(
                            fontSize: 16.sp,
                            fontWeight: FontWeight.w300,
                            fontStyle: FontStyle.normal,
                          ),
                        ),
                      ],
                    ),
                    trailing: Text(
                      'Rs. 200,000',
                      style: GoogleFonts.poppins(
                        fontSize: 18.sp,
                        fontWeight: FontWeight.w500,
                        fontStyle: FontStyle.normal,
                      ),
                    ),
                  ),
                )
              ],
            ),
          ]),
        ]),
      ),
    );
  }
}
