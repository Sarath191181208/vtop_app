import 'package:flutter/material.dart';

BoxDecoration getTextBoxDecoration(
  Color textBoxBgColor, {
  double borderRadius = 5.0,
  double spreadRadius = 2.0,
  double blurRadius = 2.0,
  Offset offset = const Offset(0, 2),
}) {
  return BoxDecoration(
    color: textBoxBgColor,
    borderRadius: BorderRadius.circular(borderRadius),
    boxShadow: [
      BoxShadow(
        color: Colors.black.withOpacity(0.05),
        spreadRadius: spreadRadius,
        blurRadius: blurRadius,
        offset: offset, // changes position of shadow
      ),
    ],
  );
}
