import 'dart:async';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:paysense/utils/images.dart';
import 'package:paysense/widgets/ui.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../viewmodel/splash_viewmodel.dart';

class SplashView extends StatefulWidget {
const  SplashView({super.key});

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  final SplashController splashControl = Get.put(SplashController());

  @override
  void initState() {
    super.initState();

    Timer(const Duration(seconds: 5), () {
      Get.toNamed("/registerandloginView");
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Stack(
          children: [
          const  Uitemplate(),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Center(
                  child: Image.asset(
                    DummyImg.logo,
                    width: 100.h,
                    height: 100.w,
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(
                top: 270,
              ),
              child: Align(
                alignment: Alignment.center,
                child: Stack(children: [
                  Center(
                    child: Text(
                      'Your Money Your Hold',
                      style: GoogleFonts.poppins(
                        color:const Color(0xff459BFF),
                        fontSize: 21.sp,
                        fontWeight: FontWeight.w300,
                      ),
                    ),
                  ),
                ]),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
