import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../Student/fetch_student_details.dart';
import '../../Student/student_object.dart';
import '../../apis/notification_service.dart';
import '../../apis/storage/pref_student.dart';
import '../../apis/theme_manager.dart';
import '../Components/sized_icon.dart';
import '../Components/text_box_decoration.dart';
import '../dialogs.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({Key? key}) : super(key: key);
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

    var _changeThemeButton = Consumer<ThemeNotifier>(
      builder: (context, notifier, child) => BoxButton(
        onPressHandler: () => notifier.toggleTheme(),
        text: 'Change Theme',
        color: Colors.blue,
        icon: Icons.brightness_3,
      ),
    );

    var _notifButton = BoxButton(
      onPressHandler: () => NotificationService().showNotification(),
      text: "Test Notification",
      color: Colors.deepOrange,
      icon: Icons.notifications_active,
    );

    var _actionButtons = [
      _logoutButton,
      _updateButton,
      _changeThemeButton,
      _notifButton,
    ];

    return Scaffold(
      body: SingleChildScrollView(
        child: Column(children: [
          const SizedIcon(icon: Icons.settings_rounded),
          for (var tile in _actionButtons)
            Padding(
              padding:
                  const EdgeInsets.only(left: 15.0, right: 15.0, bottom: 10.0),
              child: tile,
            ),
        ]),
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
    var boxClr = Theme.of(context).extension<MyColors>()!.boxColor;

    return GestureDetector(
      onTap: _runFunction,
      child: Container(
          decoration: getTextBoxDecoration(boxClr!),
          child: Padding(
            padding: const EdgeInsets.fromLTRB(12.0, 18.0, 12.0, 18.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
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
          )),
    );
  }
}
