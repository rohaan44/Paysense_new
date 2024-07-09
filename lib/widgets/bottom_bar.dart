import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:paysense/utils/colors.dart';
import 'package:paysense/utils/images.dart';
import 'package:paysense/views/acctype_view.dart';
import 'package:paysense/views/aftercard_view.dart';
import 'package:paysense/views/custsupport_view.dart';
import 'package:paysense/views/dashboard_view.dart';
import 'package:paysense/views/home_view.dart';
// import 'package:paysense/views/login_view.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class BottomBar extends StatefulWidget {
  const BottomBar({super.key});

  @override
  State<BottomBar> createState() => _BottomBarState();
}

class _BottomBarState extends State<BottomBar> {
  int currentTab = 0;
  final List<Widget> screens = [
    DashView(),
    HomeView(),
    const CardView(),
    AccType(),
    const CustomerSupport()
  ];
  Widget currentScreen = DashView();
  final PageStorageBucket bucket = PageStorageBucket();

  @override
  Widget build(BuildContext context) {
    final isDarkMode = Theme.of(context).brightness == Brightness.dark;
    final isLightMode = Theme.of(context).brightness == Brightness.light;

    return SafeArea(
      child: Scaffold(
        extendBody: true,
        body: PageStorage(bucket: bucket, child: currentScreen),
        floatingActionButton: FloatingActionButton(
          shape: CircleBorder(),
          backgroundColor: Colors.white,
          onPressed: () {
            Get.toNamed("/QrView");
          },
          child: Image.asset(
            DummyImg.scan,
            width: 25.sp,  // Adjusted size
          ),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        bottomNavigationBar: BottomAppBar(
          elevation: 0,
          color: isDarkMode ? const Color(0xff394660) : const Color(0xffebeff9),
          height: 12.h,  // Adjusted height
          shape: const CircularNotchedRectangle(),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              buildNavBarItem(0, DummyImg.home, "Home", isDarkMode, isLightMode),
              buildNavBarItem(1, DummyImg.chat, "Chat", isDarkMode, isLightMode),
              buildNavBarItem(2, DummyImg.card, "Card", isDarkMode, isLightMode),
              buildNavBarItem(3, DummyImg.shop, "Shop", isDarkMode, isLightMode),
            ],
          ),
        ),
      ),
    );
  }

  MaterialButton buildNavBarItem(int index, String icon, String label, bool isDarkMode, bool isLightMode) {
    return MaterialButton(
      minWidth: 40,
      onPressed: () {
        setState(() {
          currentScreen = screens[index];
          currentTab = index;
        });
      },
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            icon,
            width: 6.h,  // Adjusted size
            color: getTabColor(index, currentTab, isDarkMode, isLightMode),
          ),
          Text(
            label,
            style: GoogleFonts.poppins(
              color: getTabColor(currentTab, index, isDarkMode, isLightMode),
              fontSize: 15.sp,
              fontWeight: FontWeight.w300,
            ),
          ),
        ],
      ),
    );
  }

  Color getTabColor(int check, int currentTab, bool isDarkMode, bool isLightMode) {
    if (currentTab == check) {
      return ColorUtil.bgblue;
    } else {
      return isDarkMode
          ? Colors.white
          : isLightMode
              ? Colors.black
              : Colors.black;
    }
  }
}
