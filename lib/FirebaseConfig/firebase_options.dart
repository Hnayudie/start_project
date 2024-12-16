import 'dart:convert';
import 'dart:io';
import 'package:firebase_core/firebase_core.dart' show FirebaseOptions;
import 'package:flutter/foundation.dart' show defaultTargetPlatform, kIsWeb, TargetPlatform;

class DefaultFirebaseOptions {
  static FirebaseOptions get currentPlatform {
    final config = _loadConfig();

    if (kIsWeb) {
      throw UnsupportedError(
        'DefaultFirebaseOptions have not been configured for web - '
            'you can reconfigure this by running the FlutterFire CLI again.',
      );
    }
    switch (defaultTargetPlatform) {
      case TargetPlatform.android:
        return FirebaseOptions(
          apiKey: config['android']['apiKey'],
          appId: '1:565888010760:android:0c7ff8f16bc33789c2dfbd',
          messagingSenderId: '565888010760',
          projectId: 'start-project-ace62',
          storageBucket: 'start-project-ace62.firebasestorage.app',
        );
      case TargetPlatform.iOS:
        return FirebaseOptions(
          apiKey: config['ios']['apiKey'],
          appId: '1:565888010760:ios:cecb06c1bd471744c2dfbd',
          messagingSenderId: '565888010760',
          projectId: 'start-project-ace62',
          storageBucket: 'start-project-ace62.firebasestorage.app',
          iosBundleId: 'com.example.startProject',
        );
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

  static Map<String, dynamic> _loadConfig() {
    final file = File('firebase_config.json');
    if (!file.existsSync()) {
      throw FileSystemException('Missing firebase_config.json file');
    }
    return jsonDecode(file.readAsStringSync());
  }
}
