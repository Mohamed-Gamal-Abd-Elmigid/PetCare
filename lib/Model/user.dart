import 'package:flutter/material.dart';

class User {
  String name;
  String email;
  String password;
  String address;

  User(
      {@required this.name,
      @required this.email,
      @required this.password,
      @required this.address});

  Map<String, String> toJson() {
    return {
      "name": name,
      "email": email,
      "password": password,
      "address": address,
    };
  }
}
