import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:paysense/utils/colors.dart';
import 'package:paysense/utils/images.dart';
import 'package:paysense/widgets/ui.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class CustomerSupport extends StatelessWidget {
  const CustomerSupport({super.key});

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
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: GestureDetector(
                    onTap: () {
                      Get.toNamed('/DrawerView');
                    },
                    child: Image.asset(
                      DummyImg.icon,
                      width: 40,
                      height: 32,
                      color: isDarkMode ? Colors.white : Colors.black87,
                    ),
                  ),
                ),
              ),
              Center(
                child: Text(
                  'Reach The Support Team',
                  maxLines: 2,
                  style: GoogleFonts.poppins(
                    fontSize: 19.sp,
                    fontWeight: FontWeight.w500,
                    fontStyle: FontStyle.normal,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 30.0),
                child: Image.asset(DummyImg.headphone),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 11.0),
                child: Center(
                  child: Text(
                    'How can we help\n\t\t\t\t\t\t\t\t\t\t\t\tyou?',
                    style: GoogleFonts.poppins(
                      height: 1.2,
                      fontSize: 20.sp,
                      fontWeight: FontWeight.w500,
                      fontStyle: FontStyle.normal,
                    ),
                  ),
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 35, vertical: 40),
                child: Container(
                  width: MediaQuery.of(context).size.width * 1,
                  height: 60,
                  decoration: BoxDecoration(
                    color: const Color(0xffd9e8f9),
                    border: Border.all(color: ColorUtil.bordercolor),
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Image.asset(
                          DummyImg.headphone,
                          width: 30,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(right: 55),
                          child: Text(
                            'Contact live chat',
                            style: GoogleFonts.poppins(
                              fontSize: 14,
                              fontWeight: FontWeight.w400,
                              fontStyle: FontStyle.normal,
                            ),
                          ),
                        ),
                        Icon(
                          Icons.chevron_right,
                          color: ColorUtil.bordercolor,
                        ),
                      ],
                    ),
                  ),
                ),
              ),

              // Padding(
              //   padding:
              //       const EdgeInsets.symmetric(horizontal: 35.0, vertical: 40),
              //   child: ListTile(
              //     tileColor: Color(0xffd9e8f9),
              //     shape: RoundedRectangleBorder(
              //       side: BorderSide(color: ColorUtil.bordercolor, width: 1),
              //       borderRadius: BorderRadius.circular(5),
              //     ),
              //     leading: Image.asset(
              //       DummyImg.headphone,
              //       width: 30,
              //     ),
              //     title: Text(
              //       'Contact live chat',
              //       style: GoogleFonts.poppins(
              //         fontSize: 14,
              //         fontWeight: FontWeight.w400,
              //         fontStyle: FontStyle.normal,
              //       ),
              //     ),
              //     trailing: Icon(
              //       Icons.chevron_right,
              //       color: ColorUtil.bordercolor,
              //     ),
              //   ),
              // ),
              CircleAvatar(
                backgroundColor: ColorUtil.circlecolor,
                radius: 40,
                child: Icon(
                  Icons.email_outlined,
                  size: 30,
                  color: ColorUtil.bordercolor,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 30.0),
                child: RichText(
                    text: TextSpan(children: [
                  TextSpan(
                      text: '\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\tSend us an email:',
                      style: GoogleFonts.poppins(
                          height: 1.5,
                          color: isDarkMode ? Colors.white : Colors.black87,
                          fontSize: 16.sp,
                          fontWeight: FontWeight.w400)),
                  TextSpan(
                      text: '\nhellopaysense@gmail.com',
                      style: GoogleFonts.poppins(
                          height: 1.5,
                          fontSize: 18.sp,
                          color: isDarkMode ? Colors.white : Colors.black87,
                          fontWeight: FontWeight.w500)),
                ])),
              ),
            ],
          ),
        ]),
      ),
    );
  }
}
