// File generated by FlutterFire CLI.
// ignore_for_file: lines_longer_than_80_chars, avoid_classes_with_only_static_members
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
    apiKey: 'AIzaSyB0UuxlFmSlx5K0OU5UCuoT-s2tIFLkHVo',
    appId: '1:1019971418570:web:e34d369ead1eb9d359b733',
    messagingSenderId: '1019971418570',
    projectId: 'pdp-kopi',
    authDomain: 'pdp-kopi.firebaseapp.com',
    databaseURL: 'https://pdp-kopi-default-rtdb.asia-southeast1.firebasedatabase.app',
    storageBucket: 'pdp-kopi.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyCxFtODiLTABcVDfaAO_RvvJQPaPOhSCVw',
    appId: '1:1019971418570:android:30cff364930b2e2759b733',
    messagingSenderId: '1019971418570',
    projectId: 'pdp-kopi',
    databaseURL: 'https://pdp-kopi-default-rtdb.asia-southeast1.firebasedatabase.app',
    storageBucket: 'pdp-kopi.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyDtBWF-fMbLi_SsXiUaG7aNVt1RAzaclhU',
    appId: '1:1019971418570:ios:259c3ad7e7cdefd759b733',
    messagingSenderId: '1019971418570',
    projectId: 'pdp-kopi',
    databaseURL: 'https://pdp-kopi-default-rtdb.asia-southeast1.firebasedatabase.app',
    storageBucket: 'pdp-kopi.appspot.com',
    iosBundleId: 'com.example.kopay',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyDtBWF-fMbLi_SsXiUaG7aNVt1RAzaclhU',
    appId: '1:1019971418570:ios:a7d22077fbb2147c59b733',
    messagingSenderId: '1019971418570',
    projectId: 'pdp-kopi',
    databaseURL: 'https://pdp-kopi-default-rtdb.asia-southeast1.firebasedatabase.app',
    storageBucket: 'pdp-kopi.appspot.com',
    iosBundleId: 'com.example.kopay.RunnerTests',
  );
}