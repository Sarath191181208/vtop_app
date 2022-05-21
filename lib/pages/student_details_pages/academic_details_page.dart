import 'dart:collection';
import 'package:flutter/material.dart';
import 'package:vtop_app/pages/student_details_pages/Components/sized_icon.dart';

import 'Components/null_page.dart';
import 'Components/text_box_decoration.dart';

class AcademicDetails extends StatelessWidget {
  final HashMap<String, String>? acadHist;
  const AcademicDetails({Key? key, this.acadHist}) : super(key: key);

  _get_grade_color(String s) {
    if (s == "S") return Colors.green;
    if (s == "A") return Colors.green;
    if (s == "B") return Colors.orange;
    if (s == "C") return Colors.orange;
    if (s == "D") return Colors.orange;
    if (s == "E") return Colors.red;
    if (s == "F") return Colors.red;

    return Colors.black;
  }

  @override
  Widget build(BuildContext context) {
    final _acadIcon =
        Row(mainAxisAlignment: MainAxisAlignment.center, children: const [
      Icon(
        Icons.school_outlined,
        // color: Theme.of(context).primaryColor,
        color: Color.fromRGBO(255, 87, 51, 1),
        size: 50.0,
      )
    ]);
    return (acadHist == null)
        ? const NullPage(errorMsg: "Can't seem to find the academic details")
        : Scaffold(
            body: SingleChildScrollView(
              child: Column(
                children: [
                  const SizedIcon(icon: Icons.school_outlined),
                  for (var acadHistEntry in acadHist!.entries)
                    Padding(
                      padding: const EdgeInsets.only(
                          left: 20.0, right: 20.0, bottom: 10.0),
                      child: Container(
                        decoration: textBoxDecoration,
                        child: ListTile(
                          title: Text(acadHistEntry.key),
                          trailing: Text(
                            acadHistEntry.value,
                            style: TextStyle(
                                color: _get_grade_color(acadHistEntry.value)),
                          ),
                        ),
                      ),
                    ),
                ],
              ),
            ),
          );
  }
}
