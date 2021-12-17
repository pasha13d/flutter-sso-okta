import 'dart:async';

import 'package:flutter/material.dart';
import 'dart:math';

import 'package:phoenix/main.dart';
import 'package:phoenix/Animations/Waves.dart';

class SplashScreen extends StatefulWidget {
  static const routeName = '/splash';
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    // startTime();
    super.initState();
  }

  // startTime() async {
  //   var _duration = Duration(seconds: 10);
  //   return Timer(_duration, navigationPage);
  // }

  void navigationPage() {
    Navigator.of(context).pushReplacementNamed('/login');
  }

  onBottom(Widget child) => Positioned.fill(
        child: Align(
          alignment: Alignment.bottomCenter,
          child: child,
        ),
      );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          Container(
            color: Colors.white,
          ),
          onBottom(AnimatedWave(
            height: 120, speed: 0.6, color: Colors.lightBlueAccent,
          )),
          onBottom(AnimatedWave(
              height: 140, speed: 0.7, offset: pi, color: Colors.lightGreen)),
          onBottom(AnimatedWave(
              height: 180, speed:0.9, offset: pi / 2, color: Colors.blue)),
        ],
      ),
    );
  }
}
