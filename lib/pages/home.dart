import 'package:flutter/material.dart';
import 'package:vtop_app/Academic_calender/academic_calender_obj.dart';
import 'package:vtop_app/Academic_calender/fetch_academic_calender.dart';
import 'package:vtop_app/apis/storage/pref_academic_calender.dart';
import 'package:vtop_app/apis/storage/pref_faculty.dart';
import 'package:vtop_app/faculty/faculty_object.dart';
import 'package:vtop_app/faculty/fetch_faculty_details.dart';
import '../apis/storage/pref_student.dart';
import 'dialogs.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  _handleNavigate(BuildContext ctx) async {
    var stu = await PrefStudent.getStudent();
    if (stu == null) {
      Navigator.pushNamed(ctx, "/login");
      return;
    }
    Navigator.pushReplacementNamed(ctx, '/details', arguments: stu);
  }

  _handleFaculty(BuildContext ctx) async {
    showLoaderDialog(ctx);
    Faculty? fac = await PrefFaculty.getFaculty();
    if (fac == null) {
      fac = await fetchFacultyDetails();
      if (fac == null) {
        Navigator.pop(ctx);
        showErrorDialog(ctx,
            "Couldn't fetch faculty details right now. Please try again later.");
        return;
      }
    }
    Navigator.pop(ctx);
    Navigator.pushNamed(ctx, '/faculty', arguments: fac);
  }

  _handleAcadCalender(BuildContext ctx) async {
    showLoaderDialog(ctx);
    AcademicCalender? acad = await PrefAcademicCalender.getAcademicCalender();
    if (acad == null) {
      acad = await fetchAcademicCalenders();
      if (acad == null) {
        Navigator.pop(ctx);
        showErrorDialog(ctx,
            "Couldn't academic details right now. Please try again later.");
        return;
      }
    }
    Navigator.pop(ctx);
    Navigator.pushNamed(ctx, '/academicCalender', arguments: acad);
  }

  _handleSettings(BuildContext ctx) {
    Navigator.pushNamed(ctx, '/settings');
  }

  @override
  Widget build(BuildContext context) {
    Widget _welcomeText = Row(children: [
      Expanded(
        child: Text("Welcome !",
            textAlign: TextAlign.center,
            style: TextStyle(
                fontSize: 45.0, color: Theme.of(context).primaryColor)),
      ),
    ]);

    Widget _arrowButton = TextButton(
      style: TextButton.styleFrom(
        backgroundColor: Theme.of(context).primaryColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(50.0),
        ),
        elevation: 10.0,
      ),
      child: const Padding(
        padding: EdgeInsets.only(left: 20.0, right: 20.0),
        child: Icon(
          Icons.arrow_right_alt_rounded,
          size: 30.0,
          color: Colors.white,
        ),
      ),
      onPressed: () => _handleNavigate(context),
    );

    Widget _facultyButton = TextButton(
      style: TextButton.styleFrom(
        backgroundColor: Theme.of(context).primaryColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(50.0),
        ),
        elevation: 10.0,
      ),
      child: const Padding(
        padding: EdgeInsets.only(left: 20.0, right: 20.0),
        child: Icon(
          Icons.people_outline,
          size: 30.0,
          color: Colors.white,
        ),
      ),
      onPressed: () => _handleFaculty(context),
    );

    Widget _academicButton = TextButton(
      style: TextButton.styleFrom(
        backgroundColor: Theme.of(context).primaryColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(50.0),
        ),
        elevation: 10.0,
      ),
      child: const Padding(
        padding: EdgeInsets.only(left: 20.0, right: 20.0),
        child: Icon(
          Icons.edit_calendar_rounded,
          size: 30.0,
          color: Colors.white,
        ),
      ),
      onPressed: () => _handleAcadCalender(context),
    );

    Widget _settingsButton = TextButton(
      style: TextButton.styleFrom(
        backgroundColor: Theme.of(context).primaryColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(50.0),
        ),
        elevation: 10.0,
      ),
      child: const Padding(
        padding: EdgeInsets.only(left: 20.0, right: 20.0),
        child: Icon(
          Icons.settings_rounded,
          size: 30.0,
          color: Colors.white,
        ),
      ),
      onPressed: () => _handleSettings(context),
    );

    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            _welcomeText,
            const SizedBox(height: 50.0),
            _arrowButton,
            const SizedBox(height: 10.0),
            _facultyButton,
            const SizedBox(height: 10.0),
            _academicButton,
            const SizedBox(height: 10.0),
            _settingsButton,
          ],
        ),
      ),
    );
  }
}
