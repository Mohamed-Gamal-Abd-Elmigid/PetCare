import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:myapp/Model/doctor.dart';
import 'package:myapp/Model/reserve.dart';
import 'package:myapp/Model/services.dart';
// import 'package:myapp/Model/services.dart';
import 'package:myapp/Model/user.dart';
import 'package:myapp/Model/userModel.dart';
import 'package:shared_preferences/shared_preferences.dart';

String baseUrl = "https://pet-care-iti.herokuapp.com/";

Future<String> Login(String email, String password) async {
  Map<String, String> header = {
    // "Content-Type": "application/json",
    "Accept": "application/json",
    // "Authorization": token,
  };
  Map<String, String> body = {
    "email": email,
    "password": password,
    // "Authorization": token,
  };
  http.Response futurePost = await http.post('$baseUrl' + 'api/users/login',
      headers: header, body: body);

  if (futurePost.statusCode == 200) {
    var title = json.decode(futurePost.body)["data"]["name"];

    return title;
  } else {
    print(futurePost.body);
    print(futurePost.statusCode);
    return null;
    // throw Exception('can not load post data');
  }
}

Future<String> email(String email, String password) async {
  Map<String, String> header = {
    "Accept": "application/json",
  };
  Map<String, String> body = {
    "email": email,
    "password": password,
  };
  http.Response futurePost = await http.post('$baseUrl' + 'api/users/login',
      headers: header, body: body);

  if (futurePost.statusCode == 200) {
    var title = json.decode(futurePost.body)["data"]["email"];
    return title;
  } else {
    print(futurePost.statusCode);
    return null;
    // throw Exception('can not load post data');
  }
}

Future<String> token(String email, String password) async {
  Map<String, String> header = {
    "Accept": "application/json",
  };
  Map<String, String> body = {
    "email": email,
    "password": password,
  };
  http.Response futurePost = await http.post('$baseUrl' + 'api/users/login',
      headers: header, body: body);

  if (futurePost.statusCode == 200) {
    var title = json.decode(futurePost.body)["token"];
    return title;
  } else {
    print(futurePost.statusCode);
    return null;
    // throw Exception('can not load post data');
  }
}

/////////////////////////////
////////////////////////////
// Method Register
///////////////
//////////
Future<bool> register(User myUser) async {
  Map<String, String> header = {
    // "Content-Type": "application/json",
    "Accept": "application/json",
    // "Authorization": token,
  };

  print(jsonEncode(myUser.toJson()));
  http.Response futurePost =
      await http.post('$baseUrl' + 'api/users/signup', body: myUser.toJson());

  // jsonEncode(myUser.toJson())

  if (futurePost.statusCode == 200) {
    print(futurePost.body);
    //sucess

    var token = jsonDecode(futurePost.body)["token"];

    SharedPreferences preferences = await SharedPreferences.getInstance();

    var title = await Login(myUser.email, myUser.password);

    var email = await Login(myUser.email, myUser.password);

    preferences.setString("username", title);
    preferences.setString("email", email);
    preferences.setString("token", token);

    return true; // Sucess
  } else {
    print(futurePost.body);
    return false; // Email IS Already Exist
    // throw Exception('can not load post data');
  }
}

////////////////////////////////////////////////////////////
////////////////////////GetDoctora/////////////////////
////////////////////////////////////////////////////////////
// /<Doctor>
Future<List<Doctor>> fetchDoctors() async {
  http.Response response = await http.get('$baseUrl' + 'api/doctors');

  if (response.statusCode == 200) {
    String data = response.body;
    var jsonData = jsonDecode(data);
    List<Doctor> result = [];
    jsonData["data"].forEach((d) => {result.add(Doctor.fromJson(d))});
    return result;

    // return jsonData["data"];
  } else {
    print('status code =  ${response.statusCode}');
  }
}

////////////////////////////////////////////////////////////
////////////////////////SearchDoctors/////////////////////
////////////////////////////////////////////////////////////

Future<List<Doctor>> searchDoctors(String name) async {
  try {
    http.Response response =
        await http.get('$baseUrl' + 'api/doctors?name=' + name);

    print(response.body);

    if (response.statusCode == 200) {
      String data = response.body;
      var jsonData = jsonDecode(data);
      List<Doctor> result = [];
      jsonData["data"].forEach((d) => {result.add(Doctor.fromJson(d))});
      return result;
    } else {
      print('status code =  ${response.statusCode}');
    }
  } catch (ex) {
    print(ex);
  }
}

////////////////////////////////////////////////////////////
////////////////////////FetchServices/////////////////////
////////////////////////////////////////////////////////////

Future<List<Service>> fetchServices() async {
  try {
    http.Response response = await http.get('$baseUrl' + 'api/services');

    if (response.statusCode == 200) {
      // print(response.body);

      String serData = response.body;
      var serJsonData = jsonDecode(serData);
      Services service = Services.fromMap(serJsonData);
      return service.data;
    } else {
      print('status code =  ${response.statusCode}');
    }
  } catch (ex) {
    print(ex);
  }
}

