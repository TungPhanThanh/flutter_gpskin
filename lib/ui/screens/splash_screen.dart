import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_gpskin/ui/screens/about_you.dart';
import 'package:flutter_gpskin/ui/screens/login.dart';

class SplashScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => new SplashScreenState();
}

extension ColorExtension on String {
  toColor() {
    var hexColor = this.replaceAll("#", "");
    if (hexColor.length == 6) {
      hexColor = "FF" + hexColor;
    }
    if (hexColor.length == 8) {
      return Color(int.parse("0x$hexColor"));
    }
  }
}

class SplashScreenState extends State<SplashScreen> {
  startTime() async {
    var _duration = new Duration(seconds: 3);
    return new Timer(_duration, navigationPage);
  }

  void navigationPage() {
    Navigator.pushReplacement(
        context, MaterialPageRoute(builder: (context) => LoginScreen()));
  }

  @override
  void initState() {
    super.initState();
    startTime();
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: new Container(
        child: new Center(
            child: new Container(
              width: 200,
              height: 54,
              child: new Image.asset('assets/images/logo/logo.png'),
        )),
        decoration: new BoxDecoration(color: '#26cef4'.toColor()),
      ),
    );
  }
}
