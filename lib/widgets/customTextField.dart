import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class RoundedTextField extends StatelessWidget {
  final TextInputType? keyboardType;
  final TextEditingController? controller;
  final String? hintText;
  final String? Function(String?)? validator;
  final Widget? suffixIcon;
  final bool? obscureText;


  const RoundedTextField({
    Key? key,
    this.keyboardType,
    this.obscureText = false,  // default to false
    this.controller,
    this.hintText,
    this.validator,
    this.suffixIcon,  // changed to suffixIcon to match InputDecoration parameter
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      obscureText: obscureText!,
      validator: validator,
      keyboardType: keyboardType,
      cursorColor: Color(0xff459BFF),
      controller: controller ?? TextEditingController(),
      decoration: InputDecoration(
        suffixIcon: suffixIcon,
        hintText: hintText,
        hintStyle: GoogleFonts.poppins(
          color: const Color(0xffCCCDC6),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: const BorderSide(
            width: 1.5,
            color: Color.fromARGB(255, 208, 209, 211),
          ),
          borderRadius: BorderRadius.circular(11),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: const BorderSide(
            width: 2,
            color: Color(0xff459BFF),
          ),
          borderRadius: BorderRadius.circular(11),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderSide: const BorderSide(
            width: 2,
            color: Colors.red),
          
          borderRadius: BorderRadius.circular(11),
        ),
        errorBorder: OutlineInputBorder(
          borderSide: const BorderSide(
            width: 2,
            color: Colors.red),
          borderRadius: BorderRadius.circular(11),
        )
      ),
    );
  }
}
