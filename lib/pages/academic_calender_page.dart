import 'package:flutter/material.dart';
import 'package:vtop_app/pages/Components/sized_icon.dart';

import '../Academic_calender/academic_calender_obj.dart';
import 'Components/bottom_nav_with_back_button.dart';

class AcademicCalenderPage extends StatelessWidget {
  final AcademicCalender academicCalender;
  const AcademicCalenderPage({Key? key, required this.academicCalender})
      : super(key: key);

  Widget _backButton(context) => TextButton(
        onPressed: () => Navigator.pushNamed(context, '/'),
        child: const Icon(
          Icons.arrow_back,
          color: Colors.white,
        ),
      );

  @override
  Widget build(BuildContext context) {
    var _academicCalender = academicCalender.getAcademicCalender();
    return Scaffold(
      bottomNavigationBar:
          bottomNavWithBackButton(context, _backButton(context)),
      body: Column(
        children: [
          const SizedIcon(icon: Icons.edit_calendar_rounded),
          Expanded(
            child: ListView.builder(
              itemCount: _academicCalender.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(20.0),
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
