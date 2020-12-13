// To parse this JSON data, do
//
//     final services = servicesFromMap(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

Services servicesFromMap(String str) => Services.fromMap(json.decode(str));

String servicesToMap(Services data) => json.encode(data.toMap());

class Services {
    Services({
        @required this.status,
        @required this.data,
    });

    final bool status;
    final List<Service> data;

    factory Services.fromMap(Map<String, dynamic> json) => Services(
        status: json["status"],
        data: List<Service>.from(json["data"].map((x) => Service.fromMap(x))),
    );

    Map<String, dynamic> toMap() => {
        "status": status,
        "data": List<dynamic>.from(data.map((x) => x.toMap())),
    };
}

class Service {
    Service({
        @required this.image,
        @required this.id,
        @required this.title,
    });

    final String image;
    final String id;
    final String title;

    factory Service.fromMap(Map<String, dynamic> json) => Service(
        image: json["image"],
        id: json["_id"],
        title: json["title"],
    );

    Map<String, dynamic> toMap() => {
        "image": image,
        "_id": id,
        "title": title,
    };
}