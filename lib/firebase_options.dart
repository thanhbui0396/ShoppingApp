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
    apiKey: 'AIzaSyBMQUyaS1MCqloVLdJU4RtsLMG3clKb2z8',
    appId: '1:528933467934:web:faaaf1585d9c8e20f1bb0f',
    messagingSenderId: '528933467934',
    projectId: 'shopping-f46c1',
    authDomain: 'shopping-f46c1.firebaseapp.com',
    storageBucket: 'shopping-f46c1.appspot.com',
    measurementId: 'G-W9W3Y9CD7F',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyANvKmaWzO8ZduKG0dUvomXHhOmlNuyEMw',
    appId: '1:528933467934:android:b8bb30509949cb71f1bb0f',
    messagingSenderId: '528933467934',
    projectId: 'shopping-f46c1',
    storageBucket: 'shopping-f46c1.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyAFjEz2JdlIv7iw9KVpSBG1zbVliwo3eIE',
    appId: '1:528933467934:ios:2b345890c78428e2f1bb0f',
    messagingSenderId: '528933467934',
    projectId: 'shopping-f46c1',
    storageBucket: 'shopping-f46c1.appspot.com',
    iosBundleId: 'com.example.shoppingApp',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyAFjEz2JdlIv7iw9KVpSBG1zbVliwo3eIE',
    appId: '1:528933467934:ios:fd65e31b3889836af1bb0f',
    messagingSenderId: '528933467934',
    projectId: 'shopping-f46c1',
    storageBucket: 'shopping-f46c1.appspot.com',
    iosBundleId: 'com.example.shoppingApp.RunnerTests',
  );
}
