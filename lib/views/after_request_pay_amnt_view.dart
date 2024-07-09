import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:paysense/utils/colors.dart';
import 'package:paysense/utils/images.dart';
import 'package:paysense/widgets/ui.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

// ignore: must_be_immutable
class AfterRequestAmntView extends StatelessWidget {
  const AfterRequestAmntView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final isDarkMode = Theme.of(context).brightness == Brightness.dark;

    return SafeArea(
      child: Scaffold(
        body: Stack(
          children: [
            const Uitemplate(),
            Column(children: [
              Padding(
                padding: const EdgeInsets.only(
                    left: 35, top: 45.0, bottom: 20, right: 35),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                    Text(
                      "Confirm",
                      style: GoogleFonts.poppins(
                        fontSize: 22.sp,
                        fontWeight: FontWeight.w500,
                        letterSpacing: 1.12,
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        Get.toNamed('/DashView');
                      },
                      child: Image.asset(
                        DummyImg.closecircle,
                        width: 32,
                        height: 32,
                        color: isDarkMode ? Colors.white : Colors.black87,
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 35, vertical: 10),
                  child: Container(
                    width: MediaQuery.of(context).size.width * 1,
                    height: MediaQuery.of(context).size.height * 0.13,
                    decoration: BoxDecoration(
                      color: ColorUtil.whitecolor,
                      borderRadius: BorderRadius.circular(15),
                      boxShadow: const [
                        BoxShadow(
                            color: Color(0xff55a3fe),
                            spreadRadius: 1,
                            blurRadius: 15)
                      ],
                    ),
                    child: Center(
                      child: ListTile(
                        leading: CircleAvatar(
                          backgroundColor: ColorUtil.whitecolor,
                          backgroundImage: AssetImage(DummyImg.sadapay),
                        ),
                        title: Text(
                          "Jibran Ali",
                          style: GoogleFonts.poppins(
                            fontSize: 17.sp,
                            fontWeight: FontWeight.w400,
                            letterSpacing: 0.36,
                            color: Colors.black87,
                          ),
                        ),
                        subtitle: Text(
                          "5241654389231988",
                          style: GoogleFonts.poppins(
                              fontSize: 15.5.sp,
                              fontWeight: FontWeight.w400,
                              letterSpacing: 0.6,
                              color: Colors.black87),
                        ),
                        trailing: const Icon(
                          Icons.edit,
                          color: Colors.black38,
                        ),
                      ),
                    ),
                  )),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 35, vertical: 25),
                child: SingleChildScrollView(
                  child: Container(
                    width: MediaQuery.of(context).size.width * 1,
                    height: MediaQuery.of(context).size.height * 0.13,
                    decoration: BoxDecoration(
                      boxShadow: const [
                        BoxShadow(
                            color: Color(0xff55a3fe),
                            spreadRadius: 1,
                            blurRadius: 15)
                      ],
                      color: ColorUtil.whitecolor,
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: SizedBox(
                      height: 70,
                      child: Center(
                        child: ListTile(
                          leading: Padding(
                            padding: const EdgeInsets.all(3.0),
                            child: Column(
                              children: [
                                Text(
                                  "Amount\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t",
                                  style: GoogleFonts.poppins(
                                      fontSize: 15.5.sp,
                                      fontWeight: FontWeight.w400,
                                      letterSpacing: 0.6,
                                      color: Colors.black87),
                                ),
                                Text(
                                  "Rs. 10,000\t\t\t\t\t\t",
                                  style: GoogleFonts.poppins(
                                    color: ColorUtil.blackcolor,
                                    fontSize: 18.sp,
                                    fontWeight: FontWeight.w500,
                                    letterSpacing: 0.6,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          trailing: const Icon(
                            Icons.edit,
                            color: Colors.black38,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 35, right: 35, top: 190),
                child: GestureDetector(
                  onTap: () {
                    Get.toNamed("TransConfirmViewpg2");
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
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "Request Rs. 10,000",
                            style: GoogleFonts.poppins(
                                fontSize: 19.5.sp,
                                fontWeight: FontWeight.w500,
                                color: ColorUtil.whitecolor),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              )
            ]),
          ],
        ),
      ),
    );
  }
}
