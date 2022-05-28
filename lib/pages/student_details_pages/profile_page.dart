import 'package:flutter/material.dart';
import 'package:vtop_app/Student/pref_student.dart';
import 'package:vtop_app/Student/student_object.dart';
import 'package:vtop_app/pages/student_details_pages/Components/sized_icon.dart';

import '../../Student/fetch_student_details.dart';
import '../dialogs.dart';
import 'Components/null_page.dart';
import 'Components/text_box_decoration.dart';

Color _textBoxfontColor = const Color.fromRGBO(172, 172, 172, 1);
Color _textBoxHeaderColor = Colors.black;

class ProfilePage extends StatelessWidget {
  final Profile? studentProfile;
  const ProfilePage({Key? key, required this.studentProfile}) : super(key: key);

  _logout(context) {
    Navigator.of(context)
        .pushNamedAndRemoveUntil('/login', (Route<dynamic> route) => false);
  }

  _update(context) async {
    showLoaderDialog(context);
    List<String> details = await PrefStudent.getLoginCredentials();

    String username = details[0];
    String password = details[1];

    Student? stu = await fetchStudentDetails(username, password);
    // taking the loading animation off
    Navigator.pop(context);

    if (stu == null) {
      showErrorDialog(context, "Try again !");
      // Navigator.pop(ctx);
    } else {
      Navigator.pushReplacementNamed(context, '/details', arguments: stu);
    }
  }

  @override
  Widget build(BuildContext context) {
    var _logoutButton = BoxButton(
      onPressHandler: () => _logout(context),
      text: 'Logout',
      color: Colors.red,
      icon: Icons.exit_to_app,
    );

    var _updateButton = BoxButton(
        onPressHandler: () => _update(context),
        text: "Update",
        color: const Color.fromRGBO(219, 197, 0, 1),
        icon: Icons.update_rounded);

    var _profileTiles = [
      const SizedIcon(icon: Icons.person),
      TextBox(header: "Student Name", text: studentProfile!.name),
      TextBox(header: "Roll No", text: studentProfile!.rollNumber),
      TextBox(header: "Branch", text: studentProfile!.branch),
      TextBox(header: "Proctor Name", text: studentProfile!.proctorName),
      TextBox(header: "Proctor Email", text: studentProfile!.proctorEmail),
      _updateButton,
      _logoutButton,
    ];

    // render null if studentProfile is null
    return ((studentProfile == null)
        ? const NullPage(
            errorMsg:
                "Error Can't seem to find the profile details try re-logging")
        : Scaffold(
            body: SingleChildScrollView(
              child: Column(children: [
                for (var tile in _profileTiles)
                  Padding(
                    padding: const EdgeInsets.only(
                        left: 15.0, right: 15.0, bottom: 10.0),
                    child: tile,
                  ),
              ]),
            ),
          ));
  }
}

class TextBox extends StatelessWidget {
  final String header;
  final String text;
  const TextBox({Key? key, required this.header, required this.text})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: textBoxDecoration,
      child: Padding(
        padding: const EdgeInsets.fromLTRB(12.0, 20.0, 12.0, 20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "$header :",
              style: TextStyle(color: _textBoxHeaderColor, fontSize: 20.0),
            ),
            // const SizedBox(height: 10.0),
            Row(
              children: [
                Flexible(
                  child: Text(
                    text,
                    style: TextStyle(color: _textBoxfontColor),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class BoxButton extends StatelessWidget {
  final Function onPressHandler;
  final String text;
  final IconData? icon;
  final Color color;
  const BoxButton({
    Key? key,
    required this.onPressHandler,
    required this.text,
    required this.color,
    required this.icon,
  }) : super(key: key);

  _runFunction() {
    onPressHandler();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: textBoxDecoration,
        child: Padding(
          padding: const EdgeInsets.fromLTRB(12.0, 10.0, 12.0, 10.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextButton(
                onPressed: _runFunction,
                child: Row(
                  children: [
                    Text(
                      text,
                      style: TextStyle(
                        color: color,
                        fontSize: 16.0,
                      ),
                    ),
                    const SizedBox(width: 10.0),
                    (icon == null)
                        ? const SizedBox(width: 0.0)
                        : Icon(
                            icon,
                            color: color,
                            size: 20.0,
                          ),
                  ],
                ),
              ),
            ],
          ),
        ));
  }
}
