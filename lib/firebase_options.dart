// File generated by FlutterFire CLI.
// ignore_for_file: lines_longer_than_80_chars, avoid_classes_with_only_static_members
import 'package:firebase_core/firebase_core.dart' show FirebaseOptions;
import 'package:flutter/foundation.dart' show defaultTargetPlatform, kIsWeb, TargetPlatform;

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
    apiKey: 'AIzaSyCSL7sv8-xpKS1H142dsq3mctZvXrd8WpI',
    appId: '1:272472289431:web:e09c836548470160adf9d2',
    messagingSenderId: '272472289431',
    projectId: 'edsper',
    authDomain: 'edsper.firebaseapp.com',
    storageBucket: 'edsper.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyBu23OO1PgQTURLguzvU-lj83s2zGogc2c',
    appId: '1:272472289431:android:d683e0789d310f9badf9d2',
    messagingSenderId: '272472289431',
    projectId: 'edsper',
    storageBucket: 'edsper.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyDYcfVP7S_TvAK2HUH4UaTval1Y-9N5mWQ',
    appId: '1:272472289431:ios:a495f9d7e4cca08dadf9d2',
    messagingSenderId: '272472289431',
    projectId: 'edsper',
    storageBucket: 'edsper.appspot.com',
    iosBundleId: 'id.edspert.elearning',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyDYcfVP7S_TvAK2HUH4UaTval1Y-9N5mWQ',
    appId: '1:272472289431:ios:2578f4992919c6e6adf9d2',
    messagingSenderId: '272472289431',
    projectId: 'edsper',
    storageBucket: 'edsper.appspot.com',
    iosBundleId: 'id.edspert.elearning.RunnerTests',
  );
}
