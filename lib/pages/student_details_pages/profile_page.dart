import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:vtop_app/StudentObject.dart';
import 'package:vtop_app/pages/student_details_pages/Components/sized_icon.dart';

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

  @override
  Widget build(BuildContext context) {
    final logoutButton = Container(
        decoration: textBoxDecoration,
        child: Padding(
          padding: const EdgeInsets.fromLTRB(12.0, 10.0, 12.0, 10.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextButton(
                onPressed: () => _logout(context),
                child: Row(
                  children: const [
                    Text(
                      'Logout',
                      style: TextStyle(
                        color: Colors.red,
                        fontSize: 16.0,
                      ),
                    ),
                    SizedBox(width: 10.0),
                    Icon(
                      Icons.exit_to_app,
                      color: Colors.red,
                      size: 20.0,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ));

    // render null if studentProfile is null
    return ((studentProfile == null)
        ? const NullPage(
            errorMsg:
                "Error Can't seem to find the profile details try re-logging")
        : Scaffold(
            body: SingleChildScrollView(
              child: Column(
                children: [
                  const SizedIcon(icon: Icons.person),
                  TextBox(
                    header: "Student Name",
                    text: studentProfile!.name,
                  ),
                  TextBox(
                    header: "Roll No",
                    text: studentProfile!.rollNumber,
                  ),
                  TextBox(
                    header: "Branch",
                    text: studentProfile!.branch,
                  ),
                  TextBox(
                    header: "Proctor Name",
                    text: studentProfile!.proctorName,
                  ),
                  TextBox(
                    header: "Proctor Email",
                    text: studentProfile!.proctorEmail,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                        left: 15.0, right: 15.0, bottom: 10.0),
                    child: logoutButton,
                  ),
                ],
              ),
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
    return Padding(
      padding: const EdgeInsets.only(left: 15.0, right: 15.0, bottom: 15.0),
      child: Container(
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
      ),
    );
  }
}
