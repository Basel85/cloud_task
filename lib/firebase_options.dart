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
    apiKey: 'AIzaSyCddFIZNj4HTyrdk9v3IRie5BOJ4nlx9k8',
    appId: '1:714783938048:web:7c9ac86fb3287da0b16ae5',
    messagingSenderId: '714783938048',
    projectId: 'quran-d1335',
    authDomain: 'quran-d1335.firebaseapp.com',
    databaseURL: 'https://quran-d1335-default-rtdb.firebaseio.com',
    storageBucket: 'quran-d1335.appspot.com',
    measurementId: 'G-6R4G8DQFVZ',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyALmpV3dYy193NSeSUAnnkRqZdcTPeK1HA',
    appId: '1:714783938048:android:082a09ce0ea69638b16ae5',
    messagingSenderId: '714783938048',
    projectId: 'quran-d1335',
    storageBucket: 'quran-d1335.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyDBnlEN6RsW-KPa6tbkqEqVi376KYisWao',
    appId: '1:714783938048:ios:3ce008589e9a5c4bb16ae5',
    messagingSenderId: '714783938048',
    projectId: 'quran-d1335',
    storageBucket: 'quran-d1335.appspot.com',
    androidClientId:
        '714783938048-rn22o9rm8r6f2gq00v9s2g7eup07etcb.apps.googleusercontent.com',
    iosClientId:
        '714783938048-s903t9slv5fo7s9upclfb1uu01ol3jo9.apps.googleusercontent.com',
    iosBundleId: 'com.example.quranApp',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyDBnlEN6RsW-KPa6tbkqEqVi376KYisWao',
    appId: '1:714783938048:ios:5ff9d6a3b108b3bbb16ae5',
    messagingSenderId: '714783938048',
    projectId: 'quran-d1335',
    storageBucket: 'quran-d1335.appspot.com',
    androidClientId:
        '714783938048-rn22o9rm8r6f2gq00v9s2g7eup07etcb.apps.googleusercontent.com',
    iosClientId:
        '714783938048-gm63jprsjsrmc2rogia36q133f6rmisi.apps.googleusercontent.com',
    iosBundleId: 'com.example.quranApp.RunnerTests',
  );
}
