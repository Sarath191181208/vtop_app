import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final String text;
  final Function onPressed;
  final IconData icon;
  const CustomButton(
      {Key? key,
      required this.text,
      required this.onPressed,
      required this.icon})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        TextButton(
            style: TextButton.styleFrom(
              backgroundColor: Theme.of(context).primaryColor,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(30.0),
              ),
            ),
            onPressed: () => onPressed(),
            // onPressed: () => Navigator.pushReplacementNamed(context, '/details',
            //     arguments: get_student_obj()),
            child: Padding(
              padding: const EdgeInsets.fromLTRB(20.0, 3.0, 20.0, 3.0),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    text,
                    textAlign: TextAlign.start,
                    style: const TextStyle(color: Colors.white),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 8.0),
                    child: Icon(
                      icon,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            )),
      ],
    );
  }
}
