import 'dart:collection';

import 'package:flutter/material.dart';
import '../../apis/theme_manager.dart';
import '../Components/null_page.dart';
import '../Components/sized_icon.dart';
import '../Components/text_box_decoration.dart';

class AcademicSummary extends StatelessWidget {
  final HashMap<String, double?>? summary;
  const AcademicSummary({Key? key, this.summary}) : super(key: key);

  static const List<String> summaryKeys = [
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

  _getGradeCountColor(String s, double? d) {
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
    // return Colors.black;
  }

  @override
  Widget build(BuildContext context) {
    var boxClr = Theme.of(context).extension<MyColors>()!.boxColor;

    return (summary == null)
        ? const NullPage(errorMsg: "No academic Summary Found !")
        : Scaffold(
            body: SingleChildScrollView(
            child: Column(
              children: [
                const SizedIcon(icon: Icons.military_tech_outlined),
                for (var summaryKey in summaryKeys)
                  Padding(
                    padding: const EdgeInsets.only(
                        left: 20.0, right: 20.0, bottom: 10.0),
                    child: Container(
                      // grey border bottomm
                      decoration: getTextBoxDecoration(boxClr!),
                      child: ListTile(
                        title: Text(
                          summaryKey,
                        ),
                        trailing: Text(
                          summary![summaryKey].toString(),
                          style: TextStyle(
                              color: _getGradeCountColor(
                                  summaryKey, summary![summaryKey])),
                        ),
                      ),
                    ),
                  ),
              ],
            ),
          ));
  }
}
