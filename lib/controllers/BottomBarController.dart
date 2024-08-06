import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:paysense/views/acctype_view.dart';
import 'package:paysense/views/aftercard_view.dart';
import 'package:paysense/views/custsupport_view.dart';
import 'package:paysense/views/dashboard_view.dart';
import 'package:paysense/views/home_view.dart';

class BottomBarController extends GetxController {
  var currentTab = 0.obs;
  final List<Widget> screens = [
    DashView(),
    HomeView(),
    const CardView(),
    AccType(),
    const CustomerSupport()
  ];

  Widget get currentScreen => screens[currentTab.value];
  
  void changeTab(int index) {
    currentTab.value = index;
  }
}
