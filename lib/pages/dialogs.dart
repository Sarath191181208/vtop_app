import 'dart:async';

import 'package:flutter/material.dart';

showLoaderDialog(BuildContext context) {
  List<String> _texts = [
    'Loading...',
    "Fetching data...",
    "Hand on Tight",
    "Almost There !",
  ];

  Stream<String> textStream() async* {
    for (var i = 0; i < _texts.length; i++) {
      yield _texts[i];
      await Future.delayed(const Duration(seconds: 5));
    }
  }

  AlertDialog alert = AlertDialog(
    content: Container(
      padding: const EdgeInsets.all(16),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const CircularProgressIndicator(),
          const SizedBox(height: 16),
          StreamBuilder<String>(
              stream: textStream(),
              builder: (context, snapshot) {
                return Text(snapshot.data.toString());
              }),
        ],
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
      ),
    ),
  );

  showDialog(
    barrierDismissible: false,
    context: context,
    builder: (BuildContext context) {
      return alert;
    },
  );
}

showErrorDialog(BuildContext context, String errorText) {
  AlertDialog alert = AlertDialog(
    content: SizedBox(
      width: 100.0,
      height: 100.0,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Icon(
                Icons.error,
                color: Colors.red,
                size: 50.00,
              ),
              Text(errorText),
            ],
          ),
        ],
      ),
    ),
  );

  showDialog(
    barrierDismissible: true,
    context: context,
    builder: (BuildContext context) {
      return alert;
    },
  );
}
