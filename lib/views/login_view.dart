// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:google_fonts/google_fonts.dart';
// import 'package:paysense/controllers/Login_controller.dart';
// import 'package:paysense/utils/colors.dart';
// //import 'package:paysense/viewmodel/login_viewmodel.dart';
// import 'package:paysense/views/register_view.dart';
// import 'package:paysense/widgets/buttons.dart';
// import 'package:paysense/widgets/customTextField.dart';
// import 'package:paysense/widgets/ui.dart';
// import 'package:responsive_sizer/responsive_sizer.dart';

// class LoginView extends StatelessWidget {
//   LoginView({super.key});
//   final Login_Controller controller = Get.put(Login_Controller());
//   final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
//   @override
//   Widget build(BuildContext context) {
//     final isDarkMode = Theme.of(context).brightness == Brightness.dark;

//     return SafeArea(
//       child: Scaffold(
//         resizeToAvoidBottomInset: false,
//         body: Padding(
//           padding: const EdgeInsets.all(25.0),
//           child: SingleChildScrollView(
//             child: Stack(
//               children: [
//                 const Uitemplate(),
//                 Column(children: [
//                   SizedBox(
//                     height: Get.height * 0.09,
//                   ),
//                   Container(
//                     alignment: Alignment.topLeft,
//                     child: Text('Welcome back..!',
//                         style: GoogleFonts.poppins(
//                             fontSize: 20.sp,
//                             height: 1.17,
//                             fontWeight: FontWeight.w500)),
//                   ),
//                   SizedBox(
//                     height: Get.height * 0.01,
//                   ),
//                   Container(
//                     alignment: Alignment.topLeft,
//                     child: RichText(
//                         textAlign: TextAlign.left,
//                         text: TextSpan(
//                             //apply style to all
//                             children: [
//                               TextSpan(
//                                   text: 'Login to',
//                                   style: GoogleFonts.poppins(
//                                       height: 1.5,
//                                       fontSize: 17.sp,
//                                       color: isDarkMode
//                                           ? Colors.white
//                                           : Colors.black87,
//                                       fontWeight: FontWeight.w400)),
//                               TextSpan(
//                                   text: ' Pay Sense ',
//                                   style: GoogleFonts.poppins(
//                                       height: 1.5,
//                                       fontSize: 17.sp,
//                                       color: ColorUtil.bgblue,
//                                       fontWeight: FontWeight.w500)),
//                               TextSpan(
//                                   text: ' to enjoy your',
//                                   style: GoogleFonts.poppins(
//                                     height: 1.5,
//                                     fontSize: 17.sp,
//                                     fontWeight: FontWeight.w400,
//                                     color: isDarkMode
//                                         ? Colors.white
//                                         : Colors.black87,
//                                   )),
//                               TextSpan(
//                                   text: '\nfast & free transactions  ',
//                                   style: GoogleFonts.poppins(
//                                       height: 1.5,
//                                       fontSize: 17.sp,
//                                       color: isDarkMode
//                                           ? Colors.white
//                                           : Colors.black87,
//                                       fontWeight: FontWeight.w400))
//                             ])),
//                   ),
//                   SizedBox(
//                     height: Get.height * 0.08,
//                   ),
//                   Form(
//                     key: _formKey, // Add the GlobalKey to the Form widget

//                     child: Column(
//                       crossAxisAlignment: CrossAxisAlignment.end,
//                       children: [
//                         RoundedTextField(
//                           keyboardType: TextInputType.number,
//                           validator: (value) =>
//                               loginController.validateaccNo(value!),
//                               hintText: 'Account Number',

//                         ),

