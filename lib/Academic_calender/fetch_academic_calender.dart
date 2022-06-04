import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:vtop_app/Academic_calender/academic_calender_obj.dart';

import '../apis/storage/pref_academic_calender.dart';

Future<AcademicCalender?> fetchAcademicCalenders() async {
  //TODO: return null if the response took too long

  var response = await http.post(
      Uri.parse("https://vtop-api.herokuapp.com/api/v1/academic_calenders"),
      headers: {});

  if (response.statusCode == 200) {
    var jsonResponse = json.decode(response.body);
    AcademicCalender acad = AcademicCalender.fromJson(jsonResponse);
    PrefAcademicCalender.saveAcademicCalenderJSON(jsonResponse);
    return acad;
  } else {
    return null;
  }
}
