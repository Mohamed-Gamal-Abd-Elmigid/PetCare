import 'package:flutter/foundation.dart';

// class Doctor {
//   Doctor({
//     this.image,
//     this.availabeDayes,
//     this.rate,
//     this.phone,
//     this.lat,
//     this.lng,
//     this.services,
//     this.id,
//     this.name,
//     this.email,
//     this.address,
//   });
//
//   dynamic image;
//   List<AvailabeDaye> availabeDayes;
//   dynamic rate;
//   int phone;
//   String lat;
//   String lng;
//   List<int> services;
//   String id;
//   String name;
//   String email;
//   String address;
//
//   factory Doctor.fromJson(Map<String, dynamic> json) => Doctor(
//         image: json["image"],
//         availabeDayes: List<AvailabeDaye>.from(
//             json["availabe_dayes"].map((x) => AvailabeDaye.fromJson(x))),
//         rate: json["rate"],
//         phone: json["phone"],
//         lat: json["lat"],
//         lng: json["lng"],
//         services: List<int>.from(json["services"].map((x) => x)),
//         id: json["_id"],
//         name: json["name"],
//         email: json["email"],
//         address: json["address"],
//       );
//
//   Map<String, dynamic> toJson() => {
//         "image": image,
//         "availabe_dayes":
//             List<dynamic>.from(availabeDayes.map((x) => x.toJson())),
//         "rate": rate,
//         "phone": phone,
//         "lat": lat,
//         "lng": lng,
//         "services": List<dynamic>.from(services.map((x) => x)),
//         "_id": id,
//         "name": name,
//         "email": email,
//         "address": address,
//       };
// }
//
// class AvailabeDaye {
//   AvailabeDaye({
//     this.day,
//     this.times,
//   });
//
//   String day;
//   List<Time> times;
//
//   factory AvailabeDaye.fromJson(Map<String, dynamic> json) => AvailabeDaye(
//         day: json["day"],
//         times: List<Time>.from(json["times"].map((x) => Time.fromJson(x))),
//       );
//
//   Map<String, dynamic> toJson() => {
//         "day": day,
//         "times": List<dynamic>.from(times.map((x) => x.toJson())),
//       };
// }
//
// class Time {
//   Time({
//     this.from,
//     this.to,
//   });
//
//   String from;
//   String to;
//
//   factory Time.fromJson(Map<String, dynamic> json) => Time(
//         from: json["from"],
//         to: json["to"],
//       );
//
//   Map<String, dynamic> toJson() => {
//         "from": from,
//         "to": to,
//       };
// }

// class Doctor {
//   final String name;
//   final String email;
//   final String address;
//   final int phone;
//
//   Doctor({this.name, this.email, this.address, this.phone});
//
//   factory Doctor.fromJson(Map<String, dynamic> jsonData) {
//     return Doctor(
//       name: jsonData['name'],
//       email: jsonData['email'],
//       address: jsonData['address'],
//       phone: jsonData['phone'],
//     );
//   }
// }

// class Doctors {
//   final List<dynamic> doctors;
//
//   Doctors({this.doctors});
//
//   factory Doctors.fromJson(Map<String, dynamic> jsonData) {
//     return Doctors(
//       doctors: jsonData['data'],
//     );
//   }
// }

// To parse this JSON data, do
//
//     final doctor = doctorFromJson(jsonString);

// To parse this JSON data, do
//
//     final doctor = doctorFromJson(jsonString);

import 'dart:convert';

Doctor doctorFromJson(String str) => Doctor.fromJson(json.decode(str));

String doctorToJson(Doctor data) => json.encode(data.toJson());

class Doctor {
  Doctor({
    this.image,
    this.availabeDayes,
    this.rate,
    this.phone,
    this.lat,
    this.lng,
    this.services,
    this.id,
    this.name,
    this.email,
    this.address,
  });

  dynamic image;
  List<AvailabeDaye> availabeDayes;
  dynamic rate;
  int phone;
  String lat;
  String lng;
  List<DoctorService> services;
  String id;
  String name;
  String email;
  String address;

  factory Doctor.fromJson(Map<String, dynamic> json) => Doctor(
        image: json["image"],
        availabeDayes: json["availabe_dayes"] == null
            ? null
            : List<AvailabeDaye>.from(
                json["availabe_dayes"].map((x) => AvailabeDaye.fromJson(x))),
        rate: json["rate"],
        phone: json["phone"] == null ? null : json["phone"],
        lat: json["lat"] == null ? null : json["lat"],
        lng: json["lng"] == null ? null : json["lng"],
        services: json["services"] == null
            ? null
            : List<DoctorService>.from(
                json["services"].map((x) => DoctorService.fromJson(x))),
        id: json["_id"] == null ? null : json["_id"],
        name: json["name"] == null ? null : json["name"],
        email: json["email"] == null ? null : json["email"],
        address: json["address"] == null ? null : json["address"],
      );

  Map<String, dynamic> toJson() => {
        "image": image,
        "availabe_dayes": availabeDayes == null
            ? null
            : List<dynamic>.from(availabeDayes.map((x) => x.toJson())),
        "rate": rate,
        "phone": phone == null ? null : phone,
        "lat": lat == null ? null : lat,
        "lng": lng == null ? null : lng,
        "services": services == null
            ? null
            : List<dynamic>.from(services.map((x) => x.toJson())),
        "_id": id == null ? null : id,
        "name": name == null ? null : name,
        "email": email == null ? null : email,
        "address": address == null ? null : address,
      };
}

class AvailabeDaye {
  AvailabeDaye({
    this.day,
    this.times,
  });

  String day;
  List<Time> times;

  factory AvailabeDaye.fromJson(Map<String, dynamic> json) => AvailabeDaye(
        day: json["day"] == null ? null : json["day"],
        times: json["times"] == null
            ? null
            : List<Time>.from(json["times"].map((x) => Time.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "day": day == null ? null : day,
        "times": times == null
            ? null
            : List<dynamic>.from(times.map((x) => x.toJson())),
      };
}

class Time {
  Time({
    this.from,
    this.to,
  });

  String from;
  String to;

  factory Time.fromJson(Map<String, dynamic> json) => Time(
        from: json["from"] == null ? null : json["from"],
        to: json["to"] == null ? null : json["to"],
      );

  Map<String, dynamic> toJson() => {
        "from": from == null ? null : from,
        "to": to == null ? null : to,
      };
}

class DoctorService {
  DoctorService({
    this.image,
    this.id,
    this.title,
    this.v,
  });

  String image;
  String id;
  String title;
  int v;

  factory DoctorService.fromJson(Map<String, dynamic> json) => DoctorService(
        image: json["image"] == null ? null : json["image"],
        id: json["_id"] == null ? null : json["_id"],
        title: json["title"] == null ? null : json["title"],
        v: json["__v"] == null ? null : json["__v"],
      );

  Map<String, dynamic> toJson() => {
        "image": image == null ? null : image,
        "_id": id == null ? null : id,
        "title": title == null ? null : title,
        "__v": v == null ? null : v,
      };
}
