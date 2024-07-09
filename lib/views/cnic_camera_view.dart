import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:paysense/utils/colors.dart';
import 'package:paysense/utils/images.dart';
import 'package:paysense/widgets/camera_widget.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class CnicView extends StatefulWidget {
  const CnicView({super.key});

  @override
  State<CnicView> createState() => _CnicViewState();
}

class _CnicViewState extends State<CnicView> with TickerProviderStateMixin {
  AnimationController? controller;
  late Animation<double> animation;
  @override
  void initState() {
    super.initState();
    controller =
        AnimationController(vsync: this, duration:const Duration(seconds: 3));
    animation = CurvedAnimation(parent: controller!, curve: Curves.easeIn);

    controller!.repeat();
  }

  @override
  void dispose() {
    controller!.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
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
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (BuildContext context) =>
                             const   CameraRecognise()));
                  },
                  child: RotationTransition(
                    turns: animation,
                    alignment: Alignment.center,
                    child: SizedBox(
                      width: 200,
                      height: 200,
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
                'Tap to Scan your \n\t\t\t\t\tCNIC Front',
                style: GoogleFonts.poppins(
                    fontSize: 22.sp,
                    fontWeight: FontWeight.w300,
                    fontStyle: FontStyle.normal,
                    color: ColorUtil.whitecolor),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 80),
              child: Text(
                'Scan your original CNIC\n\t\t& take a clear picture',
                style: GoogleFonts.poppins(
                    fontSize: 18.sp,
                    fontWeight: FontWeight.w300,
                    fontStyle: FontStyle.normal,
                    color: ColorUtil.whitecolor),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
