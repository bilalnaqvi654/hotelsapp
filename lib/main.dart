import 'dart:io';

import 'package:apphotels/Login.dart';
import 'package:apphotels/Signup.dart';

import 'package:apphotels/UI/Screens/MainPage.dart';

import 'package:flutter/material.dart';

import 'package:firebase_core/firebase_core.dart';

import 'package:animated_splash_screen/animated_splash_screen.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final FirebaseApp app = await Firebase.initializeApp(
    options: Platform.isIOS || Platform.isMacOS
        ? FirebaseOptions(
            appId: '1:297855924061:ios:c6de2b69b03a5be8',
            apiKey: 'AIzaSyD_shO5mfO9lhy2TVWhfo1VUmARKlG4suk',
            projectId: 'flutter-firebase-plugins',
            messagingSenderId: '297855924061',
            databaseURL: 'https://flutterfire-cd2f7.firebaseio.com',
          )
        : FirebaseOptions(
            appId: '1:299895606355:android:9a7b21880a7b160e600aa6',
            apiKey: 'AIzaSyBCDvJjdCExmvB6fU62yvDVhOpHwjO-P-E',
            messagingSenderId: '297855924061',
            projectId: 'hotels-e4117',
            databaseURL: 'https://hotels-database-default-rtdb.firebaseio.com',
          ),
  );

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: AnimatedSplashScreen(
        curve: Curves.bounceInOut,
        duration: 3000,
        nextScreen: Login(),
        splash: "images/Trans.png",
        backgroundColor: Colors.grey[500],
        centered: true,
        splashTransition: SplashTransition.fadeTransition,
        splashIconSize: 100.0,
      ),
    );
  }
}
