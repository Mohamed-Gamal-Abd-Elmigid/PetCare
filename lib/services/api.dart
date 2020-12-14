import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:myapp/Model/doctor.dart';
import 'package:myapp/Model/services.dart';
// import 'package:myapp/Model/services.dart';
import 'package:myapp/Model/user.dart';
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
    // print(futurePost.body);
    // print(futurePost.body)
    var title = json.decode(futurePost.body)["data"]["name"];
    var token = json.decode(futurePost.body)["token"];
    //sucess
    // print(title);
    // print(token);
    // print(futurePost.body);
    return token;
  } else {
    print(futurePost.body);
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
    // Doctors doctors = Doctors.fromJson(jsonData);
    // List<Doctor> doctorsList =
    //     doctors.doctors.map((e) => Doctor.fromJson(e)).toList();

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
      // print(service.data.length);
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

Future<bool> reserve(
    String doctorID, List<String> services, String date, String token) async {
  Map<String, String> header = {
    // "Content-Type": "application/json",
    "Accept": "application/json",
    "Authorization": token,
  };
  Map<String, String> body = {
    "doctorId": doctorID,
    "services": "$services",
    "date": date
  };
  print(token);
  http.Response futurePost = await http.put('$baseUrl' + 'api/reservations',
      headers: header, body: body);

  print(futurePost.body);

  if (futurePost.statusCode == 200) {
    return true;
  } else {
    return false;
    // throw Exception('can not load post data');
  }
}
