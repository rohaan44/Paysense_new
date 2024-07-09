import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:paysense/utils/colors.dart';
import 'package:paysense/utils/images.dart';
import 'package:paysense/viewmodel/choose_bank_viewmodel.dart';
import 'package:paysense/views/enter_acc_no_view.dart';
import 'package:paysense/widgets/ui.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

// ignore: must_be_immutable
class ChooseBankView extends StatelessWidget {
  ChooseBankView({super.key});
  ChooseBankController homeController = Get.put(ChooseBankController());
  @override
  Widget build(BuildContext context) {
    final isDarkMode = Theme.of(context).brightness == Brightness.dark;

    return SafeArea(
      child: Scaffold(
          body: Stack(children: [
        const Uitemplate(),
        Column(children: [
          Padding(
            padding: const EdgeInsets.only(left: 35, top: 45.0, bottom: 20),
            child: Row(
              children: [
                GestureDetector(
                  onTap: () {
                    Get.back();
                  },
                  child: Image.asset(
                    DummyImg.chevleft,
                    width: 32,
                    height: 32,
                    color: isDarkMode ? Colors.white : Colors.black87,
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(
              left: 35,
            ),
            child: Align(
              alignment: Alignment.centerLeft,
              child: Text(
                "Choose Institution",
                style: GoogleFonts.poppins(
                  fontSize: 23.sp,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 35, vertical: 25),
            child: SizedBox(
              height: MediaQuery.of(context).size.height * 0.06,
              child: TextField(
                onChanged: (value) => homeController.filterPlayer(value),
                decoration: InputDecoration(
                    enabledBorder: OutlineInputBorder(
                      borderSide:
                          BorderSide(color: ColorUtil.bordercolor, width: 1),
                    ),
                    hintText: 'Search....',
                    prefixIcon: Icon(
                      Icons.search,
                      color: ColorUtil.bordercolor,
                    ),
                    hintStyle: TextStyle(color: ColorUtil.bordercolor)),
              ),
            ),
          ),
          Expanded(
            child: Obx(
              () => ListView.builder(
                shrinkWrap: true,
                physics: const AlwaysScrollableScrollPhysics(),
                itemCount: homeController.foundPlayers.value.length,
                itemBuilder: (context, index) => Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 30, vertical: 7),
                  child: GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (BuildContext context) => EnterAccNo(
                                    namee: homeController
                                        .foundPlayers.value[index]['bankname'],
                                    imgg: homeController
                                        .foundPlayers.value[index]['bankimg'],
                                  )));
                    },
                    child: ListTile(
                      leading: CircleAvatar(
                        backgroundColor: Colors.white,
                        backgroundImage: AssetImage(
                          homeController.foundPlayers.value[index]['bankimg'],
                        ),
                        // radius: 20,
                      ),
                      title: Text(
                        homeController.foundPlayers.value[index]['bankname'],
                        style: const TextStyle(
                            fontSize: 16, fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ]),
      ])),
    );
  }
}
