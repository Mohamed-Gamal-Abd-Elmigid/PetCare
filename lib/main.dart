import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:myapp/home.dart';
import 'package:myapp/profile.dart';
import 'package:myapp/reservations.dart';
import 'package:myapp/searchResults.dart';
import 'package:myapp/signup.dart';
import 'package:myapp/splashScreen.dart';
import 'package:shared_preferences/shared_preferences.dart';
// import 'package:petcare/screens/forget.pasword.dart';
import 'about.dart';
import 'contact.dart';
import 'login.dart';

// import './home.dart';
//
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SharedPreferences preferences = await SharedPreferences.getInstance();
  var username = preferences.getString("username");
  var email = preferences.getString("email");
  if (username != null && email != null) {
    runApp(MyApp(true));
  } else
    runApp(MyApp(false));
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  bool isLogin;

  MyApp(this.isLogin);
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
      initialRoute: isLogin ? "Home" : '/',
      routes: {
        '/': (context) => SplashScreenPage(),
        'Home': (context) => HomePage(),
        // 'ForgetPassword': (context) => ForgetPassword(),
        'Signup': (context) => Signup(),
        'Contact': (context) => Contact(),
        'About': (context) => About(),
        'Search': (context) => Search(),
        'Profile': (context) => Profile(),
        'Reservations': (context) => Reservations(),
        // 'SplashScreenPage': (context) => SplashScreenPage(),
      },
    );
  }
}
