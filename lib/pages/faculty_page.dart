import 'package:flutter/material.dart';
import 'package:vtop_app/pages/Components/null_page.dart';

import '../apis/theme_manager.dart';
import '../faculty/faculty_object.dart';
import 'Components/bottom_nav_with_back_button.dart';
import 'Components/sized_icon.dart';
import 'Components/text_box_decoration.dart';

class FacultyPage extends StatelessWidget {
  final List<IndividualFaculty> facultyList;
  const FacultyPage({Key? key, required this.facultyList}) : super(key: key);

  Widget _backButton(context) => TextButton(
        onPressed: () => Navigator.pushNamed(context, '/'),
        child: const Icon(
          Icons.arrow_back,
          color: Colors.white,
        ),
      );

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
                  FacListAndSearch(allFacultyList: facultyList),
                ],
              ),
            ),
      bottomNavigationBar:
          bottomNavWithBackButton(context, _backButton(context)),
    );
  }
}

class FacListAndSearch extends StatefulWidget {
  final List<IndividualFaculty> allFacultyList;
  const FacListAndSearch({Key? key, required this.allFacultyList})
      : super(key: key);

  @override
  State<FacListAndSearch> createState() => _FacListAndSearchState();
}

class _FacListAndSearchState extends State<FacListAndSearch> {
  List<IndividualFaculty> _foundFacultyList = [];

  @override
  void initState() {
    _foundFacultyList = widget.allFacultyList;
    super.initState();
  }

  void _filter(String enteredKeyword) {
    List<IndividualFaculty> results = [];
    if (enteredKeyword.isEmpty) {
      results = widget.allFacultyList;
    } else {
      results = widget.allFacultyList
          .where((fac) =>
              fac.name.toLowerCase().contains(enteredKeyword.toLowerCase()))
          .toList();
    }

    // Refresh the UI
    setState(() {
      _foundFacultyList = results;
    });
  }

  @override
  Widget build(BuildContext context) {
    Widget _searchBar = Padding(
        padding: const EdgeInsets.only(left: 20.0, right: 20.0),
        child: TextField(
          onChanged: (value) => _filter(value),
          decoration: InputDecoration(
            hintText: "Search for faculty",
            labelText: 'Search',
            hintStyle:
                const TextStyle(color: Color.fromRGBO(180, 180, 180, 0.6)),
            labelStyle: const TextStyle(color: Colors.grey),
            suffixIcon: Icon(
              Icons.search,
              color: Theme.of(context).primaryColor,
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(32.0),
              borderSide: BorderSide(color: Theme.of(context).primaryColor),
            ),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(32.0),
            ),
            contentPadding: const EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
          ),
        ));

    Widget _noResultsText = const Text(
      'No results found',
      style: TextStyle(fontSize: 24),
    );

    return Column(
      children: [
        _searchBar,
        const SizedBox(height: 20),
        (_foundFacultyList.isEmpty)
            ? _noResultsText
            : ListView.builder(
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemCount: _foundFacultyList.length,
                itemBuilder: (context, index) {
                  return IndividualFacultyWidget(
                      faculty: _foundFacultyList[index]);
                },
              ),
      ],
    );
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
              const SizedBox(height: 10),
              const Divider(
                thickness: 2,
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