//                         // TextFormField(
//                         //   keyboardType: TextInputType.number,
//                         //   validator: (value) =>
//                         //       loginController.validateaccNo(value!),
//                         //   controller: loginController.editaccount,
//                         //   decoration: InputDecoration(
//                         //     labelText: 'AccountNumber',
//                         //   ),
//                         // ),
//                         SizedBox(height: Get.height * 0.030,),
//                         Obx(() => RoundedTextField(
//                             keyboardType: TextInputType.number,
//                             obscureText: loginController.ispasswordHidden.value,
//                             validator: (value) =>
//                                 loginController.validatepin(value!),
//                             controller: loginController.editpin,
//                             hintText: "Pin",
//                             suffixIcon: GestureDetector(
//                                 onTap: () {
//                                   loginController.ispasswordHidden.value =
//                                       !loginController.ispasswordHidden.value;
//                                 },
//                                 child: Icon(
//                                     loginController.ispasswordHidden.value
//                                         ? Icons.visibility_off
//                                         : Icons.visibility)))),
//                         // Obx(
//                         //   () => TextFormField(
//                         //     keyboardType: TextInputType.number,
//                         //     obscureText: loginController.ispasswordHidden.value,
//                         //     validator: (value) =>
//                         //         loginController.validatepin(value!),
//                         //     controller: loginController.editpin,
//                         //     decoration: InputDecoration(
//                         //         labelText: 'Pin',
//                         //         suffixIcon: GestureDetector(
//                         //             onTap: () {
//                         //               loginController.ispasswordHidden.value =
//                         //                   !loginController
//                         //                       .ispasswordHidden.value;
//                         //             },
//                         //             child: Icon(
//                         //                 loginController.ispasswordHidden.value
//                         //                     ? Icons.visibility_off
//                         //                     : Icons.visibility))),
//                         //   ),
//                         // ),
//                       SizedBox(
//                           height: 5,
//                         ),
//                         Text("Forget Pin?",
//                             style: GoogleFonts.poppins(
//                                 fontSize: 16.sp,
//                                 color: ColorUtil.bgblue,
//                                 fontWeight: FontWeight.w600)),
//                         SizedBox(
//                           height: 20,
//                         ),
//                         Obx(
//                           () => DummyButton(
//                             width: MediaQuery.of(context).size.width * 1,
//                             height: MediaQuery.of(context).size.height * 0.08,
//                             title: "Login",
//                             clr: const Color(0xff459BFF),
//                             isLoading: loginController.isLoading
//                                 .value, // Pass the loading status here
//                             onPress: () async {
//                               _formKey.currentState!.validate();

//                               // Check the overall form validity before submitting
//                               if (loginController.isFormValid.value) {
//                                 // loginController.submitForm(context);
//                                 loginController.login();
//                                 loginController.isLoading.value = false;
//                                 loginController.editaccount.clear();
//                                 loginController.editpin.clear();
//                               }
//                             },
//                           ),
//                         ),
//                       ],
//                     ),
//                   ),
//                   SizedBox(
//                     height: 10,
//                   ),
//                   GestureDetector(
//                     onTap: () {
//                       Get.to(RegisterView());
//                     },
//                     child: Text.rich(
//                       TextSpan(
//                         text: "Don't have an account? ",
//                         style: GoogleFonts.poppins(
//                           fontSize: 16.sp,
//                           fontWeight: FontWeight.w400,
//                         ),
//                         children: <TextSpan>[
//                           TextSpan(
//                             text: 'Register',
//                             style: GoogleFonts.poppins(
//                               color: Colors.blue,
//                               fontSize: 17.sp,
//                               fontWeight: FontWeight.w500,
//                             ),
//                           ),
//                         ],
//                       ),
//                     ),
//                   )
//                 ]),
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }

