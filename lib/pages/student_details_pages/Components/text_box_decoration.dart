import 'package:flutter/material.dart';

Color _textBoxBgColor = const Color.fromRGBO(255, 255, 255, 1);

BoxDecoration textBoxDecoration = BoxDecoration(
  color: _textBoxBgColor,
  borderRadius: BorderRadius.circular(5.0),
  boxShadow: [
    BoxShadow(
      color: Colors.black.withOpacity(0.1),
      spreadRadius: 5,
      blurRadius: 20,
      offset: const Offset(0, 0), // changes position of shadow
    ),
  ],
);
