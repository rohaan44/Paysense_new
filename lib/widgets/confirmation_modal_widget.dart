import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:paysense/utils/colors.dart';
import 'package:paysense/widgets/bottom_bar.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class BottomModal extends StatelessWidget {
  const BottomModal({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width * 1,
      height: MediaQuery.of(context).size.height * 0.45,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 20),
        child: Column(
          children: [
            SizedBox(
              width: 50,
              height: 60,
              child: CircleAvatar(
                  backgroundColor: ColorUtil.bgblue,
                  child: Icon(
                    Icons.done,
                    size: 30,
                    color: ColorUtil.whitecolor,
                  )),
            ),
            Text(
              "Success",
              style: GoogleFonts.poppins(
                fontSize: 25.sp,
                fontWeight: FontWeight.w500,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 9),
              child: Center(
                child: Text(
                  "Rs. 1000 ki request Jibran Ali ko bhej\n\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t de gaye hew",
                  style: GoogleFonts.poppins(
                    fontSize: 16.5.sp,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 35, right: 35, top: 20),
              child: GestureDetector(
                onTap: () {
                //   Navigator.push(
                //       context,
                //       MaterialPageRoute(
                //           builder: (BuildContext context) =>  BottomBar()));
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
                          "Done",
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
          ],
        ),
      ),
    );
  }
}
