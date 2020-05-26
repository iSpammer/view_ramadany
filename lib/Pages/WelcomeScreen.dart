import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:viewramadany/API/auth.dart';
import 'package:viewramadany/Utils/button.dart';

import '../main.dart';
import 'LoginPage.dart';
import 'RegisterPage.dart';

class WelcomeScreen extends StatefulWidget {
  final BaseAuth auth;

  const WelcomeScreen({Key key, this.auth}) : super(key: key);

  @override
  _WelcomeScreenState createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen>
    with SingleTickerProviderStateMixin {
  AnimationController _controller;

  Animation _animation;

  @override
  void initState() {
    super.initState();
    _controller =
        new AnimationController(duration: Duration(seconds: 2), vsync: this);
    _animation =
        ColorTween(begin: Colors.blue, end: bgColor).animate(_controller);
    _controller.forward();

    _controller.addListener(() {
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    final Brightness brightnessValue =
        MediaQuery.of(context).platformBrightness;
    bool isDark = brightnessValue == Brightness.dark;
    return Scaffold(
      backgroundColor: _animation.value,
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Row(
              children: <Widget>[
                Hero(
                  tag: "logo",
                  child: Container(
                    child: Image.asset('assets/logo.png'),
                    height: 60,
                  ),
                ),
                SizedBox(
                  width: 10,
                ),
                Center(
                  child: Hero(
                    tag: "name",
                    child: TypewriterAnimatedTextKit(
                      speed: Duration(
                        milliseconds: 750,
                      ),
                      text: ['View Ramadany!'],
                      textStyle: TextStyle(
                        fontSize: 42.0,
                        fontWeight: FontWeight.w900,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 48.0,
            ),
            Hero(
              tag: "login",
              child: Button(
                fn: () {
                  Navigator.of(context).push(CupertinoPageRoute<void>(
                    builder: (BuildContext context) => LoginPage(),
                  ));
                },
                text: 'Log in',
                bgColor: isDark ? Colors.white30 : Colors.blueAccent,
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Hero(
              tag: "register",
              child: Button(
                bgColor: isDark ? Colors.white30 : Colors.blueAccent,
                fn: () {
                  Navigator.of(context).push(CupertinoPageRoute<void>(
                    builder: (BuildContext context) => RegisterPage(),
                  ));
                },
                text: 'Register',
              ),
            ),
          ],
        ),
      ),
    );
  }
}
