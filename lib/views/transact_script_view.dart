import 'package:flutter/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:paysense/controllers/TrasncriptController.dart';
import 'package:paysense/controllers/UserDataController.dart';
import 'package:paysense/utils/colors.dart';
import 'package:paysense/utils/images.dart';
import 'package:paysense/viewmodel/bepay_amnt_viemodel.dart';
import 'package:paysense/viewmodel/enter_acc_no_viewmodel.dart';
import 'package:paysense/widgets/ui.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class TransScriptView extends StatelessWidget {
  TransScriptView({super.key});
 
  @override
  Widget build(BuildContext context) {
    final isDarkMode = Theme.of(context).brightness == Brightness.dark;
    final TranscriptController controller = Get.put(TranscriptController());
    final BePayAmntController recieverAmount = Get.find<BePayAmntController>();
    var userData = Get.find<UserController>().userData;
    var RecieverData = Get.find<EnterAccController>();
    String Datetime = DateFormat('hh:mma dd/MM/yyyy').format(DateTime.now());
    return SafeArea(
      child: Scaffold(
          body: Stack(
        children: [
          const Uitemplate(),
          Padding(
            padding: const EdgeInsets.only(left: 70.0, top: 47),
            child: Stack(
              children: [
              Image.asset(
                DummyImg.logo,
                width: 78,
              ),
            ]),
          ),
          Column(
            children: [
              Center(
                child: Padding(
                  padding: const EdgeInsets.only(top: 80),
                  child: Text(
                    "AYSENSE",
                    style: GoogleFonts.poppins(
                        fontSize: 22,
                        fontWeight: FontWeight.w500,
                        color: ColorUtil.heading),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 50.0),
                child: Stack(
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 30),
                      child: RepaintBoundary(
                        key: controller.globalKey,
                        child: Card(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15)),
                          child: Container(
                            height: MediaQuery.of(context).size.height * 0.50,
                            width: MediaQuery.of(context).size.width * 1,
                            decoration: BoxDecoration(
                                boxShadow: const [
                                  BoxShadow(
                                      color: Color(0xff55a3fe),
                                      // spreadRadius: 0.5,
                                      blurRadius: 7)
                                ],
                                borderRadius: BorderRadius.circular(15),
                                color: ColorUtil.whitecolor),
                            child: Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 15),
                                child: Stack(children: [
                                  Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: <Widget>[
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Text("Sender Name",
                                                style: GoogleFonts.poppins(
                                                    color: Colors.blue,
                                                    fontSize: 15.sp,
                                                    height: 1,
                                                    fontWeight:
                                                        FontWeight.w500)),
                                             Text(userData['username']),
                                          ],
                                        ),
                                        const Divider(
                                          color: Colors.grey,
                                          thickness: 0.5,
                                        ),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Text("Account ID",
                                                style: GoogleFonts.poppins(
                                                    color: Colors.blue,
                                                    fontSize: 15.sp,
                                                    height: 1,
                                                    fontWeight:
                                                        FontWeight.w500)),
                                            Text(controller.maskPhoneNumber(userData['phoneNumber'])),
                                          ],
                                        ),
                                        const Divider(
                                          color: Colors.grey,
                                          thickness: 0.5,
                                        ),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Text("Reciever Title",
                                                style: GoogleFonts.poppins(
                                                    color: Colors.blue,
                                                    fontSize: 15.sp,
                                                    height: 1,
                                                    fontWeight:
                                                        FontWeight.w500)),
                                             Text(RecieverData.userData['username']),
                                          ],
                                        ),
                                        const Divider(
                                          color: Colors.grey,
                                          thickness: 0.5,
                                        ),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Text("To Account ID",
                                                style: GoogleFonts.poppins(
                                                    color: Colors.blue,
                                                    fontSize: 15.sp,
                                                    height: 1,
                                                    fontWeight:
                                                        FontWeight.w500)),
                                            Text(controller.maskPhoneNumber(RecieverData.userData['phoneNumber'])),
                                          ],
                                        ),
                                        const Divider(
                                          color: Colors.grey,
                                          thickness: 0.5,
                                        ),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Text("Amount",
                                                style: GoogleFonts.poppins(
                                                    color: Colors.blue,
                                                    fontSize: 15.sp,
                                                    height: 1,
                                                    fontWeight:
                                                        FontWeight.w500)),
                                             Text("Rs: "+recieverAmount.textEdit.text),
                                          ],
                                        ),
                                        const Divider(
                                          color: Colors.grey,
                                          thickness: 0.5,
                                        ),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Text("Date & Time",
                                                style: GoogleFonts.poppins(
                                                    color: Colors.blue,
                                                    fontSize: 15.sp,
                                                    height: 1,
                                                    fontWeight:
                                                        FontWeight.w500)),
                                             Text(Datetime),
                                          ],
                                        ),
                                        const Divider(
                                          color: Colors.grey,
                                          thickness: 0.5,
                                        ),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Text("Channel",
                                                style: GoogleFonts.poppins(
                                                    color: Colors.blue,
                                                    fontSize: 15.sp,
                                                    height: 1,
                                                    fontWeight:
                                                        FontWeight.w500)),
                                            const Text("Paysense"),
                                          ],
                                        ),
                                      ]),
                                  //  Align(
                                  //   alignment: Alignment.bottomRight,
                                  //   child: Row(
                                  //       mainAxisAlignment: MainAxisAlignment.end,
                                  //       children: [
                                  //         IconButton(
                                  //             onPressed: () {

                                  //             },
                                  //             icon: Icon(Icons.save_alt,size: 30,color: Color(0xff55a3fe),)),
                                  //         SizedBox(
                                  //           width: 5,
                                  //         ),
                                  //         IconButton(
                                  //             onPressed: () {},
                                  //             icon: Icon(Icons.share,size: 25, color: Color(0xff55a3fe),))
                                  //       ],
                                  //     ),
                                  //  ),
                                  Positioned(
                                    bottom: 2,
                                    right: 0,
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.end,
                                      children: [
                                        IconButton(
                                            onPressed: () {
                                              controller.captureAndSavePng();
                                            },
                                            icon: const Icon(
                                              Icons.save_alt,
                                              size: 30,
                                              color: Color(0xff55a3fe),
                                            )),
                                        const SizedBox(
                                          width: 3,
                                        ),
                                        IconButton(
                                            onPressed: () {},
                                            icon: Icon(
                                              Icons.share,
                                              size: 25,
                                              color: Color(0xff55a3fe),
                                            ))
                                      ],
                                    ),
                                  )
                                ])),
                          ),
                        ),
                      ),

                      //   child: Column(
                      //     children: [
                      //       Padding(
                      //         padding: const EdgeInsets.only(top: 57),
                      //         child: Text('Rs. 10,000',
                      //             style: GoogleFonts.poppins(
                      //                 fontSize: 21.sp,
                      //                 color: isDarkMode
                      //                     ? Colors.black87
                      //                     : Colors.black87,
                      //                 fontWeight: FontWeight.w500)),
                      //       ),
                      //       Text(
                      //           'Muhammad Shakir to\n\t\t\t\t\t\t\t\t\t\t\t\tJibran Ali',
                      //           style: GoogleFonts.poppins(
                      //               fontSize: 16.5.sp,
                      //               color: isDarkMode
                      //                   ? Colors.black87
                      //                   : Colors.black87,
                      //               fontWeight: FontWeight.w500)),
                      //       Padding(
                      //         padding: const EdgeInsets.symmetric(
                      //             vertical: 30, horizontal: 10),
                      //         child: Column(
                      //           mainAxisAlignment: MainAxisAlignment.start,
                      //           crossAxisAlignment: CrossAxisAlignment.start,
                      //           children: [
                      //             Align(
                      //               alignment: Alignment.centerLeft,
                      //               child: Text('Date & Time (PKT)\t\t\t\t\t\t',
                      //                   style: GoogleFonts.poppins(
                      //                       color: const Color(0xff757575),
                      //                       fontSize: 15.sp,
                      //                       height: 1,
                      //                       fontWeight: FontWeight.w400)),
                      //             ),
                      //             Text('28 April 2023, 10:29 AM',
                      //                 style: GoogleFonts.poppins(
                      //                     color: isDarkMode
                      //                         ? Colors.black87
                      //                         : Colors.black87,
                      //                     fontSize: 16.5.sp,
                      //                     fontWeight: FontWeight.w500)),
                      //           ],
                      //         ),
                      //       ),
                      //       Padding(
                      //         padding:
                      //             const EdgeInsets.symmetric(horizontal: 10),
                      //         child: Align(
                      //           alignment: Alignment.centerLeft,
                      //           child: Text('UBL *1988',
                      //               style: GoogleFonts.poppins(
                      //                   color: isDarkMode
                      //                       ? Colors.black87
                      //                       : Colors.black87,
                      //                   fontSize: 16.5.sp,
                      //                   fontWeight: FontWeight.w500)),
                      //         ),
                      //       ),
                      //       Padding(
                      //         padding: const EdgeInsets.symmetric(
                      //             vertical: 20, horizontal: 10),
                      //         child: Column(
                      //           mainAxisAlignment: MainAxisAlignment.start,
                      //           crossAxisAlignment: CrossAxisAlignment.start,
                      //           children: [
                      //             Align(
                      //               alignment: Alignment.centerLeft,
                      //               child: Text('Sender Name',
                      //                   style: GoogleFonts.poppins(
                      //                       color: const Color(0xff757575),
                      //                       fontSize: 15.sp,
                      //                       height: 1.5,
                      //                       fontWeight: FontWeight.w400)),
                      //             ),
                      //             Text('Muhammad Shakir',
                      //                 style: GoogleFonts.poppins(
                      //                     color: isDarkMode
                      //                         ? Colors.black87
                      //                         : Colors.black87,
                      //                     fontSize: 16.5.sp,
                      //                     fontWeight: FontWeight.w500)),
                      //           ],
                      //         ),
                      //       ),
                      //     ],
                      //   ),
                    ),
                    FractionalTranslation(
                      translation: const Offset(0.0, -0.4),
                      child: Align(
                        alignment: const FractionalOffset(0.5, 0.0),
                        child: CircleAvatar(
                          radius: 35.0,
                          backgroundColor: ColorUtil.heading,
                          child: const Icon(
                            Icons.done,
                            size: 40,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 35, vertical: 10),
                child: GestureDetector(
                  onTap: () {
                    Get.toNamed("/DashBoardView");
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
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Close",
                            style: GoogleFonts.poppins(
                                fontSize: 20.sp,
                                fontWeight: FontWeight.w500,
                                color: ColorUtil.whitecolor),
                          ),
                          Icon(
                            Icons.close,
                            size: 30,
                            color: ColorUtil.whitecolor,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      )),
    );
  }
}
