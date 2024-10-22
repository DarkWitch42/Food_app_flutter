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
    apiKey: 'AIzaSyCGzOY7OFeq3_SzsVqqamrjL8go70NNjq0',
    appId: '1:151454045801:web:5f2bcd96dd85b47d95f4f8',
    messagingSenderId: '151454045801',
    projectId: 'fooddeliveryproject-38123',
    authDomain: 'fooddeliveryproject-38123.firebaseapp.com',
    storageBucket: 'fooddeliveryproject-38123.appspot.com',
    measurementId: 'G-LYE7ZXXQFC',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyBAe8Rvpl2swfs94mPwzplkZOS32GnbKAc',
    appId: '1:151454045801:android:e14c048d040845ed95f4f8',
    messagingSenderId: '151454045801',
    projectId: 'fooddeliveryproject-38123',
    storageBucket: 'fooddeliveryproject-38123.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyAzRqex9BC67IePs1qWkJrb8n2_aZ8VASk',
    appId: '1:151454045801:ios:ea06b5be4ab4489495f4f8',
    messagingSenderId: '151454045801',
    projectId: 'fooddeliveryproject-38123',
    storageBucket: 'fooddeliveryproject-38123.appspot.com',
    iosBundleId: 'com.example.test001',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyAzRqex9BC67IePs1qWkJrb8n2_aZ8VASk',
    appId: '1:151454045801:ios:ea06b5be4ab4489495f4f8',
    messagingSenderId: '151454045801',
    projectId: 'fooddeliveryproject-38123',
    storageBucket: 'fooddeliveryproject-38123.appspot.com',
    iosBundleId: 'com.example.test001',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyCGzOY7OFeq3_SzsVqqamrjL8go70NNjq0',
    appId: '1:151454045801:web:d1e52966bcb8137895f4f8',
    messagingSenderId: '151454045801',
    projectId: 'fooddeliveryproject-38123',
    authDomain: 'fooddeliveryproject-38123.firebaseapp.com',
    storageBucket: 'fooddeliveryproject-38123.appspot.com',
    measurementId: 'G-GQM197KEM2',
  );
}
