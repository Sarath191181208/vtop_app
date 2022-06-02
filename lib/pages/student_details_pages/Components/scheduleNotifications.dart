import 'dart:collection';
import '../../../Student/student_object.dart';

import 'package:flutter/material.dart';

import '../../../notification_service.dart';

import 'package:timezone/timezone.dart' as tz;

_getDate(String day, String classTime) {
  const Map<String, int> dayCodeDict = {
    "Monday": 1,
    "Tuesday": 2,
    "Wednesday": 3,
    "Thursday": 4,
    "Friday": 5,
    "Saturday": 6,
    "Sunday": 7
  };

  return DateTime.parse(
      "2018-01-0" + dayCodeDict[day].toString() + " " + classTime + ":00");
}

scheduleNotifs(HashMap<String, List<TimeSlot>>? timetable) async {
  await NotificationService().showNotification();
  int i = 0;
  timetable!.forEach((weekDay, value) {
    for (var timeSlot in value) {
      var startDate = _getDate(weekDay, timeSlot.startTime);
      var endDay = _getDate(weekDay, timeSlot.endTime);

      _scheduleNotifAtDate(i++, startDate, timeSlot, isStarting: true);
      _scheduleNotifAtDate(i++, endDay, timeSlot, isStarting: false);
    }
  });
  return;
}

_scheduleNotifAtDate(int id, DateTime day, TimeSlot timeSlot,
    {required bool isStarting}) async {
  print(id);
  var clsNotifTime = tz.TZDateTime.from(day, tz.local);
  var preNotifTime = clsNotifTime.subtract(const Duration(minutes: 5));
  // var preNotifTime =
  //     tz.TZDateTime.now(tz.local).add(const Duration(seconds: 10));

  var title = isStarting
      ? "Class starting at" + timeSlot.startTime
      : "Class ending at" + timeSlot.endTime;
  var body =
      "Your ${timeSlot.courseName} in ClassRoom: ${timeSlot.classRoom} of slot:${timeSlot.slot} is gonna ";
  body += isStarting ? "start" : "end";
  body += " in 5 minutes";
  await NotificationService()
      .scheduleNotification(id, preNotifTime, title, body);
}
