import 'package:flutter/material.dart';
import 'package:paysense/widgets/bottom_bar.dart';
import '../widgets/verification.dart';

class ResultScreen extends StatelessWidget {
  final String text;

  const ResultScreen({super.key, required this.text});

  @override
  Widget build(BuildContext context) => Scaffold(
        body: SafeArea(
          child: Stack(children: [
            VerifyView(
              onPress: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (BuildContext context) =>  BottomBar()));
              },
              title: text,
              height: 500,
              width: 300,
            ),
          ]),
        ),
      );
}
