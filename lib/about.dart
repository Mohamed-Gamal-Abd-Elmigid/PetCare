import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class About extends StatelessWidget {
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
        appBar: AppBar(
          // backgroundColor: Color.fromARGB(255, 43, 54, 62),
          backgroundColor: Colors.transparent,
          centerTitle: true,
          title: Text(
            'About Us',
            style: TextStyle(
              fontSize: 20,
              color: Colors.white,
            ),
          ),
        ),
        body: Padding(
          padding: EdgeInsets.all(10),
          child: ListView(
            children: <Widget>[
              Container(
                // padding: const EdgeInsets.all(10.0),
                child: Image.asset("assets/images/logo.png"),
                width: 100,
                height: 70,
              ),
              Container(
                padding: const EdgeInsets.all(10.0),
                child: Text(
                  'I wanna be your vacuum cleaner Breathing  your dust I wanna be your Ford Cortina I will never rust',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                  ),
                ),
              ),
              Container(
                padding: const EdgeInsets.all(10.0),
                child: Text(
                  'If you like your coffee hot Let me be your coffee pot You call the shots, babe I just wanna be yours Secrets I have held in my heart Are harder to hide than I thought Maybe I just wanna be yours I wanna be yours',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                  ),
                ),
              ),
              Container(
                padding: const EdgeInsets.all(10.0),
                child: Text(
                  'I wanna be your vacuum cleaner Breathing  your dust I wanna be your Ford Cortina I will never rust',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                  ),
                ),
              ),
              Container(
                child: Text(
                  'App Version : 1',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 29,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
