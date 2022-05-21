import 'package:flutter/material.dart';
import 'package:vtop_app/pages/student_details_pages/academic_details_page.dart';

import 'package:vtop_app/pages/student_details_pages/academic_summary.dart';
import 'package:vtop_app/pages/student_details_pages/attendance_page.dart';
import 'package:vtop_app/pages/student_details_pages/profile_page.dart';

import '../StudentObject.dart';
import 'student_details_pages/time_table_page.dart';

class DetailsPage extends StatefulWidget {
  final Student studentDetails;
  const DetailsPage({Key? key, required this.studentDetails}) : super(key: key);
  @override
  State<DetailsPage> createState() => _DetailsPageState();
}

class _DetailsPageState extends State<DetailsPage> {
  int _pageIndex = 3;
  // widget.studentDetails.profile.name

  final List<BottomNavigationBarItem> _bottomNavigationBarItems = [
    const BottomNavigationBarItem(
      icon: Icon(Icons.calendar_month_outlined),
      label: 'Time Table',
    ),
    const BottomNavigationBarItem(
      icon: Icon(Icons.access_time),
      label: 'Attendance',
    ),
    const BottomNavigationBarItem(
      icon: Icon(Icons.school_outlined),
      label: 'Academics',
    ),
    const BottomNavigationBarItem(
      icon: Icon(Icons.military_tech_outlined),
      label: 'Summary',
    ),
    const BottomNavigationBarItem(
      icon: Icon(Icons.person_outline),
      label: 'Profile',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    List<Widget> _pages = [
      TimeTablePage(timetable: widget.studentDetails.getTimeTable()),
      AttendancePage(attendance: widget.studentDetails.getAttendace()),
      AcademicDetails(acadHist: widget.studentDetails.academicHistory.subjects),
      AcademicSummary(summary: widget.studentDetails.academicHistory.summary),
      ProfilePage(studentProfile: widget.studentDetails.profile),
    ];

    return Scaffold(
      body: _pages.elementAt(_pageIndex),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.white,
        type: BottomNavigationBarType.fixed,
        selectedItemColor: Theme.of(context).primaryColor,
        unselectedItemColor: Theme.of(context).primaryColor.withOpacity(0.3),
        items: _bottomNavigationBarItems,
        currentIndex: _pageIndex,
        onTap: (index) {
          setState(() {
            _pageIndex = index;
          });
        },
      ),
    );
  }
}
