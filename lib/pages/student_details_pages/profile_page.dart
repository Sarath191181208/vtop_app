import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../../apis/theme_manager.dart';
import '../Components/null_page.dart';
import '../Components/sized_icon.dart';
import '../Components/text_box_decoration.dart';
import '/Student/student_object.dart';

Color _textBoxfontColor = Colors.grey;
// Color _textBoxHeaderColor = Colors.black;

class ProfilePage extends StatelessWidget {
  final Profile? studentProfile;
  const ProfilePage({Key? key, required this.studentProfile}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    var _profileTiles = [
      const SizedIcon(icon: Icons.person),
      TextBox(header: "Student Name", text: studentProfile!.name),
      TextBox(header: "Roll No", text: studentProfile!.rollNumber),
      TextBox(header: "Branch", text: studentProfile!.branch),
      TextBox(header: "Proctor Name", text: studentProfile!.proctorName),
      TextBox(header: "Proctor Email", text: studentProfile!.proctorEmail),
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

  _copyText(BuildContext context) {
    {
      var snackBar = SnackBar(
        content: Text('$header Copied to Clipboard'),
        duration: const Duration(seconds: 1),
      );
      Clipboard.setData(ClipboardData(text: text)).then((value) =>
          ScaffoldMessenger.of(context)
              .showSnackBar(snackBar)); // -> show a notification
    }
  }

  _getFlexText() {
    return Row(
      children: [
        Flexible(
          child: Text(
            text,
            style: TextStyle(color: _textBoxfontColor),
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    var boxClr = Theme.of(context).extension<MyColors>()!.boxColor;
    return GestureDetector(
      onTap: () => _copyText(context),
      child: Container(
        decoration: getTextBoxDecoration(boxClr!),
        child: Padding(
          padding: const EdgeInsets.fromLTRB(12.0, 20.0, 12.0, 20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "$header :",
                style: const TextStyle(fontSize: 20.0),
              ),
              _getFlexText()
            ],
          ),
        ),
      ),
    );
  }
}
