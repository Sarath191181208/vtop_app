import 'package:flutter/material.dart';
import '../apis/storage/pref_student.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  _handleNavigate(BuildContext ctx) async {
    var stu = await PrefStudent.getStudent();
    if (stu == null) {
      Navigator.pushNamed(ctx, "/login");
      return;
    }
    Navigator.pushReplacementNamed(ctx, '/details', arguments: stu);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Row(
              children: [
                Expanded(
                  child: Text("Welcome !",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontSize: 45.0,
                          color: Theme.of(context).primaryColor)),
                ),
              ],
            ),
            const SizedBox(height: 50.0),
            TextButton(
              style: TextButton.styleFrom(
                backgroundColor: Theme.of(context).primaryColor,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(50.0),
                ),
                elevation: 10.0,
              ),
              child: const Padding(
                padding: EdgeInsets.only(left: 20.0, right: 20.0),
                child: Icon(
                  Icons.arrow_right_alt_rounded,
                  size: 30.0,
                  color: Colors.white,
                ),
              ),
              onPressed: () => _handleNavigate(context),
            ),
          ],
        ),
      ),
    );
  }
}
