import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:paysense/firebase_options.dart';
import 'package:paysense/res/routes/routes.dart';
import 'package:paysense/views/splash_view.dart';
import 'package:paysense/views/tester.dart';

import 'package:responsive_sizer/responsive_sizer.dart';



void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  
  // Debug prints to check initialization
  debugPrint('Initializing Firebase...');
  
  if (Firebase.apps.isEmpty) {
    debugPrint('No Firebase apps initialized. Initializing now...');
    await Firebase.initializeApp(
       options: DefaultFirebaseOptions.currentPlatform,
    );
    debugPrint('Firebase initialized.');
  } else {
    debugPrint('Firebase already initialized.');
  }

  SystemChrome.setSystemUIOverlayStyle(
    SystemUiOverlayStyle.dark.copyWith(
      statusBarColor: Colors.transparent,
      systemNavigationBarColor: Colors.transparent,
    ),
  );
  
  SystemChrome.setSystemUIOverlayStyle(
    SystemUiOverlayStyle.light.copyWith(
      statusBarColor: Colors.transparent,
      systemNavigationBarColor: Colors.transparent,
    ),
  );
  
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
            //initialRoute: RouteName.splashScreen,
            home: SplashView(),
            getPages: AppRoutes.appRoutes()
            
            );
      },
    );
  }
}
