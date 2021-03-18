import 'dart:async';

import 'package:flutter/material.dart';
import 'package:project/screens/authentication/loginScreen.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  final splashDelay = 3;

  @override
  void initState() {
    super.initState();
    _loadWidget();
  }

  _loadWidget() async {
    var _duration = Duration(seconds: splashDelay);
    return Timer(_duration, navigationPage);
  }

  void navigationPage() {
    Navigator.pushReplacement(context,
        MaterialPageRoute(builder: (BuildContext context) => LoginScreen()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          color: Colors.white,
        ),
        child: Center(
          child: Icon(
            Icons.ac_unit,
            size: 100,
          ),
          // child: Image.asset(
          //   stringConstants.imgPath + "standUP-logo.png",
          //   height: 250,
          //   width: 250,
          // ),
        ),
      ),
    );
  }
}
