import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:paysense/utils/images.dart';
import 'package:paysense/viewmodel/drawer_viewmodel.dart';
import 'package:paysense/widgets/ui.dart';
import 'package:switcher_button/switcher_button.dart';

class SideBar extends StatelessWidget {
  SideBar({super.key});
  final DrawController drawController = Get.put(DrawController());

  @override
  Widget build(BuildContext context) {
    final isDarkMode = Theme.of(context).brightness == Brightness.dark;

    return SafeArea(
      child: Scaffold(
        body: Stack(children: [
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
                        Get.back();
                      },
                      child: Image.asset(
                        DummyImg.chevleft,
                        width: 35,
                        color: isDarkMode ? Colors.white : Colors.black87,
                      ),
                    ),
                    SwitcherButton(
                      size: 50,
                      onChange: (value) {
                        drawController.changetheme(context);
                      },
                    ),
                  ],
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 5, horizontal: 15),
                child: ListTile(
                  leading: CircleAvatar(
                    child: Image.asset(
                      DummyImg.dp,
                    ),
                  ),
                  title: Text(
                    'My Account',
                    style: GoogleFonts.poppins(
                      fontSize: 25,
                      fontWeight: FontWeight.w500,
                      fontStyle: FontStyle.normal,
                    ),
                  ),
                  subtitle: Text(
                    'Profile, Setting, & Mores',
                    style: GoogleFonts.poppins(
                      fontSize: 13,
                      fontWeight: FontWeight.w300,
                      fontStyle: FontStyle.normal,
                    ),
                  ),
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
                child: ListTile(
                    leading: Text(
                      'Account Settings',
                      style: GoogleFonts.poppins(
                        fontSize: 20,
                        fontWeight: FontWeight.w400,
                        fontStyle: FontStyle.normal,
                      ),
                    ),
                    trailing: const Icon(Icons.chevron_right)),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 15,
                ),
                child: ListTile(
                    leading: Text(
                      'Switch to Business',
                      style: GoogleFonts.poppins(
                        fontSize: 20,
                        fontWeight: FontWeight.w400,
                        fontStyle: FontStyle.normal,
                      ),
                    ),
                    trailing: const Icon(Icons.chevron_right)),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
                child: ListTile(
                    leading: Text(
                      'Account level',
                      style: GoogleFonts.poppins(
                        fontSize: 20,
                        fontWeight: FontWeight.w400,
                        fontStyle: FontStyle.normal,
                      ),
                    ),
                    trailing: const Icon(Icons.chevron_right)),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: ListTile(
                    leading: Text(
                      'My Favorites',
                      style: GoogleFonts.poppins(
                        fontSize: 20,
                        fontWeight: FontWeight.w400,
                        fontStyle: FontStyle.normal,
                      ),
                    ),
                    trailing: const Icon(Icons.chevron_right)),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25.0),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'Help',
                    style: GoogleFonts.poppins(
                      fontSize: 28,
                      fontWeight: FontWeight.w500,
                      fontStyle: FontStyle.normal,
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: ListTile(
                    leading: Text(
                      'How to use Pay Sense',
                      style: GoogleFonts.poppins(
                        fontSize: 20,
                        fontWeight: FontWeight.w400,
                        fontStyle: FontStyle.normal,
                      ),
                    ),
                    trailing: const Icon(Icons.chevron_right)),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 5, horizontal: 15),
                child: ListTile(
                    leading: Text(
                      'Customer Support',
                      style: GoogleFonts.poppins(
                        fontSize: 20,
                        fontWeight: FontWeight.w400,
                        fontStyle: FontStyle.normal,
                      ),
                    ),
                    trailing: const Icon(Icons.chevron_right)),
              ),
              GestureDetector(
                onTap: () {
                  drawController.signOutUser(context);
                },
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0),
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      'Sign out',
                      style: GoogleFonts.poppins(
                        fontSize: 28,
                        fontWeight: FontWeight.w500,
                        fontStyle: FontStyle.normal,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ]),
      ),
    );
  }
}
