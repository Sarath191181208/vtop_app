import 'dart:collection';

import 'package:flutter/material.dart';
import 'package:vtop_app/pages/student_details_pages/null_page.dart';

BoxDecoration _textBoxDecoration = BoxDecoration(
  color: Colors.white,
  borderRadius: BorderRadius.circular(5.0),
  boxShadow: [
    BoxShadow(
      color: Colors.black.withOpacity(0.1),
      spreadRadius: 5,
      blurRadius: 20,
      offset: const Offset(0, 0), // changes position of shadow
    ),
  ],
);

class AcademicSummary extends StatelessWidget {
  final HashMap<String, double?>? summary;
  const AcademicSummary({Key? key, this.summary}) : super(key: key);

  Color _get_grade_count_color(String s, double? d) {
    if (d == null || d == 0.0) return Colors.grey;

    if (s.length < 2) {
      if (d < 3) return Colors.red;
      if (d >= 7) return Colors.green;
      if (d >= 3 && d < 7) return const Color.fromRGBO(249, 187, 0, 1);
    }
    if (s == "CGPA") {
      if (d < 4) return Colors.red;
      if (d >= 8.0) return Colors.green;
      if (d >= 5 && d < 8) return const Color.fromRGBO(249, 187, 0, 1);
    }
    return Colors.black;
  }

  @override
  Widget build(BuildContext context) {
    List<String> summaryKeys = [
      "S",
      "A",
      "B",
      "C",
      "D",
      "E",
      "F",
      "CGPA",
      "CreditsEarned",
      "CreditsRegistered"
    ];

    List<Widget>? gpaSummary = (summary == null)
        ? null
        : [
            for (var summaryKey in summaryKeys)
              Padding(
                padding: const EdgeInsets.only(
                    left: 20.0, right: 20.0, bottom: 10.0),
                child: Container(
                  // grey border bottomm
                  decoration: _textBoxDecoration,
                  child: ListTile(
                    title: Text(
                      summaryKey,
                    ),
                    trailing: Text(
                      summary![summaryKey].toString(),
                      style: TextStyle(
                          color: _get_grade_count_color(
                              summaryKey, summary![summaryKey])),
                    ),
                  ),
                ),
              )
          ];

    final _summaryIcon =
        Row(mainAxisAlignment: MainAxisAlignment.center, children: const [
      Icon(
        Icons.military_tech_outlined,
        // color: Theme.of(context).primaryColor,
        color: Color.fromRGBO(255, 87, 51, 1),
        size: 50.0,
      )
    ]);

    return (summary == null)
        ? const NullPage(errorMsg: "No academic Summary Found !")
        : Scaffold(
            body: SingleChildScrollView(
            child: Column(
              children: [
                const SizedBox(height: 250.0),
                _summaryIcon,
                const SizedBox(height: 30.0),
                ...?gpaSummary,
              ],
            ),
          ));
  }
}
