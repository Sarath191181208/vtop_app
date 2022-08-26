// function to get the Student details
import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;

import '../apis/storage/pref_student.dart';
import 'student_object.dart';

Future<Student?> fetchStudentDetails(String? username, String? password) async {
  //return null if the response took too long

  if (username == null || password == null) {
    return null;
  }

  var response = await http.post(
      Uri.parse("https://vtop-api.herokuapp.com/api/v1/alldetails"),
      headers: {
        "Access-Control-Allow-Origin": "*",
        "Access-Control-Allow-Headers":
            "Origin,Content-Type,X-Amz-Date,Authorization,X-Api-Key,X-Amz-Security-Token,locale",
        "Access-Control-Allow-Methods": "POST, OPTIONS",
      },
      body: {
        'username': username,
        'password': password
      });

  if (response.statusCode == 200) {
    var jsonResponse = json.decode(response.body);
    Student stu = Student.fromJson(jsonResponse);
    debugPrint("here");
    PrefStudent.saveStudentJSON(jsonResponse);
    PrefStudent.saveLoginCredentials(username, password);
    return stu;
  } else {
    return null;
  }
}
