import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class Service {
  final String name;
  bool selected;
  Service(this.name, {this.selected = false});
}

class DetailsScreen extends StatefulWidget {
  @override
  _DetailsScreenState createState() => _DetailsScreenState();
}

class _DetailsScreenState extends State<DetailsScreen> {
  List<Service> services = [
    Service("Emergency Visit"),
    Service("Health Care"),
    Service("Insect Control"),
    Service("Dog Walking"),
    Service("Pet Training"),
    Service("House Sitting"),
    Service("Grooming")
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 77,
        backgroundColor: Color.fromARGB(255, 43, 54, 62),
        title:
            // Text(
            //   "Pet Care",
            //   style: TextStyle(
            //     fontFamily: 'koko',
            //     fontSize: 25,
            //     color: Colors.white,
            //     fontWeight: FontWeight.bold,
            //   ),
            // ),
            Image(
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
                    Container(
                      padding:
                          const EdgeInsets.only(right: 10, top: 10, bottom: 15),
                      alignment: Alignment.centerRight,
                      child: Text("Seen 231", style: TextStyle(fontSize: 16)),
                    ),
                    Container(
                      alignment: Alignment.center,
                      child: Text("Cynthia Valentin, PhD, APNP",
                          style: TextStyle(
                              fontSize: 22, fontWeight: FontWeight.bold)),
                    ),
                    Container(
                      alignment: Alignment.center,
                      margin: EdgeInsets.all(15),
                      child: Text(
                        "As clinic director, I hold responsibility for maintaining and environment that promotes collaborative and supportive practices",
                        style: TextStyle(fontSize: 16, color: Colors.grey),
                        textAlign: TextAlign.left,
                      ),
                    ),
                    Container(
                      alignment: Alignment.center,
                      margin: EdgeInsets.all(15),
                      padding: EdgeInsets.only(left: 10),
                      child: Text(
                        "I currently serve as the Valentin Clinic Office Manager and first point of contact for you here at the Valentin Clinic",
                        style: TextStyle(fontSize: 16),
                        textAlign: TextAlign.left,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    Container(
                      alignment: Alignment.center,
                      width: 250,
                      child: RatingBar.builder(
                        initialRating: 4.5,
                        minRating: 1,
                        direction: Axis.horizontal,
                        allowHalfRating: true,
                        itemCount: 5,
                        itemPadding: EdgeInsets.symmetric(horizontal: 4.0),
                        itemBuilder: (context, _) => Icon(
                          Icons.star,
                          color: Color.fromARGB(255, 43, 54, 62),
                        ),
                        itemSize: 35,
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
                margin: EdgeInsets.all(10),
                child: Column(
                  children: [
                    Container(
                      alignment: Alignment.center,
                      margin: EdgeInsets.only(top: 15),
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
                            height: 100,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Icon(
                                  Icons.timelapse,
                                  color: Color.fromARGB(255, 43, 54, 62),
                                  size: 35,
                                ),
                                Text(
                                  "Standby time: 1 hour",
                                  style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w600),
                                )
                              ],
                            ),
                          ),
                          Container(
                            height: 100,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Icon(
                                  Icons.money_sharp,
                                  color: Color.fromARGB(255, 43, 54, 62),
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
                    Container(
                      child: Row(
                        // mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: Icon(
                              Icons.location_on,
                              color: Colors.black45,
                              size: 30,
                            ),
                          ),
                          Text(
                            "Nasr City: Abu Dawood Dhaheri",
                            style: TextStyle(fontSize: 16),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.symmetric(horizontal: 12),
                      child: Text(
                        "Book now and full address details and clinic number will be send you confirmation Request For Reserve",
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.bold),
                        textAlign: TextAlign.start,
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
                            fontSize: 18, fontWeight: FontWeight.bold),
                        textAlign: TextAlign.right,
                      ),
                    ),
                    Container(
                      height: 175,
                      color: Colors.grey.shade100,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          reservationWidget(day: "Satarday"),
                          reservationWidget(day: "Sunday"),
                          reservationWidget(day: "Monday"),
                        ],
                      ),
                    ),
                    Divider(
                      thickness: 1.5,
                      color: Colors.black38,
                      height: 0,
                    ),
                    Container(
                      padding: EdgeInsets.only(bottom: 10),
                      alignment: Alignment.center,
                      margin: EdgeInsets.only(top: 15),
                      child: Text(
                        "Choose the required services",
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold),
                        textAlign: TextAlign.right,
                      ),
                    ),
                    Container(
                      height: (services.length / 2 + 0.5) *
                          MediaQuery.of(context).size.width /
                          6,
                      child: GridView.count(
                          physics: BouncingScrollPhysics(),
                          crossAxisCount: 2,
                          childAspectRatio: 3,
                          padding: const EdgeInsets.all(4.0),
                          mainAxisSpacing: 4.0,
                          crossAxisSpacing: 4.0,
                          children: services.map((service) {
                            return GridTile(
                              child: Container(
                                child: Row(
                                  children: [
                                    Checkbox(
                                        value: service.selected,
                                        // checkColor: Color.fromARGB(255, 43, 54, 62),
                                        activeColor:
                                            Color.fromARGB(255, 43, 54, 62),
                                        onChanged: (v) {
                                          setState(() {
                                            service.selected = v;
                                          });
                                        }),
                                    Text(
                                      service.name,
                                      style: TextStyle(
                                          color:
                                              Color.fromARGB(255, 43, 54, 62),
                                          fontSize: 14,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ],
                                ),
                              ),
                            );
                          }).toList()),
                    ),
                    SizedBox(
                      height: 20,
                    )
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

  Widget reservationWidget(
      {String day,
      String fromDate = "F 7:00 PM",
      String toDate = "T 9:00 PM"}) {
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
                  day,
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
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    fromDate,
                    style: TextStyle(
                        color: Color.fromARGB(255, 43, 54, 62),
                        fontSize: 14,
                        fontWeight: FontWeight.bold),
                  ),
                  Text(
                    toDate,
                    style: TextStyle(
                        color: Color.fromARGB(255, 43, 54, 62),
                        fontSize: 14,
                        fontWeight: FontWeight.bold),
                  ),
                ],
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
