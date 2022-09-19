import 'dart:collection';
import 'package:flutter/material.dart';
import '../../apis/theme_manager.dart';
import '../../Student/student_object.dart';
import '../Components/null_page.dart';
import '../Components/sized_icon.dart';
import '../Components/text_box_decoration.dart';
import 'upcomming_class_component.dart';

class TimeTablePage extends StatelessWidget {
  final HashMap<String, List<TimeSlot>>? timetable;
  const TimeTablePage({Key? key, this.timetable}) : super(key: key);

  static const List<String> days = [
    'Monday',
    'Tuesday',
    'Wednesday',
    'Thursday',
    'Friday',
    'Saturday',
    'Sunday'
  ];

  _constructDay(String day, BuildContext context) {
    var boxClr = Theme.of(context).extension<MyColors>()!.boxColor;
    return DayTile(
      day: day,
      clr: boxClr!,
      onTap: () => {
        Navigator.of(context).push(MaterialPageRoute<void>(
            builder: (BuildContext ctx) =>
                SingleDayPage(day: day, timeSlots: timetable![day])))
      },
    );
  }

  int _strToSec(String time) {
    var timeSplit = time.split(":");
    var hour = int.parse(timeSplit[0]);
    var min = int.parse(timeSplit[1]);
    return hour * 60 + min;
  }

  @override
  Widget build(BuildContext context) {
    var _days = [...days]; // copying as days is static
    _days.removeWhere((day) => timetable == null || timetable![day] == null);

    return (timetable == null)
        ? const NullPage(errorMsg: "No Time Table Found! , For this sem")
        : Scaffold(
            body: SafeArea(
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(children: [
                    const SizedBox(height: 50),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        const SizedBox(width: 10),
                        const Icon(Icons.calendar_today_outlined),
                        const SizedBox(width: 10),
                        Text("Today's Classes",
                            style: Theme.of(context).textTheme.headline6),
                      ],
                    ),
                    const SizedBox(height: 10),
                    UpcomingClassSliderComponent(
                      timetable: timetable,
                    ),
                    const SizedBox(height: 30),
                    for (int i = 0; i < _days.length; i++)
                      _constructDay(_days[i], context),
                  ]),
                ),
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

class SingleDayPage extends StatelessWidget {
  final String day;
  final List<TimeSlot>? timeSlots;
  const SingleDayPage({Key? key, required this.day, required this.timeSlots})
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
                    SizedIcon(
                      icon: Icons.calendar_today_outlined,
                      text: day,
                    ),
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
