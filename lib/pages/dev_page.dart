// Copyright (c) 2019, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

import 'package:flutter/material.dart';

class DevPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  final String title;

  const MyHomePage({
    Key? key,
    required this.title,
  }) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: const Center(
        child: TimeTableCard(
          title: "Operating Systems",
          slot: "Tc1",
          room: "416-AB1",
          time: "9:00 - 9:50 AM",
          label: "Present",
        ),
      ),
    );
  }
}

class TimeTableCard extends StatelessWidget {
  final String title;
  final String slot;
  final String room;
  final String time;
  final String label;

  const TimeTableCard(
      {Key? key,
      required this.title,
      required this.slot,
      required this.room,
      required this.time,
      required this.label})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    double windowWidth = MediaQuery.of(context).size.width;
    var boxWidth = windowWidth * 0.8;

    return Container(
      width: boxWidth,
      decoration: const BoxDecoration(
          gradient: LinearGradient(
        begin: Alignment.topRight,
        end: Alignment.bottomLeft,
        colors: [
          Colors.blue,
          Colors.red,
        ],
      )),
      child: AspectRatio(
        aspectRatio: 2.5,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Flexible(child: Text(label)),
            Expanded(
              child: RichText(
                  text: TextSpan(
                      children: [TextSpan(text: title), TextSpan(text: slot)])),
            ),
            Flexible(
              child: Text(time),
            )
          ],
        ),
      ),
    );
  }
}
