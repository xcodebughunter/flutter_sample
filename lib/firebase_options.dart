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
    apiKey: 'AIzaSyDwXkhFShOutDvEtd6Uv8NK8lpYRx6gX38',
    appId: '1:1028554283621:web:c497c769db892bb472448c',
    messagingSenderId: '1028554283621',
    projectId: 'clevertap-db80d',
    authDomain: 'clevertap-db80d.firebaseapp.com',
    storageBucket: 'clevertap-db80d.appspot.com',
    measurementId: 'G-MVKCKTPZ6D',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyBox7lWw4wWkNRvjX4kkO9yi-W0oNFmvUE',
    appId: '1:1028554283621:android:280661dfa177d1df72448c',
    messagingSenderId: '1028554283621',
    projectId: 'clevertap-db80d',
    storageBucket: 'clevertap-db80d.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyDPT9qC3jzxf_aHBFi47UCaINL6V4Oqbqc',
    appId: '1:1028554283621:ios:08805f949755a2b772448c',
    messagingSenderId: '1028554283621',
    projectId: 'clevertap-db80d',
    storageBucket: 'clevertap-db80d.appspot.com',
    iosBundleId: 'com.singoloDigital.ct',
  );
}
