import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:paysense/utils/colors.dart';
import 'package:paysense/utils/images.dart';
import 'package:paysense/viewmodel/request_money_viewmodel.dart';
import 'package:paysense/widgets/ui.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class RequestMoneyView extends StatelessWidget {
  const RequestMoneyView({super.key});

  @override
  Widget build(BuildContext context) {
    final RequestMoneyController requestMoneyController =
        Get.put(RequestMoneyController());
    final isDarkMode = Theme.of(context).brightness == Brightness.dark;

    return SafeArea(
      child: Scaffold(
        body: Stack(
          children: [
            const Uitemplate(),
            Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 35, top: 45.0, bottom: 20),
                  child: Row(
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
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 35, top: 16),
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      "Request money",
                      style: GoogleFonts.poppins(
                        fontSize: 23.5.sp,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 35, vertical: 20),
                  child: Container(
                      width: MediaQuery.of(context).size.width * 1,
                      height: MediaQuery.of(context).size.height * 0.14,
                      decoration: BoxDecoration(
                        boxShadow: const [
                          BoxShadow(
                              color: Color(0xff55a3fe),
                              spreadRadius: 1,
                              blurRadius: 7)
                        ],
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(15),
                        border:
                            Border.all(color: ColorUtil.containercolor, width: 2),
                      ),
                      child: Center(
                        child: ListTile(
                          leading: CircleAvatar(
                              backgroundColor: const Color(0xffDEEDFF),
                              child: Image.asset(
                                DummyImg.commute,
                                width: 27,
                              )),
                          title: Text(
                            "New money request",
                            style: GoogleFonts.poppins(
                              fontSize: 17.sp,
                              fontWeight: FontWeight.w400,
                              color: Colors.black87,
                            ),
                          ),
                          subtitle: Text(
                            "Request money instantly from Pay Sense buddies",
                            style: GoogleFonts.poppins(
                              fontSize: 15.sp,
                              color: Colors.black87,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ),
                      )),
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 35, vertical: 10),
                  child: SizedBox(
                    height: MediaQuery.of(context).size.height * 0.06,
                    child: TextField(
                      onChanged: (value) =>
                          requestMoneyController.filterPlayer(value),
                      decoration: InputDecoration(
                          enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                  color: ColorUtil.bordercolor, width: 1),
                              borderRadius: BorderRadius.circular(20)),
                          hintText: 'Search....',
                          prefixIcon: Icon(
                            Icons.search,
                            color: ColorUtil.bordercolor,
                          ),
                          hintStyle: TextStyle(color: ColorUtil.bordercolor)),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 35, top: 5),
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      "Rapid Request",
                      style: GoogleFonts.poppins(
                          fontSize: 20.sp,
                          fontWeight: FontWeight.w400,
                          letterSpacing: 0.04),
                    ),
                  ),
                ),
                Expanded(
                  child: Obx(
                    () => ListView.builder(
                      shrinkWrap: true,
                      physics: const AlwaysScrollableScrollPhysics(),
                      itemCount: requestMoneyController.foundPlayers.value.length,
                      itemBuilder: (context, index) => Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 30, vertical: 7),
                        child: GestureDetector(
                          onTap: () {
                            Get.toNamed("/AfterReqAmntView");
                          },
                          child: ListTile(
                            leading: CircleAvatar(
                              backgroundColor: requestMoneyController
                                  .foundPlayers.value[index]['contactcolor'],
                              child: Text(
                                "${requestMoneyController.foundPlayers.value[index]['contactdemo']}",
                              ),
                              // radius: 20,
                            ),
                            title: Text(
                              requestMoneyController.foundPlayers.value[index]
                                  ['contactname'],
                              style: const TextStyle(
                                  fontSize: 16, fontWeight: FontWeight.bold),
                            ),
                            subtitle: Text(
                              requestMoneyController.foundPlayers.value[index]
                                  ['contactno'],
                              style: const TextStyle(
                                  fontSize: 12, fontWeight: FontWeight.bold),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
