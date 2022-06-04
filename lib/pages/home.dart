import 'package:flutter/material.dart';
import 'package:vtop_app/Academic_calender/academic_calender_obj.dart';
import 'package:vtop_app/Academic_calender/fetch_academic_calender.dart';
import 'package:vtop_app/apis/storage/pref_academic_calender.dart';
import 'package:vtop_app/apis/storage/pref_faculty.dart';
import 'package:vtop_app/faculty/faculty_object.dart';
import 'package:vtop_app/faculty/fetch_faculty_details.dart';
import 'package:vtop_app/pages/Components/custom_button.dart';
import 'package:vtop_app/pages/Components/sized_icon.dart';
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
    Widget _arrowButton = CustomHomeButton(
        text: "Auto Login",
        icon: Icons.arrow_right_alt_rounded,
        onPressed: () => _handleNavigate(context));

    Widget _facultyButton = CustomHomeButton(
      text: "Faculty Details",
      icon: Icons.people_outline,
      onPressed: () => _handleFaculty(context),
    );

    Widget _academicButton = CustomHomeButton(
      text: "Academic Calender",
      icon: Icons.edit_calendar_rounded,
      onPressed: () => _handleAcadCalender(context),
    );

    Widget _settingsButton = CustomHomeButton(
      text: "Settings",
      icon: Icons.settings_rounded,
      onPressed: () => _handleSettings(context),
    );

    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedIcon(icon: Icons.home_rounded, text: "Home Page"),
              // const SizedBox(height: 50.0),
              _settingsButton,
              const SizedBox(height: 10.0),
              _arrowButton,
              const SizedBox(height: 10.0),
              _facultyButton,
              const SizedBox(height: 10.0),
              _academicButton,
            ],
          ),
        ),
      ),
    );
  }
}

class CustomHomeButton extends CustomButton {
  // ignore: use_key_in_widget_constructors
  const CustomHomeButton(
      {required String text,
      required Function onPressed,
      required IconData icon})
      : super(text: text, onPressed: onPressed, icon: icon);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        super.build(context),
      ],
    );
  }
}
