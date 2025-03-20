import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';

Future initFirebase() async {
  if (kIsWeb) {
    await Firebase.initializeApp(
        options: FirebaseOptions(
            apiKey: "AIzaSyATY7Xvpb_CSVUZ53MRImbtO89LOBDd9og",
            authDomain: "smokersbbq-19b20.firebaseapp.com",
            projectId: "smokersbbq-19b20",
            storageBucket: "smokersbbq-19b20.firebasestorage.app",
            messagingSenderId: "702813150215",
            appId: "1:702813150215:web:cdea3a9b1d36f1917f5ea2",
            measurementId: "G-V1NSCDQ3M9"));
  } else {
    await Firebase.initializeApp();
  }
}
