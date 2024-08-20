import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:paysense/widgets/CustomCard.dart';

class Tester extends StatelessWidget {
  const Tester({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body:  CustomCard(
            buttonText: 'View', onPress: () { log("Rohaan"); },
        
          ),
        ),
      );
  }
}
