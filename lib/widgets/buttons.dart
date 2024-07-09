import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class DummyButton extends StatelessWidget {
  final bool isLoading;
  final Object title;
  final Color clr;
  final VoidCallback onPress;
  final double height;
  final double width;

 const DummyButton({
    Key? key,
    required this.title,
    required this.clr,
    required this.onPress,
    required this.height,
    required this.width,
    this.isLoading = false, // Default value is set to false
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPress,
      child: Container(
        height: height,
        width: width,
        decoration: BoxDecoration(
          color: clr,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Center(
          child: isLoading
              ? const CircularProgressIndicator(
                  color: Colors.white,
                )
              : Text(
                  "$title",
                  style: GoogleFonts.poppins(
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                    color: Colors.white,
                  ),
                ),
        ),
      ),
    );
  }
}
