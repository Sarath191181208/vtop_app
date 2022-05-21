import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:vtop_app/StudentObject.dart';
import 'package:vtop_app/pages/student_details_pages/Components/null_page.dart';
import 'package:vtop_app/pages/student_details_pages/Components/sized_icon.dart';

import 'Components/text_box_decoration.dart';

var _attendanceBoxDecoration = BoxDecoration(
  borderRadius: BorderRadius.circular(20),
  color: Colors.white,
  boxShadow: [
    BoxShadow(
      color: Colors.black.withOpacity(0.05),
      spreadRadius: 5,
      blurRadius: 4,
      offset: const Offset(0, 4), // changes position of shadow
    ),
  ],
);

class AttendancePage extends StatelessWidget {
  final List<AttendanceInfoSlot>? attendance;
  const AttendancePage({Key? key, this.attendance}) : super(key: key);

  _header(String txt) {
    return Padding(
      padding: const EdgeInsets.only(left: 20.0, right: 20.0, top: 8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Flexible(
            child: Text(
              txt,
              textAlign: TextAlign.center,
            ),
          ),
        ],
      ),
    );
  }

  _progressBar(double percent) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(20.0, 0.0, 20.0, 0.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          SizedBox(
            height: 150.0,
            child: Stack(
              children: <Widget>[
                Center(
                  child: SizedBox(
                    width: 150,
                    height: 150,
                    child: CircularProgressIndicator(
                      value: percent / 100,
                      semanticsLabel: "Percentage of attendance is: ",
                      semanticsValue: "$percent%",
                    ),
                  ),
                ),
                Center(child: Text(percent.toString() + '%')),
              ],
            ),
          ),
          const SizedBox(height: 30.0),
          const Divider(indent: 20.0, endIndent: 20.0, color: Colors.grey)
        ],
      ),
    );
  }

  _tile(String label, String trailing) {
    return ListTile(
      title: Text(label),
      trailing: Text(trailing, style: const TextStyle(color: Colors.grey)),
    );
  }

  @override
  Widget build(BuildContext context) {
    if ((attendance == null)) {
      return const NullPage(errorMsg: "No attendance data found for this sem.");
    } else {
      return Scaffold(
        body: SingleChildScrollView(
          child: Column(children: [
            const SizedIcon(icon: Icons.access_time),
            for (AttendanceInfoSlot attdSlot in attendance!)
              Padding(
                padding: const EdgeInsets.only(
                    left: 25.0, right: 25.0, bottom: 15.0),
                child: Container(
                  decoration: _attendanceBoxDecoration,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      children: [
                        _header(attdSlot.faculty),
                        const SizedBox(height: 20.0),
                        _progressBar(attdSlot.percentage),
                        _tile(attdSlot.typeOfClass,
                            "${attdSlot.attended} /${attdSlot.totalClasses}"),
                        _tile(attdSlot.courseName, attdSlot.code),
                      ],
                    ),
                  ),
                ),
              )
          ]),
        ),
      );
    }
  }
}
