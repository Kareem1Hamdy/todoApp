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
    apiKey: 'AIzaSyDPuYn5ORVh2RpNffNVkRnI-N2_vqSEMRQ',
    appId: '1:184682546211:web:a451c19df055afa4ba9d96',
    messagingSenderId: '184682546211',
    projectId: 'todoapp-5ccd9',
    authDomain: 'todoapp-5ccd9.firebaseapp.com',
    storageBucket: 'todoapp-5ccd9.appspot.com',
    measurementId: 'G-0P51GN56FR',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyBkCj89A1bXOkTjRWHAygWC5YUm8jpZCYQ',
    appId: '1:184682546211:android:05c51614434f41aaba9d96',
    messagingSenderId: '184682546211',
    projectId: 'todoapp-5ccd9',
    storageBucket: 'todoapp-5ccd9.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyBbOChXloguSpXbEK1yLqGZc3NpuiAN07U',
    appId: '1:184682546211:ios:f2459d9aa3cace24ba9d96',
    messagingSenderId: '184682546211',
    projectId: 'todoapp-5ccd9',
    storageBucket: 'todoapp-5ccd9.appspot.com',
    iosBundleId: 'com.example.todoApp',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyBbOChXloguSpXbEK1yLqGZc3NpuiAN07U',
    appId: '1:184682546211:ios:f2459d9aa3cace24ba9d96',
    messagingSenderId: '184682546211',
    projectId: 'todoapp-5ccd9',
    storageBucket: 'todoapp-5ccd9.appspot.com',
    iosBundleId: 'com.example.todoApp',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyDPuYn5ORVh2RpNffNVkRnI-N2_vqSEMRQ',
    appId: '1:184682546211:web:dd3f026616b8f77fba9d96',
    messagingSenderId: '184682546211',
    projectId: 'todoapp-5ccd9',
    authDomain: 'todoapp-5ccd9.firebaseapp.com',
    storageBucket: 'todoapp-5ccd9.appspot.com',
    measurementId: 'G-3PYK87FELG',
  );

}