import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:myapp/pallete.dart';
import 'package:shared_preferences/shared_preferences.dart';
// import 'detailsScreen.dart';
import 'home.dart';
import 'validate.dart' as valid;
import 'services/api.dart' as api;
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter_progress_button/flutter_progress_button.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Login extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _State();
  // TODO: implement createState
}

class _State extends State<Login> {
  TextEditingController nameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  final loginKey = GlobalKey<FormState>();
  bool autoValidate = false;

  FocusNode myFocusNode = new FocusNode();

  void Vaildate() {
    if (loginKey.currentState.validate()) {
      print("Validated");
    } else {
      print("Not Validated");
    }
  }

  String passValidate(value) {
    if (value.isEmpty) {
      return "Required";
    } else {
      return null;
    }
  }

  String value;
  //String username,
  savePref(String username, String email, String token) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();

    preferences.setString("username", username);
    preferences.setString("email", email);
    preferences.setString("token", token);
  }

  getPref() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    var username = preferences.getString("username");
    var email = preferences.getString("email");
    var token = preferences.getString("token");
    if (username != null && email != null && token != null) {
      Navigator.of(context).pushNamed("HomePage");
    }
  }

  @override
  void initState() {
    getPref();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage("assets/images/cat.jpg"),
          fit: BoxFit.cover,
          colorFilter: new ColorFilter.mode(
              Colors.black.withOpacity(0.7), BlendMode.dstATop),
        ),
      ),
      child: Scaffold(
          backgroundColor: Colors.transparent,
          // backgroundColor: Color.fromARGB(255, 164, 184, 121),
          body: Padding(
              padding: EdgeInsets.all(10),
              child: Form(
                key: loginKey,
                autovalidate: autoValidate,
                child: ListView(
                  children: <Widget>[
                    Container(
                      child: Image.asset("assets/images/logo.png"),
                      width: 300,
                      height: 200,
                    ),
                    Container(
                      padding: EdgeInsets.fromLTRB(15, 10, 15, 0),
                      child: TextFormField(
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.white,
                        ),
                        controller: nameController,
                        cursorColor: Colors.white,
                        decoration: InputDecoration(
                          prefixIcon: Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 20.0),
                            child: Icon(
                              FontAwesomeIcons.envelope,
                              size: 28,
                              color: kWhite,
                            ),
                          ),
                          labelText: 'Email',
                          labelStyle: TextStyle(
                              color: myFocusNode.hasFocus
                                  ? Colors.blue
                                  : Colors.white),
                          hintText: 'Enter Your Mail',
                          errorStyle: TextStyle(
                            color: Colors.yellow,
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                          ),
                          focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.white)),
                          border: OutlineInputBorder(
                            borderSide: BorderSide(),
                          ),
                        ),
                        //nameController.text.length != 0
                        validator: (value) {
                          return !valid.validEmail(value)
                              ? "Email is Required"
                              : null;
                        },
                      ),
                    ),
                    SizedBox(
                      height: 25,
                    ),
                    Container(
                      padding: EdgeInsets.fromLTRB(15, 10, 15, 0),
                      child: TextFormField(
                        obscureText: true,
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.white,
                        ),
                        controller: passwordController,
                        cursorColor: Colors.white,
                        decoration: InputDecoration(
                          prefixIcon: Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 20.0),
                            child: Icon(
                              FontAwesomeIcons.lock,
                              size: 28,
                              color: kWhite,
                            ),
                          ),
                          labelText: 'Password',
                          labelStyle: TextStyle(
                              color: myFocusNode.hasFocus
                                  ? Colors.blue
                                  : Colors.white),
                          hintText: 'Password',
                          errorStyle: TextStyle(
                            color: Colors.yellow,
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                          ),
                          focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.white)),
                          border: OutlineInputBorder(borderSide: BorderSide()),
                        ),
                        validator: (value) {
                          return value.length < 5 ? "Required pass" : null;
                        },
                      ),
                    ),
                    FlatButton(
                      onPressed: () {
                        //forgot password screen
                      },
                      textColor: Colors.white,
                      child: Text(
                        'Forgot Password',
                        style: TextStyle(
                          fontSize: 20.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    Container(
                      height: 50,
                      padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
                      child: Center(
                        child: ProgressButton(
                          color: Colors.blue,
                          // disabledColor: Colors.grey,
                          animate: true,
                          progressWidget: const CircularProgressIndicator(
                            backgroundColor: Colors.white,
                          ),

                          defaultWidget: Text(
                            'Login',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          // disabledColor: Colors.grey,

                          onPressed: () async {
                            if (!loginKey.currentState.validate()) {
                              setState(() {
                                autoValidate = true;
                              });
                            } else {
                              print("true");
                              var title = await api.Login(
                                  nameController.text, passwordController.text);

                              var email = await api.email(
                                  nameController.text, passwordController.text);

                              var token = await api.token(
                                  nameController.text, passwordController.text);

                              print(title);
                              print(email);
                              print(token);

                              await savePref(title, email, token);

                              if (title != null) {
                                Navigator.of(context).push(
                                  MaterialPageRoute(
                                      builder: (context) => HomePage(
                                          // text: title,
                                          )),
                                  // value: value
                                );
                              }
                            }
                          },
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 24,
                    ),
                    Container(
                      height: 50,
                      padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
                      child: Center(
                        child: ProgressButton(
                          color: Colors.blue,
                          // disabledColor: Colors.grey,
                          animate: true,
                          progressWidget: const CircularProgressIndicator(
                            backgroundColor: Colors.white,
                            strokeWidth: 23.0,
                          ),

                          defaultWidget: Text(
                            'As Guest',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          // disabledColor: Colors.grey,

                          onPressed: () async {
                            Navigator.of(context).push(
                              MaterialPageRoute(
                                  builder: (context) => HomePage(
                                        isSignIn: false,
                                      )),
                              // value: value
                            );
                          },
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 24,
                    ),
                    Container(
                        child: Row(
                      children: <Widget>[
                        Text(
                          'Does not have account?',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                          ),
                        ),
                        FlatButton(
                          // textColor: Color.fromARGB(255, 201, 99, 108),
                          textColor: Colors.blue,
                          child: Text(
                            'Sign up',
                            style: TextStyle(
                              fontSize: 22,
                              // backgroundColor: Colors.white70,
                              // Color.fromARGB(255, 218, 195, 186),
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          onPressed: () {
                            Navigator.pushNamed(context, "Signup");
                          },
                        )
                      ],
                      mainAxisAlignment: MainAxisAlignment.center,
                    ))
                  ],
                ),
              ))),
    );
  }
}
