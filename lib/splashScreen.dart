import 'package:flutter/material.dart';
import 'package:myapp/home.dart';
import 'package:splashscreen/splashscreen.dart';
import 'login.dart';

class SplashScreenPage extends StatefulWidget {
  @override
  _SplashScreenPageState createState() => new _SplashScreenPageState();
}

class _SplashScreenPageState extends State<SplashScreenPage> {
  @override
  Widget build(BuildContext context) {
    return new SplashScreen(
      seconds: 4,
      navigateAfterSeconds: HomePage(),
      image: new Image.asset(
        'assets/images/logo.png',
        scale: 5,
      ),
      photoSize: 200,
      backgroundColor: Color.fromARGB(255, 43, 54, 62),
      loaderColor: Colors.white,
    );
  }
}
