import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:paysense/utils/colors.dart';
import 'package:paysense/utils/images.dart';

class Uitemplate extends StatelessWidget {
  const Uitemplate({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Image.asset(
          DummyImg.img1,
          color: ColorUtil.bgblue.withOpacity(0.25),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 130),
          child: Stack(children: [
            Image.asset(
              DummyImg.img1,
              width: 170,
              color: ColorUtil.bgpurple.withOpacity(0.2),
            ),
          ]),
        ),
        Align(
          alignment: Alignment.bottomRight,
          child: Stack(children: [
            RotationTransition(
              turns: const AlwaysStoppedAnimation(180 / 360),
              child: Image.asset(
                DummyImg.img1,
                color: ColorUtil.bgpurple.withOpacity(0.25),
              ),
            ),
          ]),
        ),
        Padding(
          padding: const EdgeInsets.only(right: 30),
          child: Align(
            alignment: Alignment.bottomCenter,
            child: Stack(children: [
              RotationTransition(
                turns: const AlwaysStoppedAnimation(180 / 360),
                child: Image.asset(
                  DummyImg.img1,
                  width: 170,
                  color: ColorUtil.bgblue.withOpacity(0.2),
                ),
              ),
            ]),
          ),
        ),
        Positioned.fill(
            child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 40, sigmaY: 40),
          child: Container(
            color: Colors.transparent,
          ),
        )),
      ],
    );
  }
}
