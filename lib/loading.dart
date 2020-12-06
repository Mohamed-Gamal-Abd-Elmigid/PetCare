import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class Loading extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Center(
        child: SpinKitHourGlass(
          // duration: Duration(milliseconds: 9000),
          color: Color.fromARGB(255, 43, 54, 62),
          size: 100.0,
        ),
      ),
    );
  }
}
