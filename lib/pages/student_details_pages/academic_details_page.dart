import 'dart:collection';
import 'package:flutter/material.dart';
import 'package:vtop_app/Student/student_object.dart';
import 'package:vtop_app/apis/theme_manager.dart';

import '../Components/null_page.dart';
import '../Components/sized_icon.dart';
import '../Components/text_box_decoration.dart';

class AcademicDetails extends StatelessWidget {
  final AcademicHistory acadHist;
  const AcademicDetails({Key? key, required this.acadHist}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            AcademicSummary(summary: acadHist.summary),
            AcademicHistoryWidget(acadHist: acadHist.subjects)
          ],
        ),
      ),
    );
  }
}

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
        : Column(
            children: [
              const SizedIcon(
                  icon: Icons.military_tech_outlined, text: "Academic Summary"),
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
          );
  }
}

class AcademicHistoryWidget extends StatelessWidget {
  final HashMap<String, String>? acadHist;
  const AcademicHistoryWidget({Key? key, required this.acadHist})
      : super(key: key);

  _getGradeColor(String s) {
    if (s == "S") return Colors.green;
    if (s == "A") return Colors.green;
    if (s == "B") return Colors.orange;
    if (s == "C") return Colors.orange;
    if (s == "D") return Colors.orange;
    if (s == "E") return Colors.red;
    if (s == "F") return Colors.red;
  }

  @override
  Widget build(BuildContext context) {
    var boxClr = Theme.of(context).extension<MyColors>()!.boxColor;

    return (acadHist == null)
        ? const NullPage(errorMsg: "Can't seem to find the academic details")
        : Column(
            children: [
              const SizedIcon(
                icon: Icons.school_outlined,
                text: "Academic History",
                upperSpacingSize: 50.0,
              ),
              for (var acadHistEntry in acadHist!.entries)
                Padding(
                  padding: const EdgeInsets.only(
                      left: 20.0, right: 20.0, bottom: 10.0),
                  child: Container(
                    decoration: getTextBoxDecoration(boxClr!),
                    child: ListTile(
                      title: Text(acadHistEntry.key),
                      trailing: Text(
                        acadHistEntry.value,
                        style: TextStyle(
                            color: _getGradeColor(acadHistEntry.value)),
                      ),
                    ),
                  ),
                ),
            ],
          );
  }
}
