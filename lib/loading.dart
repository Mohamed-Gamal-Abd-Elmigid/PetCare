import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class Loading extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white12,
      child: Center(
        child: SpinKitRotatingCircle(
          duration: Duration(milliseconds: 700),
          color: Color.fromARGB(255, 43, 54, 62),
          size: 60.0,
        ),
      ),
    );
  }
}
