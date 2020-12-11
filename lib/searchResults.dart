import 'package:flutter/material.dart';
import 'Model/doctor.dart';
import 'detailsScreen.dart';
import 'services/api.dart' as api;

class Search extends StatefulWidget {
  var text;
  Search({Key key, @required this.text, Key data}) : super(key: key);

  @override
  _SearchState createState() => _SearchState();
}

class _SearchState extends State<Search> {
  bool loading = false;

  List<Doctor> doctors;

  @override
  void initState() {
    super.initState();
    setState(() => loading = true);
    backData(widget.text);
  }

  void backData(String searchText) async {
    List<Doctor> data = await api.searchDoctors(searchText);
    setState(() {
      doctors = data;
      loading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 43, 54, 62),
        centerTitle: true,
        title: Text(
          'Results',
          style: TextStyle(
            fontSize: 20,
            color: Colors.white,
          ),
        ),
      ),
      body: Column(
        children: [
          TextField(
            onSubmitted: backData,
            style: TextStyle(
              fontSize: 24,
            ),
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
          ),
          Expanded(
            child: Container(
              // height: 680,
              child: doctors != null
                  ? ListView(
                      children: doctors.map<Widget>((doctor) {
                        return listViewCard(doctor);
                      }).toList(),
                    )
                  : Container(),
            ),
          ),
        ],
      ),
    );
  }

  Widget listViewCard(var doctor) {
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
                        fontSize: 25,
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
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => DetailsScreen()),
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
