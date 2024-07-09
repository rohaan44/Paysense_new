import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:paysense/utils/colors.dart';
import 'package:paysense/utils/images.dart';
import 'package:paysense/widgets/ui.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class TransScriptView extends StatelessWidget {
  const TransScriptView({super.key});

  @override
  Widget build(BuildContext context) {
    final isDarkMode = Theme.of(context).brightness == Brightness.dark;

    return SafeArea(
      child: Scaffold(
          body: Stack(
        children: [
          const Uitemplate(),
          Padding(
            padding: const EdgeInsets.only(left: 78.0, top: 47),
            child: Stack(children: [
              Image.asset(
                DummyImg.logo,
                width: 78,
              ),
            ]),
          ),
          Column(
            children: [
              Center(
                child: Padding(
                  padding: const EdgeInsets.only(top: 80),
                  child: Text(
                    "AY SENSE",
                    style: GoogleFonts.poppins(
                        fontSize: 22,
                        fontWeight: FontWeight.w500,
                        color: ColorUtil.heading),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 50.0),
                child: Stack(
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 40),
                      child: Card(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15)),
                        child: Container(
                          height: MediaQuery.of(context).size.height * 0.50,
                          width: MediaQuery.of(context).size.width * 1,
                          decoration: BoxDecoration(
                              boxShadow: const [
                                BoxShadow(
                                    color: Color(0xff55a3fe),
                                    // spreadRadius: 0.5,
                                    blurRadius: 7)
                              ],
                              borderRadius: BorderRadius.circular(15),
                              color: ColorUtil.whitecolor),
                          child: Column(
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(top: 57),
                                child: Text('Rs. 10,000',
                                    style: GoogleFonts.poppins(
                                        fontSize: 21.sp,
                                        color: isDarkMode
                                            ? Colors.black87
                                            : Colors.black87,
                                        fontWeight: FontWeight.w500)),
                              ),
                              Text(
                                  'Muhammad Shakir to\n\t\t\t\t\t\t\t\t\t\t\t\tJibran Ali',
                                  style: GoogleFonts.poppins(
                                      fontSize: 16.5.sp,
                                      color: isDarkMode
                                          ? Colors.black87
                                          : Colors.black87,
                                      fontWeight: FontWeight.w500)),
                              Padding(
                                padding: const EdgeInsets.symmetric(
                                    vertical: 30, horizontal: 10),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Align(
                                      alignment: Alignment.centerLeft,
                                      child: Text('Date & Time (PKT)\t\t\t\t\t\t',
                                          style: GoogleFonts.poppins(
                                              color: const Color(0xff757575),
                                              fontSize: 15.sp,
                                              height: 1,
                                              fontWeight: FontWeight.w400)),
                                    ),
                                    Text('28 April 2023, 10:29 AM',
                                        style: GoogleFonts.poppins(
                                            color: isDarkMode
                                                ? Colors.black87
                                                : Colors.black87,
                                            fontSize: 16.5.sp,
                                            fontWeight: FontWeight.w500)),
                                  ],
                                ),
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 10),
                                child: Align(
                                  alignment: Alignment.centerLeft,
                                  child: Text('UBL *1988',
                                      style: GoogleFonts.poppins(
                                          color: isDarkMode
                                              ? Colors.black87
                                              : Colors.black87,
                                          fontSize: 16.5.sp,
                                          fontWeight: FontWeight.w500)),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.symmetric(
                                    vertical: 20, horizontal: 10),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Align(
                                      alignment: Alignment.centerLeft,
                                      child: Text('Sender Name',
                                          style: GoogleFonts.poppins(
                                              color: const Color(0xff757575),
                                              fontSize: 15.sp,
                                              height: 1.5,
                                              fontWeight: FontWeight.w400)),
                                    ),
                                    Text('Muhammad Shakir',
                                        style: GoogleFonts.poppins(
                                            color: isDarkMode
                                                ? Colors.black87
                                                : Colors.black87,
                                            fontSize: 16.5.sp,
                                            fontWeight: FontWeight.w500)),
                                  ],
                                ),
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
                          backgroundColor: ColorUtil.heading,
                          child: const Icon(
                            Icons.done,
                            size: 40,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 35, vertical: 10),
                child: GestureDetector(
                  onTap: () {
                    Get.toNamed("/DashBoardView");
                  },
                  child: Container(
                    width: MediaQuery.of(context).size.width * 1,
                    height: MediaQuery.of(context).size.height * 0.09,
                    decoration: BoxDecoration(
                      boxShadow: const [
                        BoxShadow(
                            color: Color(0xff55a3fe),
                            spreadRadius: 1,
                            blurRadius: 15)
                      ],
                      color: const Color(0xff55a3fe),
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 25),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Close",
                            style: GoogleFonts.poppins(
                                fontSize: 20.sp,
                                fontWeight: FontWeight.w500,
                                color: ColorUtil.whitecolor),
                          ),
                          Icon(
                            Icons.close,
                            size: 30,
                            color: ColorUtil.whitecolor,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      )),
    );
  }
}
