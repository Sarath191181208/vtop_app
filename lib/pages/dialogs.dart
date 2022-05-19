import 'package:flutter/material.dart';

showLoaderDialog(BuildContext context) {
  String loadingText = "Hang on tight ...";

  AlertDialog alert = AlertDialog(
    content: Container(
      padding: const EdgeInsets.all(16),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const CircularProgressIndicator(),
          const SizedBox(height: 16),
          Text(loadingText)
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
