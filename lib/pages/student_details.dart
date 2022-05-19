import 'package:flutter/material.dart';

import '../StudentObject.dart';

class DetailsPage extends StatefulWidget {
  final Student studentDetails;
  const DetailsPage({Key? key, required this.studentDetails}) : super(key: key);
  @override
  State<DetailsPage> createState() => _DetailsPageState();
}

class _DetailsPageState extends State<DetailsPage> {
  @override
  Widget build(BuildContext context) {
    print(widget.studentDetails);

    return Scaffold(
      body: Center(
        child: Text(widget.studentDetails.profile.name),
      ),
    );
  }
}
