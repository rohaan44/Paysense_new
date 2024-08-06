import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:paysense/controllers/Registration_controller.dart';
import 'package:paysense/utils/colors.dart';
import 'package:paysense/widgets/buttons.dart';
import 'package:paysense/widgets/customTextField.dart';
import 'package:paysense/widgets/ui.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class RegisterView extends StatelessWidget {
  RegisterView({super.key});
  // final RegisterController registerControl = Get.put(RegisterController());
  // final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final Register_Controller controller = Get.put(Register_Controller());
  @override
  Widget build(BuildContext context) {
    final isDarkMode = Theme.of(context).brightness == Brightness.dark;
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: true,
        body: Stack(
          children: [
            const Uitemplate(),
            SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(25.0),
                child: Column(
                  children: [
                    SizedBox(
                      height: Get.height * 0.09,
                    ),
                    Container(
                      alignment: Alignment.topLeft,
                      child: Text('Hello..!',
                          style: GoogleFonts.poppins(
                              fontSize: 20.sp,
                              height: 1.17,
                              fontWeight: FontWeight.w500)),
                    ),
                    Container(
                      alignment: Alignment.topLeft,
                      child: RichText(
                          textAlign: TextAlign.left,
                          text: TextSpan(children: [
                            TextSpan(
                                text: 'Registered your self to',
                                style: GoogleFonts.poppins(
                                    height: 1.3,
                                    fontSize: 16.sp,
                                    color: isDarkMode
                                        ? Colors.white
                                        : Colors.black,
                                    fontWeight: FontWeight.w400)),
                            TextSpan(
                                text: ' Pay Sense',
                                style: GoogleFonts.poppins(
                                    height: 1.3,
                                    fontSize: 16.sp,
                                    color: ColorUtil.bgblue,
                                    fontWeight: FontWeight.w500)),
                            TextSpan(
                                text: ' because it’s your Money your Hold  ',
                                style: GoogleFonts.poppins(
                                    height: 1.5,
                                    fontSize: 16.sp,
                                    color: isDarkMode
                                        ? Colors.white
                                        : Colors.black,
                                    fontWeight: FontWeight.w400))
                          ])),
                    ),
                    SizedBox(
                      height: Get.height * 0.08,
                    ),
                    Form(
                      key: controller
                          .formKey, 
                      child: SingleChildScrollView(
                        child: Column(
                          children: [
                            RoundedTextField(
                              keyboardType: TextInputType.emailAddress,
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Please enter your email';
                                }
                                return null;
                              },
                              controller: controller.emailController,
                              hintText: 'Email',
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            RoundedTextField(
                              keyboardType: TextInputType.text,
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Please enter your Fullname';
                                }
                                return null;
                              },
                              controller: controller.fullNameController,
                              hintText: 'Fullname',
                            ),
                           const  SizedBox(
                              height: 10,
                            ),
                            RoundedTextField(
                              keyboardType: TextInputType.text,
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Please enter your phone number';
                                }
                                return null;
                              },
                              controller: controller.phoneNumberController,
                              hintText: 'Phone Number',
                            ),
                        
                           const  SizedBox(
                              height: 10,
                            ),
                            Obx(() {
                              return RoundedTextField(
                                keyboardType: TextInputType.number,
                                obscureText: controller.isHiddenPassword.value,
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return 'Please enter your pin';
                                  }
                                  if (value.length != 4 ||
                                      !RegExp(r'^\d{4}$').hasMatch(value)) {
                                    return 'The pin must be a 4-digit number';
                                  }
                                  return null;
                                },
                                controller: controller.pinController,
                                hintText: "Pin",
                                suffixIcon: GestureDetector(
                                    onTap: () {
                                      controller.isHiddenPassword.value =
                                          !controller.isHiddenPassword.value;
                                    },
                                    child: Icon(controller.isHiddenPassword.value
                                        ? Icons.visibility_off
                                        : Icons.visibility)),
                              );
                            }),
                           
                            const SizedBox(
                              height: 10,
                            ),
                            RichText(
                                text: TextSpan(
                                    children: [
                              TextSpan(
                                  text: 'You are signing up as an ',
                                  style: GoogleFonts.poppins(
                                      color: isDarkMode
                                          ? Colors.white
                                          : Colors.black,
                                      height: 1.5,
                                      fontSize: 16.sp,
                                      fontWeight: FontWeight.w300)),
                              TextSpan(
                                  text: 'Individual',
                                  style: GoogleFonts.poppins(
                                      height: 1.5,
                                      fontSize: 16.sp,
                                      color: ColorUtil.bgblue,
                                      fontWeight: FontWeight.w500)),
                            ])),
                            SizedBox(
                              height: Get.height * 0.08,
                            ),
                            Obx(
                              () => DummyButton(
                                width: MediaQuery.of(context).size.width * 1,
                                height: MediaQuery.of(context).size.height * 0.07,
                                title: "Register",
                                clr: const Color(0xff459BFF),
                                isLoading: controller.isLoading
                                    .value, 
                                onPress: () {
                                
                                  if (controller.formKey.currentState!
                                      .validate()) {
                                    controller.register();
                                    log("register button pressed");
                                  }
                                },
                              ),
                            ),
                    const SizedBox(
                      height: 10,
                    ),        
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    GestureDetector(
                      onTap: () {
                        Get.toNamed('loginView');
                      },
                      child: Text.rich(
                        TextSpan(
                          text: "Already have an account? ",
                          style: GoogleFonts.poppins(
                            fontSize: 16.sp,
                            fontWeight: FontWeight.w400,
                          ),
                          children: <TextSpan>[
                            TextSpan(
                              text: 'Login',
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
                   const  SizedBox(
                      height: 20,
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
