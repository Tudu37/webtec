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
    apiKey: 'AIzaSyCmBfknkBfSQIzgnyWgf5arnOdKtiVPrfw',
    appId: '1:465780040842:web:8c0c4ab12c3f7033f8f973',
    messagingSenderId: '465780040842',
    projectId: 'webtec-865d7',
    authDomain: 'webtec-865d7.firebaseapp.com',
    storageBucket: 'webtec-865d7.appspot.com',
    measurementId: 'G-3E62X4Q4DF',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyDCa53n2uaohVXpzk9nnyz_fg5BGqsFON4',
    appId: '1:465780040842:android:85410b1bfe1fe6f2f8f973',
    messagingSenderId: '465780040842',
    projectId: 'webtec-865d7',
    storageBucket: 'webtec-865d7.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyBGeUFbgXH2IofqLcAuEYtX77x3fAs0H84',
    appId: '1:465780040842:ios:708af44eaac7d44ef8f973',
    messagingSenderId: '465780040842',
    projectId: 'webtec-865d7',
    storageBucket: 'webtec-865d7.appspot.com',
    iosBundleId: 'com.example.webtec',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyBGeUFbgXH2IofqLcAuEYtX77x3fAs0H84',
    appId: '1:465780040842:ios:708af44eaac7d44ef8f973',
    messagingSenderId: '465780040842',
    projectId: 'webtec-865d7',
    storageBucket: 'webtec-865d7.appspot.com',
    iosBundleId: 'com.example.webtec',
  );
}