import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';

Future initFirebase() async {
  if (kIsWeb) {
    await Firebase.initializeApp(
        options: const FirebaseOptions(
            apiKey: "AIzaSyAIQdCv71ivPE60OzM54E3NWMDnmJyYcr4",
            authDomain: "weet-project.firebaseapp.com",
            projectId: "weet-project",
            storageBucket: "weet-project.appspot.com",
            messagingSenderId: "566212589131",
            appId: "1:566212589131:web:f8d9f81d310d123890bfce",
            measurementId: "G-DG83HB5RHE"));
  } else {
    await Firebase.initializeApp();
  }
}
