import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

// ignore: must_be_immutable
class VerifyView extends StatefulWidget {
  final double width;
  final double height;
  final VoidCallback onPress;
  String title;

  VerifyView(
      {super.key,
      required this.width,
      required this.height,
      required this.title, required this.onPress});

  @override
  State<VerifyView> createState() => _VerifyViewState();
}

class _VerifyViewState extends State<VerifyView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.black,
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 60),
              child: Center(
                child: Container(
                  width: widget.width,
                  height: widget.height,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: Column(
                    children: [
                      const Icon(
                        Icons.verified,
                        size: 90,
                        color: Colors.green,
                      ),
                      Text(widget.title,
                          style: GoogleFonts.poppins(
                              fontSize: 18.sp,
                              color: Colors.black,
                              fontWeight: FontWeight.w500)),
                      Padding(
                        padding: const EdgeInsets.only(right: 20, top: 80),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            GestureDetector(
                              onTap: widget.onPress,
                              child: Container(
                                width: MediaQuery.of(context).size.width * 0.25,
                                height:
                                    MediaQuery.of(context).size.height * 0.05,
                                decoration: BoxDecoration(
                                  color: Colors.blueAccent,
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                child: Center(
                                  child: Text("Next",
                                      style: GoogleFonts.poppins(
                                          fontSize: 18.sp,
                                          color: Colors.black,
                                          fontWeight: FontWeight.w500)),
                                ),
                              ),
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
          ],
        ));
  }
}
