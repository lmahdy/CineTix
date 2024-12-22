import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';

Future initFirebase() async {
  if (kIsWeb) {
    await Firebase.initializeApp(
        options: const FirebaseOptions(
            apiKey: "AIzaSyDT_4iZGl1r2yxVKQ-QxasCGcOToWAdsV0",
            authDomain: "cinetix-9921b.firebaseapp.com",
            projectId: "cinetix-9921b",
            storageBucket: "cinetix-9921b.firebasestorage.app",
            messagingSenderId: "910699088779",
            appId: "1:910699088779:web:b35d8d3d474ddb988dfd8e"));
  } else {
    await Firebase.initializeApp();
  }
}
