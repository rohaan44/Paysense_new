import 'package:get/get.dart';
import 'package:paysense/res/routes/routes_name.dart';
import 'package:paysense/views/Selfie_camera_view.dart';
import 'package:paysense/views/acctype_view.dart';
import 'package:paysense/views/after_pay_amnt_view.dart';
import 'package:paysense/views/after_request_pay_amnt_view.dart';
import 'package:paysense/views/aftercard_view.dart';
import 'package:paysense/views/beforecard_view.dart';
import 'package:paysense/views/bepay_amnt_view.dart';
import 'package:paysense/views/choose_bank_view.dart';
import 'package:paysense/views/enter_acc_no_view.dart';
import 'package:paysense/views/load_money_view.dart';
import 'package:paysense/views/notification_view.dart';
import 'package:paysense/views/request_money_view.dart';
import 'package:paysense/views/send_money_view.dart';
import 'package:paysense/views/setting_view.dart';
import 'package:paysense/views/home_view.dart';
import 'package:paysense/views/login_view.dart';
import 'package:paysense/views/qr_view.dart';
import 'package:paysense/views/register_view.dart';
import 'package:paysense/views/splash_view.dart';
import 'package:paysense/views/trans_confirm_view.dart';
import 'package:paysense/views/trans_confirm_view_page2.dart';
import 'package:paysense/views/transact_script_view.dart';
import 'package:paysense/widgets/bottom_bar.dart';

class AppRoutes {
  static appRoutes() => [
        GetPage(
          name: RouteName.splashScreen,
          page: () => const SplashView(),
        ),
        GetPage(
            name: RouteName.homeScreen,
            page: () => HomeView(),
            transition: Transition.leftToRight),
        GetPage(
            name: RouteName.accTypeScreen,
            page: () => AccType(),
            transition: Transition.leftToRight),
        GetPage(
            name: RouteName.registerScreen,
            page: () => RegisterView(),
            transition: Transition.leftToRight),
        GetPage(
            name: RouteName.loginScreen,
            page: () => LoginView(),
            transition: Transition.leftToRight),
        GetPage(
            name: RouteName.dashView,
            page: () =>  BottomBar(),
            transition: Transition.leftToRight),
        GetPage(
            name: RouteName.qrview,
            page: () => const QRView(),
            transition: Transition.leftToRight),
        GetPage(
            name: RouteName.cardview,
            page: () => const CardView(),
            transition: Transition.leftToRight),
        GetPage(
            name: RouteName.becardview,
            page: () => const BeCardView(),
            transition: Transition.leftToRight),
        GetPage(
            name: RouteName.drawer,
            page: () => SideBar(),
            transition: Transition.leftToRight),
        GetPage(
            name: RouteName.notiview,
            page: () => const NotiView(),
            transition: Transition.leftToRight),
        GetPage(
            name: RouteName.dashboardView,
            page: () =>  BottomBar(),
            transition: Transition.leftToRight),
        GetPage(
            name: RouteName.bepayAmntView,
            page: () => BePayAmnt(),
            transition: Transition.leftToRight),
        GetPage(
            name: RouteName.sendmoneyView,
            page: () => const SendMoney(),
            transition: Transition.leftToRight),
        GetPage(
            name: RouteName.chooseBankView,
            page: () => ChooseBankView(),
            transition: Transition.leftToRight),
        GetPage(
            name: RouteName.enterAccNoView,
            page: () => EnterAccNo(
                  namee: "",
                  imgg: "",
                ),
            transition: Transition.leftToRight),
        GetPage(
            name: RouteName.afterPayAmntView,
            page: () => AfterPayAmntView(
                 userData: Get.arguments,
                ),
            transition: Transition.leftToRight),
        GetPage(
            name: RouteName.transactionConfirm,
            page: () => const TransConfirmView(),
            transition: Transition.leftToRight),
        GetPage(
            name: RouteName.transactionScript,
            page: () => TransScriptView(),
            transition: Transition.leftToRight),
        GetPage(
            name: RouteName.requestMoneyView,
            page: () => const RequestMoneyView(),
            transition: Transition.leftToRight),
        GetPage(
            name: RouteName.afterRequestAmntView,
            page: () => const AfterRequestAmntView(),
            transition: Transition.leftToRight),
               GetPage(
            name: RouteName.transConfirmViewpg2,
            page: () => const TransConfirmViewpage2(),
            transition: Transition.leftToRight),
              GetPage(
            name: RouteName.loadMoneyView,
            page: () => const LoadMoneyView(),
            transition: Transition.leftToRight),
             GetPage(
            name: RouteName.selfieCameraView,
            page: () => const SelfieView(),
            transition: Transition.leftToRight),
      ];
}
