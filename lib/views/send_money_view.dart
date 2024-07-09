import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:paysense/utils/colors.dart';
import 'package:paysense/utils/images.dart';
import 'package:paysense/widgets/ui.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class SendMoney extends StatelessWidget {
  const SendMoney({super.key});

  @override
  Widget build(BuildContext context) {
    final isDarkMode = Theme.of(context).brightness == Brightness.dark;
    return SafeArea(
      child: Scaffold(
        body: Stack(children: [
          const Uitemplate(),
          Column(children: [
            Padding(
              padding:
                  const EdgeInsets.only(left: 35, top: 45.0, bottom: 20),
              child: Align(
                alignment: Alignment.centerLeft,
                child: GestureDetector(
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
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 35, bottom: 25),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  "Send Money",
                  style: GoogleFonts.poppins(
                    fontSize: 23.sp,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 5),
              child: GestureDetector(
                onTap: () {
                  Get.toNamed('ChooseBankView');
                },
                child: Container(
                  width: MediaQuery.of(context).size.width * 1,
                  height: MediaQuery.of(context).size.height * 0.145,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: const Color(0xff7AB8FF),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(13.0),
                    child: ListTile(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10)),
                      leading: CircleAvatar(
                        backgroundColor: ColorUtil.whitecolor,
                        child: const Icon(Icons.food_bank_rounded),
                      ),
                      title: Text(
                        "New bank transfer",
                        style: GoogleFonts.poppins(
                          fontSize: 18.sp,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      subtitle: Text(
                        "Send money to any bank or wallet account in Pakistan.",
                        style: GoogleFonts.poppins(
                          fontSize: 15.5.sp,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            )
          ]),
        ]),
      ),
    );
  }
}
