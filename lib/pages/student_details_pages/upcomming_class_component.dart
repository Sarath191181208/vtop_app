import 'dart:collection';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

import '../../../Student/student_object.dart';
import '../Components/timetable_card.dart';

class UpcomingClassSliderComponent extends StatefulWidget {
  final HashMap<String, List<TimeSlot>>? timetable;
  const UpcomingClassSliderComponent({Key? key, required this.timetable})
      : super(key: key);

  @override
  State<UpcomingClassSliderComponent> createState() =>
      UpcomingClassSliderComponentState();
}

class UpcommingClass {
  String status; // i.e curent (or) next
  TimeSlot timeSlot;
  UpcommingClass({
    required this.status,
    required this.timeSlot,
  });
}

class UpcomingClassSliderComponentState
    extends State<UpcomingClassSliderComponent> {
  late List<UpcommingClass> upcommingClasses;

  @override
  void initState() {
    super.initState();
    upcommingClasses = getListOfUpcomingClasses(widget.timetable!);
  }

  getListOfUpcomingClasses(HashMap<String, List<TimeSlot>>? timetable) {
    if (timetable == null) return [];
    List<UpcommingClass> upcommingClasses = [];
    List<String> days = [
      'Monday',
      'Tuesday',
      'Wednesday',
      'Thursday',
      'Friday',
      'Saturday',
      'Sunday'
    ];

    int _strToSec(String time) {
      var timeSplit = time.split(":");
      var hour = int.parse(timeSplit[0]);
      var min = int.parse(timeSplit[1]);
      return hour * 60 + min;
    }

    String currDay = days[DateTime.now().weekday - 1];
    int currHour = DateTime.now().hour;
    int currMin = DateTime.now().minute;
    int currTime = _strToSec("$currHour:$currMin");

    var singleDaySchedule = timetable[currDay];
    if (singleDaySchedule == null) return upcommingClasses;

    for (var i = 0; i < singleDaySchedule.length; i++) {
      var timeSlot = singleDaySchedule[i];
      int startTime = _strToSec(timeSlot.startTime);
      int endTime = _strToSec(timeSlot.endTime);

      debugPrint(
          "currTime: $currTime, startTime: $startTime, endTime: $endTime");

      if (currTime >= startTime && currTime <= endTime) {
        upcommingClasses
            .add(UpcommingClass(status: 'Current', timeSlot: timeSlot));
      } else if (currTime <= endTime) {
        upcommingClasses
            .add(UpcommingClass(status: 'Next', timeSlot: timeSlot));
      }
    }
    debugPrint(upcommingClasses.toString());
    debugPrint(upcommingClasses.length.toString());
    return upcommingClasses;
  }

  isValidData() {
    debugPrint("upcomming classes lenght" + upcommingClasses.length.toString());
    return (widget.timetable == null || upcommingClasses.isEmpty);
  }

  @override
  Widget build(BuildContext context) {
    List<Widget> upcommingClassesCardList = upcommingClasses
        .map((classInfo) => TimeTableSlotCard(
            timeSlot: classInfo.timeSlot, status: classInfo.status))
        .toList();

    return (isValidData()
        ? Container()
        : CarouselSlider(
            items: upcommingClassesCardList,
            options: CarouselOptions(
              height: 200,
              aspectRatio: 16 / 9,
              viewportFraction: 0.8,
              initialPage: 0,
              enableInfiniteScroll: false,
              reverse: false,
              autoPlay: true,
              autoPlayInterval: const Duration(seconds: 3),
              autoPlayAnimationDuration: const Duration(milliseconds: 800),
              autoPlayCurve: Curves.fastOutSlowIn,
              enlargeCenterPage: true,
              scrollDirection: Axis.horizontal,
            )));
  }
}
