import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:paysense/widgets/file.dart';

class CustomCard extends StatelessWidget {
  final double height;
  final String buttonText;
  final Color cardColor;
  final Color shadowColor;
  final VoidCallback onPress;

  const CustomCard({
    Key? key,
    required this.onPress,
    this.height = 400.0,
    this.buttonText = "View",
    this.cardColor = const Color(0xff55a3fe),
    this.shadowColor = const Color(0xff55a3fe),
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.transparent,
      height: 270, // Set the parent container height to 300
      child: Stack(
        children: [
          Center(
            child: SizedBox(
              // The SizedBox restricts the card height without affecting the parent container
              height: height, // Maintain the height of the card independently
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ClipPath(
                    clipper: CustomShapeClipper(),
                    child: Container(
                      decoration: const BoxDecoration(
                        gradient: LinearGradient(
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                          colors: [
                            const Color(0xff55a3fe),
                            Color.fromARGB(104, 90, 167, 255),
                          ],
                        ),
                      ),
                      width: double.infinity,
                      height: height *
                          0.6, // Adjust height relative to the card's total height
                    ),
                  ),
                ],
              ),
            ),
          ),
          Positioned(
            top: 5, // Adjust position for the button
            right: 9,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xff55a3fe),
              ),
              onPressed: onPress,
              child: Text(
                buttonText,
                style: GoogleFonts.poppins(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