import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:paysense/controllers/Login_controller.dart';
import 'package:paysense/utils/colors.dart';
import 'package:paysense/views/register_view.dart';
import 'package:paysense/widgets/buttons.dart';
import 'package:paysense/widgets/customTextField.dart';
import 'package:paysense/widgets/ui.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class LoginView extends StatelessWidget {
  LoginView({super.key});
  final Login_Controller loginController = Get.put(Login_Controller());
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final isDarkMode = Theme.of(context).brightness == Brightness.dark;

    return SafeArea(
      child: Scaffold(
        body: Stack(
          children: [
            Uitemplate(),
             Padding(
          padding: const EdgeInsets.all(25.0),
          child: SingleChildScrollView(
            child: 
                Column(
                  children: [
                    SizedBox(height: Get.height * 0.09),
                    Container(
                      alignment: Alignment.topLeft,
                      child: Text(
                        'Welcome back..!',
                        style: GoogleFonts.poppins(
                          fontSize: 20.sp,
                          height: 1.17,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                    SizedBox(height: Get.height * 0.01),
                    Container(
                      alignment: Alignment.topLeft,
                      child: RichText(
                        textAlign: TextAlign.left,
                        text: TextSpan(
                          children: [
                            TextSpan(
                              text: 'Login to',
                              style: GoogleFonts.poppins(
                                height: 1.5,
                                fontSize: 17.sp,
                                color: isDarkMode ? Colors.white : Colors.black87,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                            TextSpan(
                              text: ' Pay Sense ',
                              style: GoogleFonts.poppins(
                                height: 1.5,
                                fontSize: 17.sp,
                                color: ColorUtil.bgblue,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            TextSpan(
                              text: ' to enjoy your',
                              style: GoogleFonts.poppins(
                                height: 1.5,
                                fontSize: 17.sp,
                                fontWeight: FontWeight.w400,
                                color: isDarkMode ? Colors.white : Colors.black87,
                              ),
                            ),
                            TextSpan(
                              text: '\nfast & free transactions  ',
                              style: GoogleFonts.poppins(
                                height: 1.5,
                                fontSize: 17.sp,
                                color: isDarkMode ? Colors.white : Colors.black87,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(height: Get.height * 0.08),
                    Form(
                      key: _formKey,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          RoundedTextField(
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Please enter your Account Number';
                              }
                              return null;
                            },
                            hintText: 'Email',
                            controller: loginController.emailController,
                          ),
                          SizedBox(height: Get.height * 0.030),
                          Obx(
                            () => RoundedTextField(
                              keyboardType: TextInputType.number,
                              obscureText: loginController.ispasswordHidden.value,
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Please enter your Pin';
                                }
                                return null;
                              },
                              controller: loginController.pinController,
                              hintText: "Pin",
                              suffixIcon: GestureDetector(
                                onTap: () {
                                  loginController.ispasswordHidden.value =
                                      !loginController.ispasswordHidden.value;
                                },
                                child: Icon(
                                  loginController.ispasswordHidden.value
                                      ? Icons.visibility_off
                                      : Icons.visibility,
                                ),
                              ),
                            ),
                          ),
                          SizedBox(height: 5),
                          Text(
                            "Forget Pin?",
                            style: GoogleFonts.poppins(
                              fontSize: 16.sp,
                              color: ColorUtil.bgblue,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          SizedBox(height: 20),
                          Obx(
                            () => DummyButton(
                              width: MediaQuery.of(context).size.width * 1,
                              height: MediaQuery.of(context).size.height * 0.08,
                              title: "Login",
                              clr: const Color(0xff459BFF),
                              isLoading: loginController.isLoading.value,
                              onPress: () {
                                print('Login button pressed');
                                if (_formKey.currentState!.validate()) {
                                  print('Form validated');
                                   log("Button Pressed");
                                   loginController.login();
                                   
                                } else {
                                  print('Form validation failed');
                                }
                              },
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 10),
                    GestureDetector(
                      onTap: () {
                        Get.to(RegisterView());
                      },
                      child: Text.rich(
                        TextSpan(
                          text: "Don't have an account? ",
                          style: GoogleFonts.poppins(
                            fontSize: 16.sp,
                            fontWeight: FontWeight.w400,
                          ),
                          children: <TextSpan>[
                            TextSpan(
                              text: 'Register',
                              style: GoogleFonts.poppins(
                                color: Colors.blue,
                                fontSize: 17.sp,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
        ))],
            ),
          ),
        
          );
      
  }
}
