import 'package:firebase_core/firebase_core.dart' show FirebaseOptions;
import 'package:flutter/foundation.dart'
    show defaultTargetPlatform, kIsWeb, TargetPlatform;

class DefaultFirebaseOptions {
  static FirebaseOptions get currentPlatform {
    if (kIsWeb) {
      return web;
    }
    // ignore: missing_enum_constant_in_switch
    switch (defaultTargetPlatform) {
      case TargetPlatform.android:
        return android;
      case TargetPlatform.iOS:
        return ios;
      case TargetPlatform.macOS:
        return macos;
              default:
        throw UnsupportedError(
          'DefaultFirebaseOptions are not supported for this platform.',);
 
    }

    throw UnsupportedError(
      'DefaultFirebaseOptions are not supported for this platform.',
    );
  }

  static const FirebaseOptions web = FirebaseOptions(
    apiKey: 'AIzaSyAgUhHU8wSJgO5MVNy95tMT07NEjzMOfz0',
    appId: '1:448618578101:web:a8ebc6ab724e6baaac3efc',
    messagingSenderId: '448618578101',
    projectId: 'react-native-firebase-testing',
    authDomain: 'react-native-firebase-testing.firebaseapp.com',
    databaseURL: 'https://react-native-firebase-testing.firebaseio.com',
    storageBucket: 'react-native-firebase-testing.appspot.com',
    measurementId: 'G-RF9GF9MQ1F',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyCuu4tbv9CwwTudNOweMNstzZHIDBhgJxA',
    appId: '1:448618578101:android:0568e76dc62e89bcac3efc',
    messagingSenderId: '448618578101',
    projectId: 'react-native-firebase-testing',
    databaseURL: 'https://react-native-firebase-testing.firebaseio.com',
    storageBucket: 'react-native-firebase-testing.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyAHAsf51D0A407EklG1bs-5wA7EbyfNFg0',
    appId: '1:448618578101:ios:0b11ed8263232715ac3efc',
    messagingSenderId: '448618578101',
    projectId: 'react-native-firebase-testing',
    databaseURL: 'https://react-native-firebase-testing.firebaseio.com',
    storageBucket: 'react-native-firebase-testing.appspot.com',
    androidClientId:
    '448618578101-a9p7bj5jlakabp22fo3cbkj7nsmag24e.apps.googleusercontent.com',
    iosClientId:
    '448618578101-evbjdqq9co9v29pi8jcua8bm7kr4smuu.apps.googleusercontent.com',
    iosBundleId: 'io.flutter.plugins.firebase.messaging',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyAHAsf51D0A407EklG1bs-5wA7EbyfNFg0',
    appId: '1:448618578101:ios:0b11ed8263232715ac3efc',
    messagingSenderId: '448618578101',
    projectId: 'react-native-firebase-testing',
    databaseURL: 'https://react-native-firebase-testing.firebaseio.com',
    storageBucket: 'react-native-firebase-testing.appspot.com',
    androidClientId:
    '448618578101-a9p7bj5jlakabp22fo3cbkj7nsmag24e.apps.googleusercontent.com',
    iosClientId:
    '448618578101-evbjdqq9co9v29pi8jcua8bm7kr4smuu.apps.googleusercontent.com',
    iosBundleId: 'io.flutter.plugins.firebase.messaging',
  );
}