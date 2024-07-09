import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:paysense/viewmodel/home_viewmodel.dart';
import 'package:paysense/utils/images.dart';
import 'package:paysense/widgets/buttons.dart';
import 'package:paysense/widgets/ui.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../viewmodel/dummy_button_viewmodel.dart';
import '../viewmodel/login_viewmodel.dart';

class HomeView extends StatelessWidget {
  HomeView({super.key});
  final HomeController homeControl = Get.put(HomeController());
  final DummyButtonController dummyControl = Get.put(DummyButtonController());
  final DummyButtonController dummyButtonController =
      Get.put(DummyButtonController());

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: ListView(children: [
          Stack(
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
                    padding: const EdgeInsets.only(
                      top: 11.08,
                    ),
                    child: Text(
                      'Let’s Start',
                      style: GoogleFonts.poppins(
                        fontSize: 20.sp,
                        fontWeight: FontWeight.w500,
                        fontStyle: FontStyle.normal,
                      ),
                    ),
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 20, vertical: 1),
                    child: Align(
                      alignment: Alignment.center,
                      child: Text(
                        'Create your account if your are not regisered\n\t\tor if your are registered then simply login.',
                        style: GoogleFonts.poppins(
                          fontSize: 15.sp,
                          fontWeight: FontWeight.w400,
                          fontStyle: FontStyle.normal,
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.only(left: 55, right: 55, top: 36),
                    child: DummyButton(
                        width: MediaQuery.of(context).size.width * 1,
                        height: MediaQuery.of(context).size.height * 0.07,
                        title: "Register",
                        clr: const Color(0xff459BFF),
                        onPress: () {
                          dummyControl.loading.value = false;
                          Get.toNamed('/registerView');
                        }),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 55, vertical: 25),
                    child: DummyButton(
                        width: MediaQuery.of(context).size.width * 1,
                        height: MediaQuery.of(context).size.height * 0.07,
                        title: "Login",
                        clr: Colors.black,
                        onPress: () {
                          Get.toNamed('/loginView');
                        }),
                  )
                ],
              ),
            ],
          ),
        ]),
      ),
    );
  }
}
