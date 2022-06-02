import 'dart:collection';
import 'package:flutter/material.dart';
import '../../theme_manager.dart';
import '../../Student/student_object.dart';

import '/pages/student_details_pages/Components/sized_icon.dart';
import '/pages/student_details_pages/Components/text_box_decoration.dart';
import '/pages/student_details_pages/Components/null_page.dart';

class TimeTablePage extends StatelessWidget {
  final HashMap<String, List<TimeSlot>>? timetable;
  const TimeTablePage({Key? key, this.timetable}) : super(key: key);

  _constructDay(String day, BuildContext context) {
    var boxClr = Theme.of(context).extension<MyColors>()!.boxColor;
    return DayTile(
      day: day,
      clr: boxClr!,
      onTap: () => {
        Navigator.of(context).push(MaterialPageRoute<void>(
          builder: (BuildContext ctx) =>
              TimeTableDayPage(day: day, timeSlots: timetable![day]),
        ))
      },
    );
  }

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

    days.removeWhere((day) => timetable == null || timetable![day] == null);

    return (timetable == null)
        ? const NullPage(errorMsg: "No Time Table Found! , For this sem")
        : Scaffold(
            body: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(children: [
                  const SizedIcon(icon: Icons.calendar_month_outlined),
                  for (int i = 0; i < days.length; i++)
                    _constructDay(days[i], context),
                ]),
              ),
            ),
          );
  }
}

class DayTile extends StatelessWidget {
  final String day;
  final Function onTap;
  final Color clr;
  const DayTile(
      {Key? key, required this.day, required this.onTap, required this.clr})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: GestureDetector(
        onTap: () => onTap(),
        child: Hero(
          tag: day,
          child: Container(
            decoration: getTextBoxDecoration(clr),
            child: Padding(
              padding: const EdgeInsets.fromLTRB(8.0, 20.0, 8.0, 20.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    day,
                    textAlign: TextAlign.center,
                    style: const TextStyle(fontSize: 20.0),
                  ),
                ],
              ),
            ),
          ),
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

    var boxClr = Theme.of(context).extension<MyColors>()!.boxColor;
    var timetableBoxDecoration =
        getTextBoxDecoration(boxClr!, borderRadius: 10);

    _backButton(context) => TextButton(
          onPressed: () => Navigator.of(context).pop(),
          child: const Icon(
            Icons.arrow_back,
            color: Colors.white,
          ),
        );

    return Scaffold(
      bottomNavigationBar: BottomAppBar(
        color: Theme.of(context).primaryColor,
        child: Row(
          children: [
            Expanded(
              child: Text(day, textAlign: TextAlign.center),
            ),
            _backButton(context),
          ],
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
                            const Divider(),
                            for (var i in timeSlots!)
                              SlotInfoWidget(slotInfo: i),
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

class SlotInfoWidget extends StatelessWidget {
  final TimeSlot slotInfo;
  const SlotInfoWidget({Key? key, required this.slotInfo}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
}
