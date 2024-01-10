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
    apiKey: 'AIzaSyDVLUnFQt2QTdCG8IdpuC5DeaP_fj6Ozcw',
    appId: '1:663440889034:web:b771aaeb4441e71492d033',
    messagingSenderId: '663440889034',
    projectId: 'plm-crs-undergrad',
    authDomain: 'plm-crs-undergrad.firebaseapp.com',
    storageBucket: 'plm-crs-undergrad.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyCem7gvCaIZ1qNjqCl9OtvWLdnyyBCOq1o',
    appId: '1:663440889034:android:a17dc51c4d2ce43192d033',
    messagingSenderId: '663440889034',
    projectId: 'plm-crs-undergrad',
    storageBucket: 'plm-crs-undergrad.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyCZdVNoiBGCO510BWPp_W9RNEZ36fgJme0',
    appId: '1:663440889034:ios:64647f18e995edcd92d033',
    messagingSenderId: '663440889034',
    projectId: 'plm-crs-undergrad',
    storageBucket: 'plm-crs-undergrad.appspot.com',
    iosBundleId: 'com.example.crsUndergrad',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyCZdVNoiBGCO510BWPp_W9RNEZ36fgJme0',
    appId: '1:663440889034:ios:d561f9114ddf756092d033',
    messagingSenderId: '663440889034',
    projectId: 'plm-crs-undergrad',
    storageBucket: 'plm-crs-undergrad.appspot.com',
    iosBundleId: 'com.example.crsUndergrad.RunnerTests',
  );
}