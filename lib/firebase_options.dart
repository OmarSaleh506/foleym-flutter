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
    apiKey: 'AIzaSyDVx2f9F1rHBCuaJrTxnihSr90mttl_FTk',
    appId: '1:432291323018:web:a90de19298564dcac26173',
    messagingSenderId: '432291323018',
    projectId: 'flutter-foleym',
    authDomain: 'flutter-foleym.firebaseapp.com',
    storageBucket: 'flutter-foleym.appspot.com',
    measurementId: 'G-82TFK45FRC',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyCtXt2wgaAKkz5YlNDIquFslO1tybzh7ss',
    appId: '1:432291323018:android:1a3ac05647507f26c26173',
    messagingSenderId: '432291323018',
    projectId: 'flutter-foleym',
    storageBucket: 'flutter-foleym.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyD-boJmfkAzjMJMrU12VjWQf8ErdmvEA0o',
    appId: '1:432291323018:ios:fbe6b23a00ae7a3cc26173',
    messagingSenderId: '432291323018',
    projectId: 'flutter-foleym',
    storageBucket: 'flutter-foleym.appspot.com',
    iosClientId: '432291323018-3enrk8120mrmtt32eheqv59vrba5hid4.apps.googleusercontent.com',
    iosBundleId: 'com.example.foleym',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyD-boJmfkAzjMJMrU12VjWQf8ErdmvEA0o',
    appId: '1:432291323018:ios:fbe6b23a00ae7a3cc26173',
    messagingSenderId: '432291323018',
    projectId: 'flutter-foleym',
    storageBucket: 'flutter-foleym.appspot.com',
    iosClientId: '432291323018-3enrk8120mrmtt32eheqv59vrba5hid4.apps.googleusercontent.com',
    iosBundleId: 'com.example.foleym',
  );
}
