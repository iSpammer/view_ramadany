
import 'package:animated_splash/animated_splash.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:viewramadany/Pages/HomePage.dart';
import 'package:viewramadany/Pages/WelcomeScreen.dart';

bool darkModeOn =
    SchedulerBinding.instance.window.platformBrightness == Brightness.dark;
Color bgColor = darkModeOn ? Colors.black : Colors.white;

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  // This widget is the root of your application.
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(),
      darkTheme:
          ThemeData.dark().copyWith(scaffoldBackgroundColor: Colors.black),
      title: 'View Ramadany',
      home: AnimatedSplash(
        type: AnimatedSplashType.StaticDuration,
        imagePath: 'assets/logo.png',
        home: WelcomeScreen(),
        duration: 2500,
      ),
    );
  }

//  Map<dynamic, Widget> returnValueAndHomeScreen = {
//    true: HomePage(),
//    false: WelcomeScreen()
//  };
//
//  Future<Widget> customFunction() async {
//    FirebaseUser user = await FirebaseAuth.instance.currentUser();
//    if (user != null) {
//      return Future.value(HomePage());
//    } else {
//      return Future.value(WelcomeScreen());
//    }
//  }
//
//  Future<void> loginCheck() async {}
}
