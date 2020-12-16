import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:myapp/Model/reserve.dart';
import 'package:myapp/info.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'services/api.dart' as api;

class Reservations extends StatefulWidget {
  @override
  _ReservationsState createState() => _ReservationsState();
}

class _ReservationsState extends State<Reservations> {
  List<Reserve> reserves;
  String token;

  getPref() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    token = preferences.getString("token");
    // print(token);
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getPref();
    fetchReservation();
  }

  //List<Reserve>

  fetchReservation() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    token = preferences.getString("token");
    List<Reserve> data = await api.getReservations(token);
    setState(() {
      reserves = data;
      // print(reserves.toString());
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 43, 54, 62),
        centerTitle: true,
        title: Text(
          'Reservations',
          style: TextStyle(
            fontSize: 20,
            color: Colors.white,
          ),
        ),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Text(
              'Your Reservations',
              style: TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
          ),
          Container(
            width: 400,
            height: 600,
            child: getBody(),
          ),
          SizedBox(
            height: 30,
          ),
        ],
      ),
    );
  }

  Widget getBody() {
    return reserves == null
        ? Center(
            child: Container(
              child: CircularProgressIndicator(),
            ),
          )
        : ListView.builder(
            //reserves.length
            itemCount: reserves.length,
            itemBuilder: (context, index) {
              return getCard(index);
            },
          );
  }

  Widget getCard(index) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Card(
        color: Colors.grey.shade300,
        child: ListTile(
            title: Row(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 10.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    //reserves[index].date
                    reserves[index].doctor.name,
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    reserves[index].doctor.email,
                    style: TextStyle(
                      fontSize: 20,
                      color: Colors.grey.shade900,
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  RaisedButton(
                    child: Text(
                      'More Info',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                    color: Color.fromARGB(255, 43, 54, 62),
                    onPressed: () {
                      //  var name = doctor.name;
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => Info(
                            information: reserves[index],
                          ),
                        ),
                      );
                    },
                  ),
                ],
              ),
            ),
            Spacer(),
            Container(
              width: 120,
              height: 100,
              decoration: BoxDecoration(
                // color: Colors.teal,

                image: DecorationImage(
                  fit: BoxFit.cover,
                  image: AssetImage('assets/images/doctor1.jpg'),
                ),
              ),
            ),
          ],
        )),
      ),
    );
  }
}
