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
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for ios - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
      case TargetPlatform.macOS:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for macos - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
      case TargetPlatform.windows:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for windows - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
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
    apiKey: 'AIzaSyB06bevlgC4FF3kxiAwEF-g_0ulbWaAn1o',
    appId: '1:213578638321:web:1f350af2ff4ee88bf91a50',
    messagingSenderId: '213578638321',
    projectId: 'e-commerce-app-4a277',
    authDomain: 'e-commerce-app-4a277.firebaseapp.com',
    storageBucket: 'e-commerce-app-4a277.appspot.com',
    measurementId: 'G-BBMG13BGQS',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyCxb8V6FKcpLWpXjUd0CNgl_MUXSXDLz5c',
    appId: '1:213578638321:android:bda650c1cd631cdff91a50',
    messagingSenderId: '213578638321',
    projectId: 'e-commerce-app-4a277',
    storageBucket: 'e-commerce-app-4a277.appspot.com',
  );

}