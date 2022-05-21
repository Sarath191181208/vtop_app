import 'package:flutter/material.dart';

class NullPage extends StatelessWidget {
  final String errorMsg;
  const NullPage({Key? key, required this.errorMsg}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(
              Icons.error,
              color: Colors.red,
              size: 50.00,
            ),
            Text(errorMsg),
          ],
        ),
      ),
    );
  }
}
