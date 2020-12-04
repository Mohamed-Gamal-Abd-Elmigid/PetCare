import 'package:flutter/foundation.dart';

class Doctor {
  final String name;
  final String email;
  final String address;
  final int phone;

  Doctor({this.name, this.email, this.address, this.phone});

  factory Doctor.fromJson(Map<String, dynamic> jsonData) {
    return Doctor(
      name: jsonData['name'],
      email: jsonData['email'],
      address: jsonData['address'],
      phone: jsonData['phone'],
    );
  }
}

class Doctors {
  final List<dynamic> doctors;

  Doctors({this.doctors});

  factory Doctors.fromJson(Map<String, dynamic> jsonData) {
    return Doctors(
      doctors: jsonData['data'],
    );
  }
}
