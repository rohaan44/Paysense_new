import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:paysense/viewmodel/accttype_viewmodel.dart';
import 'package:paysense/utils/images.dart';
import 'package:paysense/widgets/buttons.dart';
import 'package:paysense/widgets/ui.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class AccType extends StatelessWidget {
  AccType({super.key});
  //final AcctypeController acctypeControl = Get.put(AcctypeController());

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          body: Stack(
        children: [
          const Uitemplate(),
          Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    DummyImg.logo,
                    width: MediaQuery.of(context).size.width * 1,
                    height: MediaQuery.of(context).size.height * 0.5,
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(top: 5.08, bottom: 25),
                child: Center(
                  child: Text(
                    '   Select your \naccount type!',
                    maxLines: 2,
                    style: GoogleFonts.poppins(
                      fontSize: 20.sp,
                      height: 1,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 20, right: 20),
                child: Text(
                  "Registered as an individual ",
                  style: GoogleFonts.poppins(
                    fontSize: 18.sp,
                    fontWeight: FontWeight.w400,
                    fontStyle: FontStyle.normal,
                  ),
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 55, vertical: 7),
                child: DummyButton(
                    width: MediaQuery.of(context).size.width * 1,
                    height: MediaQuery.of(context).size.height * 0.08,
                    title: "Individual",
                    clr: const Color(0xff459BFF),
                    onPress: () {
                      Get.toNamed('/registerView');
                    }),
              ),
              Padding(
                padding: const EdgeInsets.only(
                    left: 20, right: 20, top: 7, bottom: 11),
                child: Text(
                  "Registered as a business ",
                  style: GoogleFonts.poppins(
                    fontSize: 17.sp,
                    fontWeight: FontWeight.w400,
                    fontStyle: FontStyle.normal,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 55),
                child: DummyButton(
                    width: MediaQuery.of(context).size.width * 1,
                    height: MediaQuery.of(context).size.height * 0.08,
                    title: "Business",
                    clr: Colors.black,
                    onPress: () {}),
              )
            ],
          ),
        ],
      )),
    );
  }
}