////////////////////////////////////////////////////////////
////////////////////////Reservation/////////////////////
////////////////////////////////////////////////////////////

Future<String> reserve(
    String doctorID, List<String> services, String date, String token) async {
  Map<String, String> header = {
    "Content-Type": "application/json",
    "Accept": "application/json",
    "Authorization": token,
  };

  Map<String, dynamic> body = {
    "doctorId": doctorID,
    "services": services,
    "date": date,
  };
  // print(token);
  http.Response futurePost = await http.put('$baseUrl' + 'api/reservations',
      headers: header, body: jsonEncode(body));
  // print(futurePost.body);

  if (futurePost.statusCode == 200) {
    var id = jsonDecode(futurePost.body)["data"]["_id"];

    print('THIS IS ID RESERVATION {$id}');

    return id;
  } else {
    return "NOT GET ID RESEVATION";
    // throw Exception('can not load post data');
  }
}

////////////////////////////////////////////////////////////
////////////////////////GET RESERVATION/////////////////////
////////////////////////////////////////////////////////////

Future<List<Reserve>> getReservations(String token) async {
  Map<String, String> header = {
    "Content-Type": "application/json",
    "Authorization": token,
  };
  http.Response futurePost =
      await http.get('$baseUrl' + 'api/reservations', headers: header);

  if (futurePost.statusCode == 200) {
    String data = futurePost.body;
    var jsonData = jsonDecode(data);
    List<Reserve> result = [];
    jsonData["data"].forEach((d) => {result.add(Reserve.fromJson(d))});
    return result;
  } else {
    print('status code =  ${futurePost.statusCode}');
  }
}

////////////////////////////////////////////////////////////
////////////////////////Profile Reservation///////////////////
////////////////////////////////////////////////////////////

Future<UserModel> getUserData() async {
  String token;

  SharedPreferences preferences = await SharedPreferences.getInstance();

  token = preferences.getString("token");

  Map<String, String> header = {
    // "Content-Type": "application/json",
    "Accept": "application/json",
    "Authorization": token,
  };

  http.Response futurePost =
      await http.get('$baseUrl' + 'api/users/', headers: header);

  if (futurePost.statusCode == 200) {
    var decoded = jsonDecode(futurePost.body);

    return UserModel.fromJson(decoded["data"]);
  } else {
    print(futurePost.statusCode);
    return null;
  }
}

////////////////////////////////////////////////////////////
////////////////////////DELETE RESERVATION//////////////////
////////////////////////////////////////////////////////////

Future<bool> deleteReservation(String id) async {
  String token;

  SharedPreferences preferences = await SharedPreferences.getInstance();

  token = preferences.getString("token");

  Map<String, String> header = {
    "Content-Type": "application/json",
    "Authorization": token,
  };
  http.Response futurePost =
      await http.delete('$baseUrl' + 'api/reservations/$id', headers: header);

  print(futurePost.body);
  print(futurePost.statusCode);

  var message = json.decode(futurePost.body)["status"];

  if (message) {
    return true;
  } else {
    return false;
  }
}

////////////////////////////////////////////////////////////
////////////////////////Update Rate//////////////////
////////////////////////////////////////////////////////////

Future<String> updateRate(String reservationID, double rate) async {
  String token;
  SharedPreferences preferences = await SharedPreferences.getInstance();
  token = preferences.getString("token");

  Map<String, String> header = {
    //"Content-Type": "application/json",
    "Authorization": token,
  };

  Map<String, String> body = {
    "reservationId": reservationID,
    "rate": "$rate",
  };
  http.Response futurePost = await http.patch('$baseUrl' + 'api/reservations',
      headers: header, body: body);

  print(futurePost.body);
  // print(futurePost.statusCode);

  var messageBack = jsonDecode(futurePost.body)["message"];
  if (futurePost.statusCode == 200) {
    print('D5lna GWA EL IF CONDESHION LOLOLOLOLOLY');
    print(messageBack);
    return messageBack;
  } else {
    print('ERROR From ESLE HERE Y 3AAAM');
    return 'Error';
  }
}

////////////////////////////////////////////////////////////
////////////////////////DELETE RESERVATION//////////////////
////////////////////////////////////////////////////////////
//
Future<bool> updateProfile(
    dynamic phone, String name, String email, String address) async {
  String token;
  SharedPreferences preferences = await SharedPreferences.getInstance();
  token = preferences.getString("token");

  Map<String, String> header = {
    // "Content-Type": "application/json",
    "Authorization": token,
  };
  Map<String, String> body = {
    "phone": phone,
    "name": name,
    "email": email,
    "address": address,
  };
  http.Response futurePost =
      await http.patch('$baseUrl' + 'api/users', headers: header, body: body);

  if (futurePost.statusCode == 200) {
    var message = json.decode(futurePost.body)["message"];
    print(message);
    return true;
  } else {
    return false;
  }
}
