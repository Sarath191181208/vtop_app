// function to get the Student details
import 'dart:convert';
import 'package:http/http.dart' as http;

import 'pref_student.dart';
import 'student_object.dart';

Future<Student?> getStudent(String username, String password) async {
  //return null if the response took too long

  var response = await http.post(
      Uri.parse("https://vtop-api.herokuapp.com/api/v1/alldetails"),
      headers: {},
      body: {'username': username, 'password': password});

  if (response.statusCode == 200) {
    var jsonResponse = json.decode(response.body);
    Student stu = Student.fromJson(jsonResponse);

    PrefStudent.saveStudentJSON(jsonResponse);
    return stu;
  } else {
    return null;
  }
}
