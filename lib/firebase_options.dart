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
    apiKey: 'AIzaSyBvrxrGHYxSnL65bcId-Ft7RvQgV2SZDH8',
    appId: '1:58737800505:web:641c612653e1273f93a4e8',
    messagingSenderId: '58737800505',
    projectId: 'uniceps-58481',
    authDomain: 'uniceps-58481.firebaseapp.com',
    storageBucket: 'uniceps-58481.appspot.com',
    measurementId: 'G-WQ7SP65PY8',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyCWry9ThnYxbvTJ5zNk_ktXOguOuOixhjo',
    appId: '1:58737800505:android:7d3d4d0d91644e0093a4e8',
    messagingSenderId: '58737800505',
    projectId: 'uniceps-58481',
    storageBucket: 'uniceps-58481.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyBJul9phadrKM6mgvWmZUG4R_jUTPa29XQ',
    appId: '1:58737800505:ios:c786e4c54f03cc0793a4e8',
    messagingSenderId: '58737800505',
    projectId: 'uniceps-58481',
    storageBucket: 'uniceps-58481.appspot.com',
    androidClientId: '58737800505-3emsq31g633iol3m791mm6nprbo847ul.apps.googleusercontent.com',
    iosClientId: '58737800505-bae7s3crg4nko5pcbip03r0j03spleea.apps.googleusercontent.com',
    iosBundleId: 'com.example.uniceps',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyBJul9phadrKM6mgvWmZUG4R_jUTPa29XQ',
    appId: '1:58737800505:ios:e5d086281e2156f193a4e8',
    messagingSenderId: '58737800505',
    projectId: 'uniceps-58481',
    storageBucket: 'uniceps-58481.appspot.com',
    iosBundleId: 'com.example.uniceps.RunnerTests',
  );
}