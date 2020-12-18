// import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:myapp/Model/services.dart';
import 'package:myapp/loading.dart';
import 'package:myapp/login.dart' as lg;
import 'package:myapp/searchResults.dart';
import 'package:myapp/services/api.dart';

import './detailsScreen.dart' as d;
import 'Model/doctor.dart';
import 'services/api.dart' as api;
import 'package:shared_preferences/shared_preferences.dart';
// import 'Model/services.dart';

class HomePage extends StatefulWidget {
  // String value;
  // HomePage({this.value});

  // var text;
  HomePage({Key key, Key data}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Doctor> doctors;
  List<Service> services;

  var searchDoctors;
  TextEditingController search = TextEditingController();

  bool loading = false;

  var username;
  var email;
  bool isSignIn = false;

  getPref() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();

    username = preferences.getString("username");
    email = preferences.getString("email");

    if (username != null) {
      setState(() {
        username = preferences.getString("username");
        email = preferences.getString("email");
        isSignIn = true;
      });
    }
  }

  void getServices() async {
    List<Service> service = await api.fetchServices();
    setState(() {
      // print(service[0]);
      services = service;
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getPref();
    setState(() => loading = true);
    backData();

    getServices();
  }

  void backData() async {
    List<Doctor> data = await api.fetchDoctors();
    // print('THIS IS FROM AFTER REPAIR ${data}');
    setState(() {
      doctors = data;
      loading = false;
    });
  }

  void searchData(String name) async {
    var search = await api.searchDoctors(name);
    setState(() {
      searchDoctors = search;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 43, 54, 62),
        toolbarHeight: 77,
        centerTitle: true,
        title: Image(
          image: AssetImage('assets/images/logo.png'),
          width: 120,
          height: 70,
        ),
        iconTheme: IconThemeData(
          color: Colors.white,
        ),
      ),
      drawer: Drawer(
        child: Column(
          children: [
            Card(
              elevation: 4,
              child: Column(
                children: [
                  SizedBox(
                    height: 25,
                  ),
                  ListTile(
                    leading: CircleAvatar(
                      backgroundImage: AssetImage('assets/images/man.png'),
                      backgroundColor: Colors.white,
                    ),
                    title: Text(
                      isSignIn ? username : "Guest",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                        fontSize: 20,
                      ),
                    ),
                    subtitle: isSignIn
                        ? Text(
                            email,
                            style: TextStyle(
                              color: Colors.white,
                            ),
                          )
                        : Text(" "),
                  ),
                ],
              ),
              color: Color.fromARGB(255, 43, 54, 62),
            ),
            Expanded(
              child: Column(
                children: [
                  FlatButton(
                    padding: EdgeInsets.symmetric(vertical: 20, horizontal: 20),
                    onPressed: () {},
                    child: Row(
                      children: [
                        Icon(
                          Icons.home_outlined,
                          color: Color.fromARGB(255, 43, 54, 62),
                          size: 30,
                        ),
                        SizedBox(
                          width: 40,
                        ),
                        Text(
                          'Home',
                          style: TextStyle(fontSize: 16),
                        )
                      ],
                    ),
                  ),
                  isSignIn
                      ? FlatButton(
                          padding: EdgeInsets.symmetric(
                              vertical: 20, horizontal: 20),
                          onPressed: () {
                            Navigator.of(context).pushNamed("Profile");
                          },
                          child: Row(
                            children: [
                              Icon(
                                Icons.perm_identity,
                                color: Color.fromARGB(255, 43, 54, 62),
                                size: 30,
                              ),
                              SizedBox(
                                width: 40,
                              ),
                              Text(
                                'Profile',
                                style: TextStyle(fontSize: 16),
                              )
                            ],
                          ),
                        )
                      : Container(),
                  isSignIn
                      ? FlatButton(
                          padding: EdgeInsets.symmetric(
                              vertical: 20, horizontal: 20),
                          onPressed: () {
                            Navigator.of(context).pushNamed("Reservations");
                          },
                          child: Row(
                            children: [
                              Icon(
                                Icons.pending_actions_rounded,
                                color: Color.fromARGB(255, 43, 54, 62),
                                size: 30,
                              ),
                              SizedBox(
                                width: 40,
                              ),
                              Text(
                                'My Reservations',
                                style: TextStyle(fontSize: 16),
                              )
                            ],
                          ),
                        )
                      : Container(),
                  FlatButton(
                    onPressed: () {
                      Navigator.of(context).pushNamed("Contact");
                    },
                    padding: EdgeInsets.symmetric(vertical: 20, horizontal: 20),
                    child: Row(
                      children: [
                        Icon(
                          Icons.phone,
                          color: Color.fromARGB(255, 43, 54, 62),
                          size: 30,
                        ),
                        SizedBox(
                          width: 40,
                        ),
                        Text(
                          'Contact Us',
                          style: TextStyle(fontSize: 16),
                        )
                      ],
                    ),
                  ),
                  FlatButton(
                    padding: EdgeInsets.symmetric(vertical: 20, horizontal: 20),
                    onPressed: () {
                      Navigator.of(context).pushNamed("About");
                    },
                    child: Row(
                      children: [
                        Icon(
                          Icons.info_outline,
                          color: Color.fromARGB(255, 43, 54, 62),
                          size: 30,
                        ),
                        SizedBox(
                          width: 40,
                        ),
                        Text(
                          'About Me',
                          style: TextStyle(fontSize: 16),
                        )
                      ],
                    ),
                  ),
                  Spacer(),
                  FlatButton(
                    padding: EdgeInsets.symmetric(vertical: 20, horizontal: 20),
                    onPressed: () async {
                      // Navigator.popUntil(context, ModalRoute.withName('/'));
                      SharedPreferences preferences =
                          await SharedPreferences.getInstance();
                      preferences.clear();
                      Navigator.of(context).push(
                        MaterialPageRoute(builder: (context) => lg.Login()),
                        // value: value
                      );
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Text(
                          isSignIn ? 'Log Out' : " Login",
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.bold),
                        ),
                        SizedBox(
                          width: 40,
                        ),
                        isSignIn
                            ? Icon(
                                Icons.logout,
                                color: Color.fromARGB(255, 43, 54, 62),
                                size: 30,
                              )
                            : Container(),
                      ],
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(20),
              child: TextField(
                  style: TextStyle(
                    fontSize: 16,
                  ),
                  controller: search,
                  decoration: InputDecoration(
                    hintText: 'Search Vet or Clinic',
                    border: OutlineInputBorder(),
                    // hoverColor: Color.fromARGB(255, 43, 54, 62),
                    focusColor: Color.fromARGB(255, 43, 54, 62),
                    focusedBorder: OutlineInputBorder(),
                    prefixIcon: Icon(
                      Icons.search,
                      size: 35,
                      color: Color.fromARGB(255, 43, 54, 62),
                    ),
                  ),
                  textInputAction: TextInputAction.search,
                  onSubmitted: (value) {
                    print(value);
                    if (value != null) {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                            builder: (context) => Search(
                                  text: value,
                                )),
                        // value: value
                      );
                    } else {
                      print("False");
                    }
                  }),
            ),
            Container(
              height: 660,
              child: loading
                  ? Loading()
                  : ListView(
                      children: [
                        Container(
                          // height: 680,
                          child: Column(
                            children:
                                doctors.sublist(0, 3).map<Widget>((doctor) {
                              return listViewCard(doctor);
                            }).toList(),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              vertical: 15, horizontal: 10),
                          child: Text(
                            "How to use our App ?",
                            // widget.text,
                            style: TextStyle(fontSize: 18),
                          ),
                        ),
                        Column(
                          children: [
                            Card(
                              child: ListTile(
                                leading: Image.asset(
                                  'assets/images/search1.png',
                                  scale: 15,
                                ),
                                title: Text('Search '),
                                subtitle:
                                    Text('Look for your desired Clinic or Vet'),
                              ),
                            ),
                            Card(
                              child: ListTile(
                                leading: Image.asset(
                                  'assets/images/compare.png',
                                  scale: 15,
                                ),
                                title: Text('Compare & Choose '),
                                subtitle: Text('Based on patients reviews'),
                              ),
                            ),
                            Card(
                              child: ListTile(
                                leading: Image.asset(
                                  'assets/images/booking.png',
                                  scale: 15,
                                ),
                                title: Text('Book your appointment'),
                                subtitle: Text(
                                    'With the best vets in the clinic or a personal vet'),
                              ),
                            ),
                          ],
                        ),

                        //services
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              vertical: 15, horizontal: 10),
                          child: Text(
                            "Services 🐾",
                            style: TextStyle(fontSize: 18),
                          ),
                        ),

                        Container(
                          height: 200,
                          child: ListView.builder(
                            shrinkWrap: true,
                            scrollDirection: Axis.horizontal,
                            itemCount: 7,
                            itemBuilder: (context, index) {
                              return FlatButton(
                                onPressed: () {},
                                child: Container(
                                  width: 140,
                                  child: Card(
                                    child: Column(
                                      children: [
                                        Image(
                                          image: NetworkImage(
                                              services[index].image),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.fromLTRB(
                                              0, 15, 0, 0),
                                          child: Text(
                                            services[index].title,
                                            style: TextStyle(
                                              fontSize: 16,
                                              color: Color.fromARGB(
                                                  255, 43, 54, 62),
                                            ),
                                          ),
                                        ),
                                        SizedBox(
                                          height: 20,
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              );
                            },
                          ),
                        ),

                        SizedBox(
                          height: 20,
                        ),
                      ],
                    ),
            )
          ],
        ),
      ),
    );
  }

  Widget listViewCard(Doctor doctor) {
    //int index
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Card(
        child: Row(
          children: [
            Padding(
              // padding: const EdgeInsets.fromLTRB(15, 0, 15, 0),
              padding: const EdgeInsets.all(10.0),
              child: Image(
                image: AssetImage('assets/images/doctor1.jpg'),
                height: 130,
                fit: BoxFit.fill,
              ),
            ),
            Column(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(0, 15, 0, 0),
                    child: Text(
                      doctor.name,
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(50, 0, 0, 0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: 13,
                      ),
                      Row(
                        children: [
                          SizedBox(
                            height: 30,
                          ),
                          Icon(
                            Icons.pin_drop,
                            size: 18,
                            color: Color.fromARGB(255, 43, 54, 62),
                          ),
                          SizedBox(
                            width: 20,
                          ),
                          Text(
                            doctor.address,
                            style: TextStyle(fontSize: 16),
                          )
                        ],
                      ),
                      Row(
                        children: [
                          SizedBox(
                            height: 30,
                          ),
                          Icon(
                            Icons.phone,
                            size: 18,
                            color: Color.fromARGB(255, 43, 54, 62),
                          ),
                          SizedBox(
                            width: 20,
                          ),
                          Text('${doctor.phone ?? "Empty"}',
                              style: TextStyle(fontSize: 16))
                        ],
                      ),
                      Row(
                        children: [
                          SizedBox(
                            height: 30,
                          ),
                          Icon(
                            Icons.pets_outlined,
                            size: 18,
                            color: Color.fromARGB(255, 43, 54, 62),
                          ),
                          SizedBox(
                            width: 20,
                          ),
                          Text(doctor.email, style: TextStyle(fontSize: 16))
                        ],
                      ),
                      RaisedButton(
                          child: Text(
                            'More Details',
                            style: TextStyle(
                              color: Colors.white,
                            ),
                          ),
                          color: Color.fromARGB(255, 43, 54, 62),
                          onPressed: () {
                            var name = doctor.name;
                            Navigator.of(context).push(
                              MaterialPageRoute(
                                  builder: (context) => d.DetailsScreen(
                                        doctor: doctor,
                                      )),
                            );
                          }),
                      SizedBox(
                        height: 13,
                      ),
                    ],
                  ),
                ),
              ],
            ),
            Spacer()
          ],
        ),
      ),
    );
  }
}
