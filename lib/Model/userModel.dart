// To parse this JSON data, do
//
//     final userModel = userModelFromJson(jsonString);

import 'dart:convert';

UserModel userModelFromJson(String str) => UserModel.fromJson(json.decode(str));

String userModelToJson(UserModel data) => json.encode(data.toJson());

class UserModel {
  UserModel({
    this.image,
    this.phone,
    this.lat,
    this.lng,
    this.id,
    this.name,
    this.email,
    this.address,
  });

  dynamic image;
  dynamic phone;
  dynamic lat;
  dynamic lng;
  String id;
  String name;
  String email;
  String address;

  factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
        image: json["image"],
        phone: json["phone"],
        lat: json["lat"],
        lng: json["lng"],
        id: json["_id"] == null ? null : json["_id"],
        name: json["name"] == null ? null : json["name"],
        email: json["email"] == null ? null : json["email"],
        address: json["address"] == null ? null : json["address"],
      );

  Map<String, dynamic> toJson() => {
        "image": image,
        "phone": phone,
        "lat": lat,
        "lng": lng,
        "_id": id == null ? null : id,
        "name": name == null ? null : name,
        "email": email == null ? null : email,
        "address": address == null ? null : address,
      };
}
