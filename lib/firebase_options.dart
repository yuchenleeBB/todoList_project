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
    apiKey: 'AIzaSyCoUr4_AiORPnt-SCPpAxs6hCsJPCix2T0',
    appId: '1:570461943477:web:5f5e07d5b1f9c04805f0fc',
    messagingSenderId: '570461943477',
    projectId: 'todo-f9d35',
    authDomain: 'todo-f9d35.firebaseapp.com',
    storageBucket: 'todo-f9d35.appspot.com',
    measurementId: 'G-PYL0EE44EL',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyCFsfKuDzxPds_jeYFpHAPWK_AzaTBk_vo',
    appId: '1:570461943477:android:d421dc569ed8500c05f0fc',
    messagingSenderId: '570461943477',
    projectId: 'todo-f9d35',
    storageBucket: 'todo-f9d35.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyCMUrbBYBqbpAuIryXdtam09lXzq9BIwYo',
    appId: '1:570461943477:ios:5ae7cb1e552b1e2505f0fc',
    messagingSenderId: '570461943477',
    projectId: 'todo-f9d35',
    storageBucket: 'todo-f9d35.appspot.com',
    iosClientId: '570461943477-eoqbu95ts30oskudoctlqr1pfceihf5i.apps.googleusercontent.com',
    iosBundleId: 'com.example.todo',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyCMUrbBYBqbpAuIryXdtam09lXzq9BIwYo',
    appId: '1:570461943477:ios:5b214844c1605f3305f0fc',
    messagingSenderId: '570461943477',
    projectId: 'todo-f9d35',
    storageBucket: 'todo-f9d35.appspot.com',
    iosClientId: '570461943477-qct73e9rploe00gs09felkpao3n59nhe.apps.googleusercontent.com',
    iosBundleId: 'com.example.todo.RunnerTests',
  );
}