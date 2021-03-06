import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:myapp/Model/user.dart';
import 'package:myapp/Model/userModel.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'services/api.dart' as api;

class Profile extends StatefulWidget {
  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController addressController = TextEditingController();

  UserModel user;

  // List<UserModel> arr = [];

  String token;

  getPref() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    token = preferences.getString("token");
  }

  getData() async {
    UserModel data = await api.getUserData();
    setState(() {
      getPref();
      user = data;
    });
    nameController.text = user.name;
    emailController.text = user.email;
    addressController.text = user.address;
    phoneController.text = user.phone;
  }

  bool showPassword = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    if (user == null) {
      getData();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 43, 54, 62),
        title: Text('Profile'),
      ),
      body: user == null
          ? Container(
              child: Center(
                child: CircularProgressIndicator(),
              ),
            )
          : Container(
              padding: EdgeInsets.only(
                left: 16,
                top: 25,
                right: 16,
              ),
              child: GestureDetector(
                onTap: () {
                  FocusScope.of(context).unfocus();
                },
                child: ListView(
                  children: [
                    Text(
                      // Padding : const EdgeInsets.only(left: 20 ),
                      'Edit Profile',
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Center(
                      child: Stack(
                        children: [
                          Container(
                            width: 200,
                            height: 230,
                            decoration: BoxDecoration(
                              border: Border.all(
                                width: 4,
                                color: Colors.grey,
                              ),
                              boxShadow: [
                                BoxShadow(
                                  spreadRadius: 2,
                                  blurRadius: 10,
                                  // color: Colors.black.withOpacity(0.1),
                                  offset: Offset(0, 10),
                                ),
                              ],
                              shape: BoxShape.circle,
                              image: DecorationImage(
                                fit: BoxFit.cover,
                                image: AssetImage('assets/images/doctor1.jpg'),
                              ),
                            ),
                          ),
                          Positioned(
                            bottom: 5,
                            right: 20,
                            child: Container(
                              height: 50,
                              width: 50,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: Color.fromARGB(255, 43, 54, 62),
                              ),
                              child: Icon(
                                Icons.edit,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    buildTextField("Name", user.name, nameController),
                    buildTextField("E-mail", user.email, emailController),
                    buildTextField("Location", user.address, addressController),
                    buildTextField("phone", '${user.phone ?? "No Number"}',
                        phoneController),
                    SizedBox(
                      height: 20,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        OutlineButton(
                          padding: EdgeInsets.symmetric(horizontal: 50),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20),
                          ),
                          onPressed: () {
                            getData();
                          },
                          child: Text(
                            'Reset',
                            style: TextStyle(
                              fontSize: 18,
                              letterSpacing: 2.2,
                              color: Colors.black,
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(20.0),
                          child: RaisedButton(
                            onPressed: () async {
                              var updatedData = await api.updateProfile(
                                  phoneController.text,
                                  nameController.text,
                                  emailController.text,
                                  addressController.text);
                              print(updatedData);
                            },
                            color: Color.fromARGB(255, 43, 54, 62),
                            padding: EdgeInsets.symmetric(horizontal: 50),
                            elevation: 2,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: Text(
                              'Save',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 18,
                                letterSpacing: 2.2,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ),
    );
  }

  Widget buildTextField(String labelText, String placeholder,
      TextEditingController textController) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 35.0),
      child: TextField(
        controller: textController,
        style: TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.bold,
          color: Colors.black,
        ),
        decoration: InputDecoration(
          contentPadding: EdgeInsets.only(bottom: 3),
          labelText: labelText,
          floatingLabelBehavior: FloatingLabelBehavior.always,
          hintText: placeholder,
          hintStyle: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),
      ),
    );
  }
}
