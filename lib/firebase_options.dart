// File generated by FlutterFire CLI.
// ignore_for_file: type=lint
import 'package:firebase_core/firebase_core.dart' show FirebaseOptions;
import 'package:flutter/foundation.dart'
    show defaultTargetPlatform, kIsWeb, TargetPlatform;

/// Default [FirebaseOptions] for use with your Firebase apps.
///
/// Example:
/// ```dart
/// import 'firebase_options.dart';
/// // ...
/// await Firebase.initializeApp(
///   options: DefaultFirebaseOptions.currentPlatform,
/// );
/// ```
class DefaultFirebaseOptions {
  static FirebaseOptions get currentPlatform {
    if (kIsWeb) {
      return web;
    }
    switch (defaultTargetPlatform) {
      case TargetPlatform.android:
        return android;
      case TargetPlatform.iOS:
        return ios;
      case TargetPlatform.macOS:
        return macos;
      case TargetPlatform.windows:
        return windows;
      case TargetPlatform.linux:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for linux - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
      default:
        throw UnsupportedError(
          'DefaultFirebaseOptions are not supported for this platform.',
        );
    }
  }

  static const FirebaseOptions web = FirebaseOptions(
    apiKey: 'AIzaSyAS5a4uK0cxIbWhgBFXpZiwnwSN2MXHPC0',
    appId: '1:488232699086:web:d38d0c8af6b88d70d77c9f',
    messagingSenderId: '488232699086',
    projectId: 'paysense-fd25d',
    authDomain: 'paysense-fd25d.firebaseapp.com',
    storageBucket: 'paysense-fd25d.appspot.com',
    measurementId: 'G-38X8BXDTMD',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyAx18u0iwaq3goCpOtfFtc0KsZCEq72fPs',
    appId: '1:488232699086:android:d0e326e3bc13e298d77c9f',
    messagingSenderId: '488232699086',
    projectId: 'paysense-fd25d',
    storageBucket: 'paysense-fd25d.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyAZ9CCg1IHtpiSf5Js0jZthEn-oB72hK5Y',
    appId: '1:488232699086:ios:64228bce8490b898d77c9f',
    messagingSenderId: '488232699086',
    projectId: 'paysense-fd25d',
    storageBucket: 'paysense-fd25d.appspot.com',
    iosBundleId: 'com.example.paysense',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyAZ9CCg1IHtpiSf5Js0jZthEn-oB72hK5Y',
    appId: '1:488232699086:ios:64228bce8490b898d77c9f',
    messagingSenderId: '488232699086',
    projectId: 'paysense-fd25d',
    storageBucket: 'paysense-fd25d.appspot.com',
    iosBundleId: 'com.example.paysense',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyAS5a4uK0cxIbWhgBFXpZiwnwSN2MXHPC0',
    appId: '1:488232699086:web:4686cc5ef86b6740d77c9f',
    messagingSenderId: '488232699086',
    projectId: 'paysense-fd25d',
    authDomain: 'paysense-fd25d.firebaseapp.com',
    storageBucket: 'paysense-fd25d.appspot.com',
    measurementId: 'G-KKJ89BTHLS',
  );
}
