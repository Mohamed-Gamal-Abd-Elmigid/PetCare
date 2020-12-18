import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:myapp/Model/doctor.dart';
import 'package:myapp/login.dart';
import 'package:myapp/services.dart';
import 'package:shared_preferences/shared_preferences.dart';

class DetailsScreen extends StatefulWidget {
  Doctor doctor;
  DetailsScreen({Key key, @required this.doctor, Key data}) : super(key: key);

  @override
  _DetailsScreenState createState() => _DetailsScreenState();
}

class _DetailsScreenState extends State<DetailsScreen> {
  bool isLogIn = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    checkLogin();
  }

  checkLogin() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    if (preferences.getString("token") != null) {
      setState(() {
        isLogIn = true;
      });
    }
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
      body: SingleChildScrollView(
        child: Container(
          color: Colors.blueGrey.shade100,
          child: Column(
            children: [
              Container(
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10)),
                margin: EdgeInsets.all(10),
                child: Column(
                  children: [
                    Column(
                      children: [
                        Container(
                          padding: const EdgeInsets.only(
                              right: 15, top: 10, bottom: 0),
                          alignment: Alignment.centerRight,
                          child:
                              Text("Seen 231", style: TextStyle(fontSize: 16)),
                        ),
                        ClipRRect(
                            borderRadius: BorderRadius.circular(50),
                            child: Image.asset(
                              'assets/images/doctor1.jpg',
                              height: 100,
                            )),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 10),
                      child: Text('Dr.${widget.doctor.name}' ?? " ",
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.bold)),
                    ),
                    Container(
                      alignment: Alignment.center,
                      padding: EdgeInsets.only(top: 10),
                      child: Text(
                        '${widget.doctor.phone ?? "Empty"}',
                        //"As clinic director, I hold responsibility for maintaining and environment that promotes collaborative and supportive practices",
                        style: TextStyle(
                          fontSize: 16,
                          color: Color.fromARGB(255, 43, 54, 62),
                        ),
                        textAlign: TextAlign.left,
                      ),
                    ),
                    Container(
                      alignment: Alignment.center,
                      margin: EdgeInsets.all(10),
                      // padding: EdgeInsets.only(left: 10),
                      child: Text(
                        //doctor.email,
                        "A veterinarian, a doctorate in pet surgery, and five years of experience in providing all pet services, including treatment, surgery, grooming and other services.",
                        style: TextStyle(fontSize: 14, color: Colors.grey),
                        textAlign: TextAlign.justify,
                        maxLines: 3,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    Container(
                      alignment: Alignment.center,
                      width: 200,
                      child: RatingBar.builder(
                        initialRating: 3.5,
                        minRating: 1,
                        direction: Axis.horizontal,
                        allowHalfRating: true,
                        itemCount: 5,
                        itemPadding: EdgeInsets.symmetric(horizontal: 4.0),
                        itemBuilder: (context, _) => Icon(
                          Icons.star,
                          color: Colors.yellow,
                          //Color.fromARGB(255, 43, 54, 62),
                        ),
                        itemSize: 20,
                        onRatingUpdate: (rating) {
                          print(rating);
                        },
                      ),
                    ),
                    Container(
                      alignment: Alignment.center,
                      margin: EdgeInsets.all(15),
                      padding: EdgeInsets.only(left: 10),
                      child: Text(
                        "Overall Rating From 199 Visitors",
                        style: TextStyle(fontSize: 16),
                        textAlign: TextAlign.right,
                        maxLines: 2,
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
                        "Reserve",
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
                      margin: EdgeInsets.only(bottom: 15),
                      alignment: Alignment.center,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Container(
                            height: 80,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Icon(
                                  Icons.money_rounded,
                                  color: Colors.green,
                                  size: 35,
                                ),
                                Text(
                                  "Reservation is 200 pounds",
                                  style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w500),
                                )
                              ],
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
                          Text(
                            widget.doctor.address,
                            style: TextStyle(
                                fontSize: 16, fontWeight: FontWeight.bold),
                          ),
                          SizedBox(
                            width: 120.0,
                          ),
                          RaisedButton(
                            onPressed: () {},
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
                        ],
                      ),
                    ),
                    Divider(
                      thickness: 1.5,
                      color: Colors.black38,
                    ),
                    Container(
                      padding: EdgeInsets.only(bottom: 10),
                      alignment: Alignment.center,
                      margin: EdgeInsets.only(top: 15),
                      child: Text(
                        "Choose when to book",
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.bold),
                        textAlign: TextAlign.right,
                      ),
                    ),
                    Container(
                      height: 150,
                      width: MediaQuery.of(context).size.width,
                      alignment: Alignment.center,
                      color: Colors.grey.shade100,
                      child: Container(
                        width: 100.0 * widget.doctor.availabeDayes.length,
                        child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: widget.doctor.availabeDayes.length,
                          itemBuilder: (context, index) {
                            return reservationWidget(
                                avDay: widget.doctor.availabeDayes[index]);
                          },
                        ),
                      ),
                    ),
                    Divider(
                      thickness: 1.5,
                      color: Colors.black38,
                      height: 0,
                    ),
                    // Container(
                    //   padding: EdgeInsets.only(bottom: 10),
                    //   alignment: Alignment.center,
                    //   margin: EdgeInsets.only(top: 15),
                    //   child: Text(
                    //     "Choose the required services",
                    //     style: TextStyle(
                    //         fontSize: 18, fontWeight: FontWeight.bold),
                    //     textAlign: TextAlign.right,
                    //   ),
                    // ),
                    // Container(
                    //   height: (services.length / 2 + 0.5) *
                    //       MediaQuery.of(context).size.width /
                    //       6,
                    //   child: GridView.count(
                    //       physics: BouncingScrollPhysics(),
                    //       crossAxisCount: 2,
                    //       childAspectRatio: 3,
                    //       padding: const EdgeInsets.all(4.0),
                    //       mainAxisSpacing: 4.0,
                    //       crossAxisSpacing: 4.0,
                    //       children: services.map((service) {
                    //         return GridTile(
                    //           child: Container(
                    //             child: Row(
                    //               children: [
                    //                 Checkbox(
                    //                     value: service.selected,
                    //                     // checkColor: Color.fromARGB(255, 43, 54, 62),
                    //                     activeColor:
                    //                         Color.fromARGB(255, 43, 54, 62),
                    //                     onChanged: (v) {
                    //                       setState(() {
                    //                         service.selected = v;
                    //                       });
                    //                     }),
                    //                 Text(
                    //                   service.name,
                    //                   style: TextStyle(
                    //                       color:
                    //                           Color.fromARGB(255, 43, 54, 62),
                    //                       fontSize: 14,
                    //                       fontWeight: FontWeight.bold),
                    //                 ),
                    //               ],
                    //             ),
                    //           ),
                    //         );
                    //       }).toList()),
                    // ),
                    SizedBox(
                      height: 20,
                    ),
                    // RaisedButton(
                    //     child: Text(
                    //       'More Details',
                    //       style: TextStyle(
                    //         color: Colors.white,
                    //       ),
                    //     ),
                    //     color: Color.fromARGB(255, 43, 54, 62),
                    //     onPressed: () {
                    //       // var name = doctor["name"];
                    //       Navigator.of(context).push(
                    //         MaterialPageRoute(
                    //             builder: (context) => Services(
                    //                 // text: doctor,
                    //                 )),
                    //       );
                    //     }),
                  ],
                ),
              ),
              SizedBox(
                height: 20,
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget reservationWidget({AvailabeDaye avDay}) {
    return Container(
      width: 75,
      height: 150,
      margin: EdgeInsets.symmetric(horizontal: 10),
      child: Column(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.only(
              topRight: Radius.circular(6),
              topLeft: Radius.circular(6),
            ),
            child: Container(
              width: 75,
              alignment: Alignment.center,
              color: Colors.grey,
              child: Padding(
                padding: const EdgeInsets.all(5.0),
                child: Text(
                  avDay.day ?? "",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                  ),
                ),
              ),
            ),
          ),
          Expanded(
            child: Container(
              width: 75,
              alignment: Alignment.center,
              color: Colors.white,
              child: ListView.builder(
                itemCount: avDay.times.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.only(top: 15.0),
                    child: InkWell(
                      onTap: () {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => isLogIn
                                ? Services(
                                    doctorID: widget.doctor.id,
                                    date:
                                        "${avDay.day} ${avDay.times[index].from} ${avDay.times[index].to}",
                                    services: widget.doctor.services,
                                  )
                                : Login()));
                      },
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            avDay.times[index].from,
                            style: TextStyle(
                                color: Color.fromARGB(255, 43, 54, 62),
                                fontSize: 14,
                                fontWeight: FontWeight.bold),
                          ),
                          Text(
                            avDay.times[index].to,
                            style: TextStyle(
                                color: Color.fromARGB(255, 43, 54, 62),
                                fontSize: 14,
                                fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
          ),
          ClipRRect(
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(6),
              bottomRight: Radius.circular(6),
            ),
            child: InkWell(
              onTap: () {},
              child: Container(
                width: 75,
                alignment: Alignment.center,
                color: Color.fromARGB(255, 43, 54, 62),
                child: Padding(
                  padding: const EdgeInsets.all(5.0),
                  child: Text(
                    "Reserve",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 14,
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
