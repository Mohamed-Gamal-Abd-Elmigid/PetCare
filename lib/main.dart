import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:myapp/signup.dart';
// import 'package:petcare/screens/forget.pasword.dart';
import 'login.dart';
// import './home.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Pet Care',
      theme: ThemeData(
        textTheme:
            GoogleFonts.josefinSansTextTheme(Theme.of(context).textTheme),
        primarySwatch: Colors.blue,
        accentColor: Colors.blue,
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => Login(),
        // 'ForgetPassword': (context) => ForgetPassword(),
        'Signup': (context) => Signup(),
      },
    );
  }
}
