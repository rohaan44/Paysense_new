// ignore: file_names
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:paysense/utils/colors.dart';
import 'package:paysense/utils/images.dart';
import 'package:paysense/viewmodel/selfie_camera_viewmodel.dart';
import 'package:paysense/views/cnic_camera_view.dart';
import 'package:paysense/widgets/verification.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class SelfieView extends StatefulWidget {
  const SelfieView({super.key});

  @override
  State<SelfieView> createState() => _SelfieViewState();
}

class _SelfieViewState extends State<SelfieView> with TickerProviderStateMixin {
  AnimationController? controller;
  late Animation<double> animation;
  SelfieCameraController selfieCameraController =
      Get.put(SelfieCameraController());
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Stack(children: [
          Obx(() {
            final imagePath = selfieCameraController.imagePath.value;
    
            if (imagePath.isEmpty) {
              // Show the selfie-taking screen
              return SelfieView(context);
            } else {
              // Show the VerifyView container
              return VerifyView(
                onPress: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (BuildContext context) => const CnicView()));
                },
                title: "Congratulations",
                height: 250,
                width: 300,
              );
            }
          }),
        ]),
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    controller =
        AnimationController(vsync: this, duration: const Duration(seconds: 3));
    animation = CurvedAnimation(parent: controller!, curve: Curves.easeIn);

    controller!.repeat();
  }

  @override
  void dispose() {
    controller!.dispose();
    super.dispose();
  }

  // ignore: non_constant_identifier_names
  Widget SelfieView(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.black,
        body: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 70),
              child: Center(
                child: GestureDetector(
                  onTap: () {
                    selfieCameraController.getImage();
                  },
                  child: RotationTransition(
                    turns: animation,
                    alignment: Alignment.center,
                    child: SizedBox(
                      width: 230,
                      height: 240,
                      child: Image.asset(
                        DummyImg.circlecamera,
                      ),
                    ),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 100),
              child: Text(
                'Tap to Take your \n\t\t\t\t clear Selfie',
                style: GoogleFonts.poppins(
                    fontSize: 20.sp,
                    fontWeight: FontWeight.w300,
                    fontStyle: FontStyle.normal,
                    color: ColorUtil.whitecolor),
              ),
            ),
            Center(
              child: Padding(
                padding: const EdgeInsets.only(top: 80),
                child: Text(
                  'Take a clear picture',
                  style: GoogleFonts.poppins(
                      fontSize: 18.sp,
                      fontWeight: FontWeight.w300,
                      fontStyle: FontStyle.normal,
                      color: ColorUtil.whitecolor),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
