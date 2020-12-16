// To parse this JSON data, do
//
//     final reserve = reserveFromJson(jsonString);

import 'dart:convert';

Reserve reserveFromJson(String str) => Reserve.fromJson(json.decode(str));

String reserveToJson(Reserve data) => json.encode(data.toJson());

class Reserve {
  Reserve({
    this.user,
    this.doctor,
    this.status,
    this.services,
    this.rate,
    this.date,
    this.id,
    this.awt,
  });

  reserveUser user;
  ReserveDoctor doctor;
  int status;
  List<ReserveService> services;
  dynamic rate;
  String date;
  String id;
  dynamic awt;

  factory Reserve.fromJson(Map<String, dynamic> json) => Reserve(
        user: json["user"] == null ? null : reserveUser.fromJson(json["user"]),
        doctor: json["doctor"] == null
            ? null
            : ReserveDoctor.fromJson(json["doctor"]),
        status: json["status"] == null ? null : json["status"],
        services: json["services"] == null
            ? null
            : List<ReserveService>.from(
                json["services"].map((x) => ReserveService.fromJson(x))),
        rate: json["rate"],
        date: json["date"] == null ? null : json["date"],
        id: json["id"] == null ? null : json["id"],
        awt: json["AWT"],
      );

  Map<String, dynamic> toJson() => {
        "user": user == null ? null : user.toJson(),
        "doctor": doctor == null ? null : doctor.toJson(),
        "status": status == null ? null : status,
        "services": services == null
            ? null
            : List<dynamic>.from(services.map((x) => x.toJson())),
        "rate": rate,
        "date": date == null ? null : date,
        "id": id == null ? null : id,
        "AWT": awt,
      };
}

class ReserveDoctor {
  ReserveDoctor({
    this.image,
    this.availabeDayes,
    this.rate,
    this.phone,
    this.lat,
    this.lng,
    this.services,
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
  List<ReserveService> services;
  String name;
  String email;
  String address;

  factory ReserveDoctor.fromJson(Map<String, dynamic> json) => ReserveDoctor(
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
            : List<ReserveService>.from(
                json["services"].map((x) => ReserveService.fromJson(x))),
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

class ReserveService {
  ReserveService({
    this.image,
    this.id,
    this.title,
    this.v,
  });

  String image;
  String id;
  String title;
  int v;

  factory ReserveService.fromJson(Map<String, dynamic> json) => ReserveService(
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

class reserveUser {
  reserveUser({
    this.image,
    this.phone,
    this.lat,
    this.lng,
    this.name,
    this.email,
    this.address,
  });

  dynamic image;
  int phone;
  dynamic lat;
  dynamic lng;
  String name;
  String email;
  String address;

  factory reserveUser.fromJson(Map<String, dynamic> json) => reserveUser(
        image: json["image"],
        phone: json["phone"] == null ? null : json["phone"],
        lat: json["lat"],
        lng: json["lng"],
        name: json["name"] == null ? null : json["name"],
        email: json["email"] == null ? null : json["email"],
        address: json["address"] == null ? null : json["address"],
      );

  Map<String, dynamic> toJson() => {
        "image": image,
        "phone": phone == null ? null : phone,
        "lat": lat,
        "lng": lng,
        "name": name == null ? null : name,
        "email": email == null ? null : email,
        "address": address == null ? null : address,
      };
}
