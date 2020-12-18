import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:myapp/Model/reserve.dart';
import 'package:myapp/home.dart';
import 'package:myapp/services/mapDirection.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'services/api.dart' as api;
import 'package:url_launcher/url_launcher.dart';

class Info extends StatefulWidget {
  Reserve information;
  Info({Key key, @required this.information, Key data}) : super(key: key);

  @override
  _InfoState createState() => _InfoState();
}

class _InfoState extends State<Info> {
  double rating;

  @override
  initState() {
    // TODO: implement initState
    // TODO: implement initState
    super.initState();
    // getID();
    // newRate();
  }

  deleteResrve() async {
    var delete = await api.deleteReservation(widget.information.id);
    print(delete);
    return delete;
  }

  // newRate() async {
  //   var rate = await api.updateRate(widget.information.id, rating, 1);
  //   return rate;
  // }

  String getStatus() {
    int status = widget.information.status;
    if (status == 0) return "Waiting";
    if (status == 1) return "Accepted";
    if (status == 2) return "Complete";
    if (status == -1) return "Rejected";

    return "";
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 43, 54, 62),
        centerTitle: true,
        title: Text(
          'Reservations Info',
          style: TextStyle(
            fontSize: 20,
            color: Colors.white,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          color: Colors.blueGrey.shade100,
          child: Column(
            children: [
              Row(
                children: [
                  Container(
                    padding: const EdgeInsets.only(left: 10.0, top: 10.0),
                    child: Text(
                      'Status: ${getStatus()}',
                      style: TextStyle(
                        color: Color.fromARGB(255, 43, 54, 62),
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Spacer(),
                  Container(
                    padding: const EdgeInsets.only(right: 10.0, top: 10.0),
                    child: RaisedButton(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(18.0),
                          side: BorderSide(color: Colors.white)),
                      child: Text(
                        'Cancel',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      color: Color.fromARGB(255, 43, 54, 62),
                      onPressed: () async {
                        bool result = await deleteResrve();
                        print('This US RESULT $result');
                        if (result) {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => HomePage(),
                            ),
                          );
                        }
                      },
                    ),
                  ),
                ],
              ),
              Container(
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10)),
                margin: EdgeInsets.all(10),
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Row(
                        children: [
                          Container(
                            child: Image(
                              image: AssetImage('assets/images/doctor1.jpg'),
                              height: 130,
                              fit: BoxFit.fill,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(right: 30.0),
                            child: Column(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.all(10.0),
                                  child: Text(
                                    widget.information.doctor.name,
                                    style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(10.0),
                                  child: Row(
                                    children: [
                                      Icon(
                                        Icons.date_range_rounded,
                                        color: Color.fromARGB(255, 43, 54, 62),
                                        size: 25,
                                      ),
                                      SizedBox(
                                        width: 5,
                                      ),
                                      Container(
                                        child: Text(
                                          widget.information.date,
                                          style: TextStyle(
                                            fontSize: 16,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      alignment: Alignment.center,
                      margin: EdgeInsets.all(10),
                      // padding: EdgeInsets.only(left: 10),
                      child: Text(
                        //doctor.email,
                        "A veterinarian is a medical professional who protects the health and well-being of both animals and people. They diagnose and control animal diseases and treat sick and injured animals. ",
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.black,
                        ),
                        textAlign: TextAlign.justify,
                        maxLines: 3,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10)),
                margin: EdgeInsets.fromLTRB(10, 10, 10, 0),
                child: Column(
                  children: [
                    Container(
                      alignment: Alignment.center,
                      margin: EdgeInsets.only(top: 20, bottom: 10),
                      child: Text(
                        "Contact",
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold),
                        textAlign: TextAlign.right,
                      ),
                    ),
                    Divider(
                      thickness: 1.5,
                      color: Colors.black38,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Row(
                        children: [
                          Icon(
                            Icons.phone,
                            color: Color.fromARGB(255, 43, 54, 62),
                            size: 35,
                          ),
                          SizedBox(
                            width: 5,
                          ),
                          Text(
                            // widget.information[0].user.address,
                            '${widget.information.doctor.phone ?? "Empty"}',
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Divider(
                      thickness: 1.5,
                      color: Colors.black38,
                    ),
                    Container(
                      child: Row(
                        // mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: Icon(
                              Icons.location_on,
                              color: Color.fromARGB(255, 43, 54, 62),
                              size: 30,
                            ),
                          ),
                          SizedBox(
                            width: 3,
                          ),
                          Text(
                            widget.information.doctor.address,
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 120.0),
                            child: RaisedButton(
                              onPressed: () {
                                MapUtils.openMap(
                                    widget.information.doctor.lat ??
                                        "30.033333",
                                    widget.information.doctor.lng ??
                                        "31.233334");
                              },
                              color: Color.fromARGB(255, 43, 54, 62),
                              child: Text(
                                'Directions',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                  fontSize: 16,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Divider(
                      thickness: 1.5,
                      color: Colors.black38,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Row(
                        children: [
                          Icon(
                            Icons.email,
                            color: Color.fromARGB(255, 43, 54, 62),
                            size: 35,
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Text(
                            // 'Dr.${widget.doctor.name}' ?? " ",
                            widget.information.doctor.email,
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10)),
                margin: EdgeInsets.fromLTRB(10, 10, 10, 0),
                child: Column(
                  children: [
                    Container(
                      alignment: Alignment.center,
                      margin: EdgeInsets.only(top: 20, bottom: 10),
                      child: Text(
                        "Add Rate",
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold),
                        textAlign: TextAlign.right,
                      ),
                    ),
                    Divider(
                      thickness: 1.5,
                      color: Colors.black38,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Row(
                        children: [
                          Icon(
                            Icons.rate_review_rounded,
                            color: Color.fromARGB(255, 43, 54, 62),
                            size: 35,
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Container(
                            // alignment: Alignment.center,
                            width: 200,
                            child: RatingBar.builder(
                              initialRating: widget.information.rate != null
                                  ? widget.information.rate.toDouble()
                                  : 0,
                              minRating: 1,
                              direction: Axis.horizontal,
                              allowHalfRating: true,
                              itemCount: 5,
                              itemPadding:
                                  EdgeInsets.symmetric(horizontal: 4.0),
                              itemBuilder: (context, _) => Icon(
                                Icons.star,
                                color: Color.fromARGB(255, 43, 54, 62),
                              ),
                              itemSize: 30,
                              onRatingUpdate: (rate) {
                                rating = rate;
                              },
                              ignoreGestures: widget.information.status != 2,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 30.0),
                            child: RaisedButton(
                              onPressed: () async {
                                await api.updateRate(
                                    widget.information.id, rating);
                              },
                              color: Color.fromARGB(255, 43, 54, 62),
                              child: Text(
                                'Submit',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                  fontSize: 16,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10)),
                margin: EdgeInsets.fromLTRB(10, 10, 10, 0),
                child: Column(
                  children: [
                    Container(
                      alignment: Alignment.center,
                      margin: EdgeInsets.only(top: 20, bottom: 10),
                      child: Text(
                        "Reservation Services",
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold),
                        textAlign: TextAlign.right,
                      ),
                    ),
                    Divider(
                      thickness: 1.5,
                      color: Colors.black38,
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width,
                      height: 100,
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        shrinkWrap: true,
                        itemCount: widget.information.services.length,
                        itemBuilder: (context, index) {
                          return Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: Row(
                              children: [
                                Icon(
                                  Icons.medical_services_rounded,
                                  color: Color.fromARGB(255, 43, 54, 62),
                                  size: 35,
                                ),
                                SizedBox(
                                  width: 10,
                                ),
                                Text(
                                  widget.information.services[index].title,
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 30,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
