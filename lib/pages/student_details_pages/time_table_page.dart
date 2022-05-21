import 'dart:collection';
import 'package:flutter/material.dart';
import 'package:vtop_app/pages/student_details_pages/Components/sized_icon.dart';
import 'package:vtop_app/pages/student_details_pages/Components/text_box_decoration.dart';

import '../../StudentObject.dart';
import 'package:vtop_app/pages/student_details_pages/Components/null_page.dart';

var timetableBoxDecoration = BoxDecoration(
  color: Colors.white,
  borderRadius: BorderRadius.circular(10.0),
  boxShadow: [
    BoxShadow(
      color: Colors.black.withOpacity(0.05),
      spreadRadius: 2,
      blurRadius: 2,
      offset: const Offset(0, 2), // changes position of shadow
    ),
  ],
);

class TimeTablePage extends StatelessWidget {
  final HashMap<String, List<TimeSlot>>? timetable;
  const TimeTablePage({Key? key, this.timetable}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<String> days = [
      'Monday',
      'Tuesday',
      'Wednesday',
      'Thursday',
      'Friday',
      'Saturday',
      'Sunday'
    ];

    List<Color> clrs = [
      // Color.fromARGB(255, 241, 32, 154),
      // Colors.blue.shade900,
      // // Colors.green.shade900,
      // Colors.red.shade900,
      // Colors.pink.shade700,
      // Colors.orange.shade900,
      // Colors.yellow.shade900,
      Colors.black
    ];

    _construct_day(String day) {
      Color clr = clrs[days.indexOf(day) % clrs.length];

      _expandDay(BuildContext ctx) {
        Navigator.of(context).push(MaterialPageRoute<void>(
          builder: (BuildContext context) =>
              TimeTableDayPage(day: day, timeSlots: timetable![day]),
        ));
      }

      return Padding(
        padding: const EdgeInsets.all(8.0),
        child: GestureDetector(
          onTap: () => _expandDay(context),
          child: Hero(
            tag: day,
            child: Container(
              decoration: textBoxDecoration,
              child: Padding(
                padding: const EdgeInsets.fromLTRB(8.0, 20.0, 8.0, 20.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      day,
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 20.0, color: clr),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      );
    }

    days.removeWhere((day) => timetable == null || timetable![day] == null);

    print(timetable);
    return (timetable == null)
        ? const NullPage(errorMsg: "No Time Table Found! , For this sem")
        : Scaffold(
            body: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(children: [
                  const SizedIcon(icon: Icons.calendar_month_outlined),
                  for (int i = 0; i < days.length; i++) _construct_day(days[i]),
                ]),
              ),
            ),
          );
  }
}

class TimeTableDayPage extends StatelessWidget {
  final String day;
  final List<TimeSlot>? timeSlots;
  const TimeTableDayPage({Key? key, required this.day, required this.timeSlots})
      : super(key: key);

  _getSlotInfoWidget(TimeSlot slotInfo) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
              flex: 3,
              child: Padding(
                padding: const EdgeInsets.only(right: 8.0),
                child: Text(slotInfo.courseName,
                    style: const TextStyle(fontWeight: FontWeight.bold)),
              )),
          Expanded(
              child: Text(slotInfo.slot,
                  style: const TextStyle(color: Colors.grey))),
          Expanded(flex: 2, child: Text(slotInfo.classRoom)),
          Expanded(
              flex: 1,
              child: Column(children: [
                Text(slotInfo.startTime,
                    style: TextStyle(color: Colors.green.withOpacity(0.5))),
                Text(slotInfo.endTime,
                    style:
                        TextStyle(color: Colors.red.shade500.withOpacity(0.5))),
              ])),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    var timeSlotHeader = Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: const [
          Expanded(flex: 3, child: Text("Course Name")),
          Expanded(child: Text("Slot")),
          Expanded(flex: 2, child: Text("Class Room")),
          Expanded(flex: 1, child: Text("Time", textAlign: TextAlign.center)),
        ],
      ),
    );

    return Scaffold(
      bottomNavigationBar: BottomAppBar(
        color: Theme.of(context).primaryColor,
        child: Padding(
          padding: const EdgeInsets.only(top: 12.0, bottom: 12.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(day, style: const TextStyle(color: Colors.white)),
            ],
          ),
        ),
      ),
      body: (timeSlots == null)
          ? const NullPage(errorMsg: "No Time Table Found!, For this day")
          : SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.fromLTRB(20.0, 8.0, 20.0, 8.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    const SizedIcon(icon: Icons.calendar_today_outlined),
                    Container(
                      decoration: timetableBoxDecoration,
                      child: Padding(
                        padding:
                            const EdgeInsets.fromLTRB(8.0, 20.0, 8.0, 20.0),
                        child: Column(
                          children: [
                            timeSlotHeader,
                            const Divider(color: Colors.black),
                            for (var i in timeSlots!) _getSlotInfoWidget(i),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(height: 50.0),
                  ],
                ),
              ),
            ),
    );
  }
}
