import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:paysense/utils/colors.dart';
import 'package:paysense/utils/images.dart';
import 'package:paysense/viewmodel/bepay_amnt_viemodel.dart';
import 'package:paysense/widgets/ui.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class AfterPayAmntView extends StatelessWidget {
  final RxMap<dynamic, dynamic> userData;

  AfterPayAmntView({Key? key,  required this.userData}) : super(key: key);
  final BePayAmntController bePayAmntController = Get.put(BePayAmntController());

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
                        color: isDarkMode ? Colors.white : Colors.black87,
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
                          //backgroundImage: NetworkImage(imgg), // Display user image
                        ),
                        title: Text(
                          userData['username'] ?? "Unknown User", // Display user name
                          style: GoogleFonts.poppins(
                            fontSize: 17.sp,
                            fontWeight: FontWeight.w400,
                            letterSpacing: 0.36,
                            color: isDarkMode ? Colors.black87 : Colors.black87,
                          ),
                        ),
                        subtitle: Text(
                          userData['phoneNumber'] ?? "Unknown Number", // Display phone number
                          style: GoogleFonts.poppins(
                            fontSize: 15.5.sp,
                            fontWeight: FontWeight.w400,
                            color: isDarkMode ? Colors.black87 : Colors.black87,
                            letterSpacing: 0.6,
                          ),
                        ),
                      ),
                    ),
                  )),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 35, vertical: 25),
                child: Container(
                  width: MediaQuery.of(context).size.width * 1,
                  height: MediaQuery.of(context).size.height * 0.37,
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
                  child: ListView(
                    children: ListTile.divideTiles(
                        context: context,
                        color: isDarkMode ? Colors.grey : Colors.grey,
                        tiles: [
                          SizedBox(
                            height: 70,
                            child: Center(
                              child: ListTile(
                                leading: Padding(
                                  padding: const EdgeInsets.all(3.0),
                                  child: Column(
                                    children: [
                                      Text(
                                        "Recipient will get",
                                        style: GoogleFonts.poppins(
                                          fontSize: 15.5.sp,
                                          fontWeight: FontWeight.w400,
                                          letterSpacing: 0.6,
                                          color: isDarkMode
                                              ? Colors.black87
                                              : Colors.black87,
                                        ),
                                      ),
                                      Text(
                                        "Rs. ${bePayAmntController.textEdit.text}\t\t\t\t\t\t",
                                        style: GoogleFonts.poppins(
                                          fontSize: 18.sp,
                                          fontWeight: FontWeight.w400,
                                          letterSpacing: 0.6,
                                          color: isDarkMode
                                              ? Colors.black87
                                              : Colors.black87,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 70,
                            child: Center(
                              child: ListTile(
                                leading: Padding(
                                  padding: const EdgeInsets.all(3.0),
                                  child: Column(
                                    children: [
                                      Text(
                                        "Sender fee\t",
                                        style: GoogleFonts.poppins(
                                          fontSize: 15.5.sp,
                                          fontWeight: FontWeight.w400,
                                          letterSpacing: 0.6,
                                          color: isDarkMode
                                              ? Colors.black87
                                              : Colors.black87,
                                        ),
                                      ),
                                      Text(
                                        "Rs. 0 🔥\t\t",
                                        style: GoogleFonts.poppins(
                                          color: isDarkMode
                                              ? Colors.black87
                                              : Colors.black87,
                                          fontSize: 18.sp,
                                          fontWeight: FontWeight.w400,
                                          letterSpacing: 0.6,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Center(
                            child: ListTile(
                              contentPadding: const EdgeInsets.all(20),
                              leading: Column(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(top: 5.0),
                                    child: Text(
                                      "Kuch kehna haw?\t",
                                      style: GoogleFonts.poppins(
                                        fontSize: 15.6.sp,
                                        color: isDarkMode
                                            ? Colors.black87
                                            : Colors.black87,
                                        height: -1.0000001,
                                        fontWeight: FontWeight.w500,
                                        letterSpacing: 0.6,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              trailing: Padding(
                                padding: const EdgeInsets.only(top: 10.0),
                                child: SizedBox(
                                  width:
                                      MediaQuery.of(context).size.width * 0.69,
                                  height: 100,
                                  child: TextField(
                                    decoration: InputDecoration(
                                        enabledBorder: const OutlineInputBorder(
                                          borderSide: BorderSide(
                                              color: Color(0xffDFEDFD),
                                              width: 1),
                                        ),
                                        hintText: 'e.g today’s Break Fast 🍞',
                                        hintStyle: TextStyle(
                                          color: isDarkMode
                                              ? Colors.black87
                                              : Colors.black87,
                                        )),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ]).toList(),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 35, right: 35, top: 40),
                child: GestureDetector(
                  onTap: () {
                    Get.toNamed("/TransConfirmView");
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
                            "Send Rs. ${bePayAmntController.textEdit.text}",
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
