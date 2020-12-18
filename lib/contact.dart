import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:myapp/pallete.dart';

class Contact extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 43, 54, 62),
        centerTitle: true,
        title: Text(
          'Contact Us',
          style: TextStyle(
            fontSize: 20,
            color: Colors.white,
          ),
        ),
      ),
      body: Column(
        children: [
          Padding(
            // padding: const EdgeInsets.only(right: 20.0),
            // padding: const EdgeInsets.all(1.0),
            padding: const EdgeInsets.fromLTRB(0.0, 10.0, 130.0, 0.0),
            child: Text(
              'Happy To Recive Your Comment',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: Colors.grey,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(20.0, 5.0, 20.0, 10.0),
            child: Container(
              color: Colors.grey.shade300,
              child: TextField(
                cursorColor: Colors.white,
                style: TextStyle(
                  fontSize: 16,
                ),
                decoration: InputDecoration(
                  prefixIcon: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20.0),
                    child: Icon(
                      FontAwesomeIcons.envelope,
                      size: 28,
                      color: Color.fromARGB(255, 43, 54, 62),
                    ),
                  ),
                  hintText: "Enter Your Mail",
                  contentPadding: EdgeInsets.all(20.0),
                ),
                scrollPadding: EdgeInsets.all(20.0),
                keyboardType: TextInputType.multiline,
                maxLines: 1,
                autofocus: true,
              ),
            ),
          ),
          Padding(
            // padding: const EdgeInsets.only(right: 20.0),
            // padding: const EdgeInsets.all(1.0),
            padding: const EdgeInsets.fromLTRB(0.0, 10.0, 270.0, 0.0),
            child: Text(
              'Your Message',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: Colors.grey,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(20.0, 5.0, 20.0, 10.0),
            child: Container(
              color: Colors.grey.shade300,
              child: TextField(
                cursorColor: Colors.white,
                style: TextStyle(
                  fontSize: 16,
                ),
                decoration: InputDecoration(
                  hintText: "Insert your message",
                  contentPadding: EdgeInsets.all(20.0),
                ),
                scrollPadding: EdgeInsets.all(20.0),
                keyboardType: TextInputType.multiline,
                maxLines: 10,
                autofocus: true,
              ),
            ),
          ),
          Container(
            child: Padding(
              padding: const EdgeInsets.fromLTRB(0.0, 5.0, 200.0, 0.0),
              child: Text(
                'For More Detial : 15428',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Colors.grey,
                ),
              ),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: SizedBox(
              width: 250.0,
              child: RaisedButton(
                child: Text(
                  'Send',
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                  ),
                ),
                color: Color.fromARGB(255, 43, 54, 62),
                onPressed: () {},
              ),
            ),
          ),
        ],
      ),
    );
  }
}
