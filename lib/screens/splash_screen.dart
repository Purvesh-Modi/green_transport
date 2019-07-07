import 'dart:async';

import "package:flutter/material.dart";
import 'package:green_transport/app_routing/routing_constants.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    loadTimer();
  }
  
  Future<Timer> loadTimer() async {
    return Timer(Duration(seconds: 5), navigate);
  }
  
  navigate() {
    Navigator.of(context)
      .pushReplacementNamed(Screens.HOME);
  }
  
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Container(
        color: Colors.grey[300],
        child: Center(
          child: ListView(
            shrinkWrap: true,
            children: <Widget>[
              Image.asset("images/splash.gif"),
              SizedBox(child: Image.asset(
                "images/title.png",
                color: Colors.blue,
                ),
                         height: 50,width: 200,)
            ],
            ),
          ),
        ),
      );
  }
}
