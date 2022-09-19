import 'dart:collection';
import 'package:flutter/material.dart';
import 'package:vtop_app/Student/student_object.dart';
import 'package:vtop_app/apis/theme_manager.dart';

import '../Components/sized_icon.dart';
import '../Components/text_box_decoration.dart';

class AcademicDetails extends StatelessWidget {
  final AcademicHistory acadHist;
  const AcademicDetails({Key? key, required this.acadHist}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(height: 50),
              const SizedIcon(
                  icon: Icons.military_tech_outlined,
                  text: "Academic Summary",
                  upperSpacingSize: 20),
              AcademicSummary(summary: acadHist.summary),
              const SizedIcon(
                icon: Icons.school_outlined,
                text: "Academic History",
                upperSpacingSize: 20,
              ),
              const SizedBox(height: 20),
              AcademicHistoryWidget(acadHist: acadHist.subjects)
            ],
          ),
        ),
      ),
    );
  }
}

class AcademicSummaryTLDR extends StatelessWidget {
  final String? creditsEarned;
  final String? cgpa;
  const AcademicSummaryTLDR({Key? key, this.creditsEarned, this.cgpa})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    Color? boxClr = Theme.of(context).extension<MyColors>()!.boxColor;
    boxClr = boxClr!;

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Container(
          height: 60,
          width: MediaQuery.of(context).size.width * 0.43,
          decoration: getTextBoxDecoration(boxClr),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                width: 34,
                child: Text(
                  creditsEarned ?? "0",
                ),
              ),
              const SizedBox(
                width: 10,
              ),
              const VerticalDivider(),
              const SizedBox(
                width: 20,
              ),
              Container(
                width: 50,
                child: const Text(
                  'Credits Earned',
                ),
              ),
            ],
          ),
        ),
        Container(
          height: 60,
          width: MediaQuery.of(context).size.width * 0.43,
          decoration: getTextBoxDecoration(boxClr),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                width: 34,
                child: Text(
                  cgpa!,
                ),
              ),
              const SizedBox(
                width: 10,
              ),
              const VerticalDivider(),
              const SizedBox(
                width: 20,
              ),
              const SizedBox(
                width: 50,
                child: Text(
                  'CGPA',
                ),
              ),
            ],
          ),
        ),
      ],
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
      // cheking if it's grade like S,A,B,C,D,E,F
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

  Widget _buildAcadSummary(BuildContext context, Color? boxClr) {
    return Padding(
      padding: const EdgeInsets.only(left: 20.0, right: 20),
      child: Column(
        children: [
          const AcademicSummaryTLDR(cgpa: "10.0", creditsEarned: "20.0"),
          const SizedBox(height: 20),
          for (var summaryKey in summaryKeys)
            Padding(
              padding: const EdgeInsets.only(bottom: 10.0),
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
    );
  }

  @override
  Widget build(BuildContext context) {
    Color? boxClr = Theme.of(context).extension<MyColors>()!.boxColor;

    return Column(
      children: [
        (summary == null)
            ? const CustomNotFoundWidget(txt: "No Academic Summary Found")
            : _buildAcadSummary(context, boxClr),
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

  Widget _buildAcadHist(BuildContext context, Color? boxClr) {
    return Column(
      children: [
        for (var acadHistEntry in acadHist!.entries)
          Padding(
            padding:
                const EdgeInsets.only(left: 20.0, right: 20.0, bottom: 10.0),
            child: Container(
              decoration: getTextBoxDecoration(boxClr!),
              child: ListTile(
                title: Text(acadHistEntry.key),
                trailing: Text(
                  acadHistEntry.value,
                  style: TextStyle(color: _getGradeColor(acadHistEntry.value)),
                ),
              ),
            ),
          ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    Color? boxClr = Theme.of(context).extension<MyColors>()!.boxColor;

    return Column(
      children: [
        (acadHist == null)
            ? const CustomNotFoundWidget(txt: "No Academic History Found")
            : _buildAcadHist(context, boxClr)
      ],
    );
  }
}

class CustomNotFoundWidget extends StatelessWidget {
  final String txt;

  const CustomNotFoundWidget({Key? key, required this.txt}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var boxClr = Theme.of(context).extension<MyColors>()!.boxColor;

    return Padding(
      padding: const EdgeInsets.fromLTRB(20, 10, 20, 10),
      child: Container(
          decoration: getTextBoxDecoration(boxClr!),
          child: Padding(
            padding: const EdgeInsets.fromLTRB(40, 20, 40, 20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Icon(
                  Icons.error,
                  color: Colors.red,
                  size: 40.0,
                ),
                const SizedBox(height: 20),
                Text(txt, style: const TextStyle(color: Colors.grey)),
              ],
            ),
          )),
    );
  }
}
