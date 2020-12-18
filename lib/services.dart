import 'package:flutter/material.dart';
import 'package:myapp/Model/doctor.dart';
import 'package:myapp/home.dart';
import 'package:myapp/login.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'services/api.dart' as api;

class ServiceID {
  final String name;
  final String image;
  bool selected;
  ServiceID(this.name, this.image, {this.selected = false});
}

class Services extends StatefulWidget {
  String doctorID;
  String date;
  List<DoctorService> services;
  Services({Key key, @required this.doctorID, this.date, this.services})
      : super(key: key);

  @override
  _ServicesState createState() => _ServicesState();
}

class _ServicesState extends State<Services> {
  List<ServiceID> arr = [];

  String token;

  getPref() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    token = preferences.getString("token");
    print(token);
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getPref();
    widget.services.forEach((element) {
      arr.add(ServiceID(element.title, element.image));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 77,
        backgroundColor: Color.fromARGB(255, 43, 54, 62),
        title: Image(
          image: AssetImage('assets/images/logo.png'),
          width: 120,
          height: 70,
        ),
        centerTitle: true,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () => Navigator.of(context).pop(),
        ),
      ),
      body: Container(
        color: Colors.blueGrey.shade200,
        // margin: EdgeInsets.all(10),
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.only(top: 10),
              alignment: Alignment.center,
              margin: EdgeInsets.only(top: 15),
              child: Text(
                "Choose the required services",
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.right,
              ),
            ),
            SizedBox(
              height: 40,
            ),
            Expanded(
              child: ListView.builder(
                padding: const EdgeInsets.all(20.0),
                itemCount: arr.length,
                itemBuilder: (context, index) {
                  return Container(
                    width: 400,
                    child: Card(
                      child: Row(
                        children: [
                          Padding(
                            // padding: const EdgeInsets.fromLTRB(15, 0, 15, 0),
                            padding: const EdgeInsets.all(10.0),
                            child: Image(
                              image: NetworkImage(widget.services[index].image),
                              height: 130,
                              fit: BoxFit.fill,
                            ),
                          ),
                          Column(
                            children: [
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 10),
                                child: Padding(
                                  padding:
                                      const EdgeInsets.fromLTRB(10, 2, 2, 2),
                                  child: Text(
                                    widget.services[index].title,
                                    style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          Padding(
                            padding: const EdgeInsets.only(right: 20.0),
                            child: Column(
                              children: [
                                Checkbox(
                                  value: arr[index].selected,
                                  // checkColor: Color.fromARGB(255, 43, 54, 62),
                                  activeColor: Color.fromARGB(255, 43, 54, 62),
                                  onChanged: (v1) {
                                    setState(() {
                                      arr[index].selected = v1;
                                    });
                                  },
                                ),
                                Text('Needed'),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.only(top: 20.0),
              child: SizedBox(
                // width: double.infinity,
                // width: double.infinity,
                width: 220,
                height: 50,
                child: RaisedButton(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(18.0),
                      side: BorderSide(color: Colors.white)),
                  child: Text(
                    'Reserve',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  color: Color.fromARGB(255, 43, 54, 62),
                  onPressed: () async {
                    if (token != null) {
                      List<String> serviceID = [];
                      for (int i = 0; i < arr.length; i++) {
                        if (arr[i].selected) {
                          serviceID.add(widget.services[i].id);
                        }
                      }
                      print(serviceID);
                      var reserve = await api.reserve(
                          widget.doctorID, serviceID, widget.date, token);
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => HomePage(),
                        ),
                      );
                      return;
                    }

                    // print(arr[0].selected);
                  },
                ),
              ),
            ),
            SizedBox(
              height: 50,
            ),
          ],
        ),
      ),
    );
  }
}
