import 'package:flutter/material.dart';
import 'package:vtop_app/pages/Components/null_page.dart';

import '../apis/theme_manager.dart';
import '../faculty/faculty_object.dart';
import 'Components/sized_icon.dart';
import 'Components/text_box_decoration.dart';

class FacultyPage extends StatelessWidget {
  final List<IndividualFaculty> facultyList;
  const FacultyPage({Key? key, required this.facultyList}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: (facultyList.isEmpty)
            ? const NullPage(errorMsg: "No faculty found")
            : SingleChildScrollView(
                physics: const ScrollPhysics(),
                child: Column(
                  children: [
                    const SizedIcon(icon: Icons.people_outline),
                    ListView.builder(
                      physics: const NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      itemCount: facultyList.length,
                      itemBuilder: (context, index) {
                        return IndividualFacultyWidget(
                            faculty: facultyList[index]);
                      },
                    ),
                  ],
                ),
              ));
  }
}

class IndividualFacultyWidget extends StatelessWidget {
  final IndividualFaculty faculty;
  const IndividualFacultyWidget({Key? key, required this.faculty})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    var boxClr = Theme.of(context).extension<MyColors>()!.boxColor;

    var _indivFacBoxDecoration = getTextBoxDecoration(
      boxClr!,
      borderRadius: 20.0,
      spreadRadius: 5,
      blurRadius: 4,
      offset: const Offset(0, 4),
    );
    return Padding(
      padding: const EdgeInsets.only(left: 25.0, right: 25.0, bottom: 15.0),
      child: Container(
        decoration: _indivFacBoxDecoration,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(20.0),
                child: Image.network(
                  faculty.img,
                  fit: BoxFit.fill,
                ),
              ),
              const Divider(
                thickness: 1,
              ),
              ListTile(
                title: Text(faculty.name),
                subtitle: Text(faculty.specializations),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
