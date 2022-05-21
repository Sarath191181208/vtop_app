import 'package:flutter/material.dart';
import 'package:vtop_app/pages/student_details_pages/academic_details_page.dart';

import 'package:vtop_app/pages/student_details_pages/academic_summary.dart';
import 'package:vtop_app/pages/student_details_pages/attendance_page.dart';
import 'package:vtop_app/pages/student_details_pages/profile_page.dart';

import '../StudentObject.dart';

Color timeTableColor = const Color.fromRGBO(255, 51, 132, 1);
Color attendanceColor = const Color.fromRGBO(0, 166, 255, 1);
Color marksColor = const Color.fromRGBO(0, 207, 169, 1);
Color marksSummaryColor = const Color.fromRGBO(112, 51, 255, 1);
Color profileColor = const Color.fromRGBO(255, 87, 51, 1);

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
    BottomNavigationBarItem(
      icon: const Icon(Icons.calendar_month_outlined),
      label: 'Time Table',
      backgroundColor: timeTableColor,
    ),
    BottomNavigationBarItem(
      icon: const Icon(Icons.access_time),
      label: 'Attendance',
      backgroundColor: attendanceColor,
    ),
    BottomNavigationBarItem(
        icon: const Icon(Icons.school_outlined),
        label: 'Academics',
        backgroundColor: marksColor),
    BottomNavigationBarItem(
      icon: const Icon(Icons.military_tech_outlined),
      label: 'Summary',
      backgroundColor: marksSummaryColor,
    ),
    BottomNavigationBarItem(
      icon: const Icon(Icons.person_outline),
      label: 'Profile',
      backgroundColor: profileColor,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    List<Widget> _pages = [
      const Center(child: Text('Time Table')),
      AttendancePage(attendance: widget.studentDetails.getAttendace()),
      AcademicDetails(acadHist: widget.studentDetails.academicHistory.subjects),
      AcademicSummary(summary: widget.studentDetails.academicHistory.summary),
      ProfilePage(studentProfile: widget.studentDetails.profile),
    ];

    return Scaffold(
      body: _pages.elementAt(_pageIndex),
      bottomNavigationBar: BottomNavigationBar(
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
