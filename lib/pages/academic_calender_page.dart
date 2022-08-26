import 'package:flutter/material.dart';
import 'package:vtop_app/pages/Components/sized_icon.dart';

import '../Academic_calender/academic_calender_obj.dart';
import 'Components/bottom_nav_with_home.dart';
import 'Components/null_page.dart';

class AcademicCalenderPage extends StatelessWidget {
  final AcademicCalender academicCalender;
  const AcademicCalenderPage({Key? key, required this.academicCalender})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    var _academicCalender = academicCalender.getAcademicCalender();
    return Scaffold(
      bottomNavigationBar: bottomNavWithHomeButton(context),
      body: (_academicCalender.isEmpty)
          ? const NullPage(errorMsg: "No Academic Calender Found!")
          : Column(
              children: [
                const SizedIcon(icon: Icons.edit_calendar_rounded),
                Expanded(
                  child: ListView.builder(
                    itemCount: _academicCalender.length,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(5.0),
                          child: Image.network(
                            _academicCalender[index],
                            fit: BoxFit.fill,
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
    );
  }
}
