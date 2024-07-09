import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:paysense/firebase_options.dart';
import 'package:paysense/res/routes/routes.dart';
import 'package:paysense/views/acctype_view.dart';
import 'package:paysense/views/dashboard_view.dart';
import 'package:paysense/views/splash_view.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
    ]);
    return ResponsiveSizer(
      builder: (context, orientation, screenType) {
        return GetMaterialApp(
            debugShowCheckedModeBanner: false,
            darkTheme: ThemeData.dark(),
            themeMode: ThemeMode.system,
            home: //DashView(),
            //AccType(),
            const SplashView(),
            getPages: AppRoutes.appRoutes()
            // home: const RequestMoneyView(),
            );
      },
    );
  }
}
