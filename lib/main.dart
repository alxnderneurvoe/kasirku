import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'loginpage.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: const FirebaseOptions(
        apiKey: "AIzaSyDq5W1RjJ9nEUyQaf6VCr8wlGI5uHVHC5k",
        authDomain: "kasirku-440a6.firebaseapp.com",
        databaseURL:
            "https://kasirku-440a6-default-rtdb.asia-southeast1.firebasedatabase.app",
        projectId: "kasirku-440a6",
        storageBucket: "kasirku-440a6.appspot.com",
        messagingSenderId: "376147356765",
        appId: "1:376147356765:android:72263478cb85a1a07fb1b4"),
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: LoginPage(),
    );
  }
}
