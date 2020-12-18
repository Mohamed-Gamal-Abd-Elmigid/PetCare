import 'package:flutter/material.dart';
import 'package:flutter_progress_button/flutter_progress_button.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:myapp/pallete.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'Model/user.dart';
import 'home.dart';
import 'login.dart';
import 'services/api.dart' as api;

// import 'validate.dart' as validator;
import 'validate.dart' as valid;

class Signup extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => SignUpState();
}

class SignUpState extends State<Signup> {
  bool autoValidate = false;

  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();

  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPassword = TextEditingController();

  TextEditingController addressController = TextEditingController();

  final signup = GlobalKey<FormState>();

  FocusNode myFocusNode = new FocusNode();

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
          body: Form(
            key: signup,
            autovalidate: autoValidate,
            child: Padding(
                padding: EdgeInsets.all(10),
                child: ListView(
                  children: <Widget>[
                    Container(
                      child: Image.asset("assets/images/logo.png"),
                      width: MediaQuery.of(context).size.width * 0.6,
                      height: MediaQuery.of(context).size.width * 0.4,
                    ),
                    Container(
                      padding: EdgeInsets.fromLTRB(15, 10, 15, 0),
                      child: TextFormField(
                        // autovalidate: true,
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
                              FontAwesomeIcons.user,
                              size: 18,
                              color: kWhite,
                            ),
                          ),
                          labelText: 'user name',
                          labelStyle: TextStyle(
                              color: myFocusNode.hasFocus
                                  ? Colors.blue
                                  : Colors.white),
                          hintText: 'Enter User Name',
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
                        validator:
                            MinLengthValidator(3, errorText: "Too Short"),
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.fromLTRB(15, 10, 15, 0),
                      child: TextFormField(
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.white,
                        ),
                        controller: emailController,
                        cursorColor: Colors.white,
                        decoration: InputDecoration(
                          prefixIcon: Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 20.0),
                            child: Icon(
                              FontAwesomeIcons.envelope,
                              size: 18,
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
                        validator: (value) {
                          return !valid.validEmail(value)
                              ? "Email is Required"
                              : null;
                        },
                      ),
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
                              size: 18,
                              color: kWhite,
                            ),
                          ),
                          labelText: 'Password',
                          labelStyle: TextStyle(
                              color: myFocusNode.hasFocus
                                  ? Colors.blue
                                  : Colors.white),
                          hintText: 'Enter Password',
                          errorStyle: TextStyle(
                            color: Colors.yellow,
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                          ),
                          focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.white)),
                          border: OutlineInputBorder(borderSide: BorderSide()),
                        ),
                        validator: MultiValidator([
                          RequiredValidator(errorText: 'password is required'),
                          MinLengthValidator(6,
                              errorText:
                                  'password must be at least 6 digits long'),
                          PatternValidator(r'(?=.*?[#?!@$%^&*-])',
                              errorText:
                                  'passwords must have at least one special character')
                        ]),
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.fromLTRB(15, 10, 15, 0),
                      child: TextFormField(
                        obscureText: true,
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.white,
                        ),
                        controller: confirmPassword,
                        cursorColor: Colors.white,
                        decoration: InputDecoration(
                          prefixIcon: Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 20.0),
                            child: Icon(
                              FontAwesomeIcons.lock,
                              size: 18,
                              color: kWhite,
                            ),
                          ),
                          labelText: 'Confirm Pass',
                          labelStyle: TextStyle(
                              color: myFocusNode.hasFocus
                                  ? Colors.blue
                                  : Colors.white),
                          hintText: 'Confirm Password',
                          errorStyle: TextStyle(
                            color: Colors.yellow,
                            fontWeight: FontWeight.bold,
                            fontSize: 18,
                          ),
                          focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.white)),
                          border: OutlineInputBorder(borderSide: BorderSide()),
                        ),
                        validator: (val) {
                          if (val.isEmpty) return 'Empty';
                          if (val != passwordController.text)
                            return 'Not Match';
                          return null;
                        },
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.fromLTRB(15, 10, 15, 0),
                      child: TextFormField(
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.white,
                        ),
                        controller: addressController,
                        cursorColor: Colors.white,
                        decoration: InputDecoration(
                          prefixIcon: Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 20.0),
                            child: Icon(
                              FontAwesomeIcons.home,
                              size: 18,
                              color: kWhite,
                            ),
                          ),
                          labelText: 'Address',
                          labelStyle: TextStyle(
                              color: myFocusNode.hasFocus
                                  ? Colors.blue
                                  : Colors.white),
                          hintText: 'Enter Your Address',
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
                        validator: RequiredValidator(errorText: "Required"),
                      ),
                    ),
                    SizedBox(
                      height: 25,
                    ),
                    Container(
                      height: 50,
                      padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
                      child: Center(
                          child: ProgressButton(
                        // textColor: Colors.white,
                        // color: Colors.blue,
                        // disabledColor: Colors.grey,

                        color: Colors.blue,
                        animate: true,
                        progressWidget: const CircularProgressIndicator(
                          backgroundColor: Colors.white,
                        ),

                        defaultWidget: Text('Sign Up',
                            style: TextStyle(
                              fontSize: 27,
                              fontWeight: FontWeight.bold,
                            )),
                        onPressed: () async {
                          if (!signup.currentState.validate()) {
                            setState(() {
                              autoValidate = true;
                            });
                            return;
                          } else {
                            var result = await api.register(
                              new User(
                                  name: nameController.text,
                                  email: emailController.text,
                                  password: passwordController.text,
                                  address: addressController.text),
                            );

                            if (result) {
                              Navigator.of(context).push(
                                MaterialPageRoute(
                                  builder: (context) => HomePage(),
                                ),
                              );
                            }
                          }
                        },
                        //   else {
                        //     print("False");
                        //   }
                        // }
                        // : null,
                      )),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Container(
                        child: Row(
                      children: <Widget>[
                        Text(
                          'have account?',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 10,
                          ),
                        ),
                        FlatButton(
                          textColor: Colors.blue,
                          child: Text(
                            'Log In',
                            style: TextStyle(
                                fontSize: 18, fontWeight: FontWeight.bold),
                          ),
                          onPressed: () {
                            Navigator.pop(context);
                          },
                        )
                      ],
                      mainAxisAlignment: MainAxisAlignment.center,
                    ))
                  ],
                )),
          )),
    );
  }
}
