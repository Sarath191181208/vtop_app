import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:vtop_app/apis/storage/pref_faculty.dart';

import 'faculty_object.dart';

Future<Faculty?> fetchFacultyDetails() async {
  //TODO: return null if the response took too long

  var response = await http.post(
      Uri.parse("https://vtop-api.herokuapp.com/api/v1/faculty"),
      headers: {});

  if (response.statusCode == 200) {
    var jsonResponse = json.decode(response.body);
    Faculty fac = Faculty.fromJson(jsonResponse);
    PrefFaculty.saveFacultyJSON(jsonResponse);
    return fac;
  } else {
    return null;
  }
}
