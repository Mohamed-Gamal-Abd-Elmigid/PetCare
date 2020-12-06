import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:myapp/Model/doctor.dart';
import 'package:myapp/Model/user.dart';

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
  // print(json.decode(futurePost.body)["data"]["name"]);

  //print(title);

  // print(futurePost.body);
  if (futurePost.statusCode == 200) {
    print(futurePost.body);
    var title = json.decode(futurePost.body)["data"]["name"];

    //sucess
    // print(title);
    return title;
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

// Future<List<Doctor>> fetchDoctors() async {
//   try {
//     http.Response response = await http.get('$baseUrl' + 'api/doctors');
//
//     if (response.statusCode == 200) {
//       String data = response.body;
//       var jsonData = jsonDecode(data);
//       Doctors doctors = Doctors.fromJson(jsonData);
//       List<Doctor> doctorsList =
//           doctors.doctors.map((e) => Doctor.fromJson(e)).toList();
//       return doctorsList;
//     } else {
//       print('status code =  ${response.statusCode}');
//     }
//   } catch (ex) {
//     print(ex);
//   }
// }

Future<List<Doctor>> fetchDoctors() async {
  try {
    http.Response response = await http.get('$baseUrl' + 'api/doctors');

    if (response.statusCode == 200) {
      String data = response.body;
      var jsonData = jsonDecode(data);
      Doctors doctors = Doctors.fromJson(jsonData);
      List<Doctor> doctorsList =
          doctors.doctors.map((e) => Doctor.fromJson(e)).toList();
      return doctorsList;
    } else {
      print('status code =  ${response.statusCode}');
    }
  } catch (ex) {
    print(ex);
  }
}
