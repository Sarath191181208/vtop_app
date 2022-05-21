import 'package:flutter/material.dart';

Color _textBoxBgColor = const Color.fromRGBO(255, 255, 255, 1);

BoxDecoration textBoxDecoration = BoxDecoration(
  color: _textBoxBgColor,
  borderRadius: BorderRadius.circular(5.0),
  boxShadow: [
    BoxShadow(
      color: Colors.black.withOpacity(0.05),
      spreadRadius: 2,
      blurRadius: 2,
      offset: const Offset(0, 2), // changes position of shadow
    ),
  ],
);
