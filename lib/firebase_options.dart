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
    apiKey: 'AIzaSyBlm19FopGkhPTGNLcv5HAYABRzRbKmLUE',
    appId: '1:115281990453:web:a128e04bf71f11f9f3727c',
    messagingSenderId: '115281990453',
    projectId: 'miniproject-67005',
    authDomain: 'miniproject-67005.firebaseapp.com',
    storageBucket: 'miniproject-67005.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyCEpqDTsHBaUYSGAd8WlO2WJzpEqkKcwHc',
    appId: '1:115281990453:android:6da682851ad4f51ff3727c',
    messagingSenderId: '115281990453',
    projectId: 'miniproject-67005',
    storageBucket: 'miniproject-67005.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyChQ_vLwL_TPTZ5YfeXXZzUCqgyv20j6O0',
    appId: '1:115281990453:ios:d414e2992a0eb34af3727c',
    messagingSenderId: '115281990453',
    projectId: 'miniproject-67005',
    storageBucket: 'miniproject-67005.appspot.com',
    iosBundleId: 'com.example.miniProject',
  );
}
