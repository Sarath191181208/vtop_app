import 'package:flutter/material.dart';

import '../../Student/student_object.dart';

darkenColor(Color color, [int percent = 10]) {
  assert(1 <= percent && percent <= 100);
  final f = 1 - percent / 100;
  return Color.fromARGB(
    color.alpha,
    (color.red * f).round(),
    (color.green * f).round(),
    (color.blue * f).round(),
  );
}

class TimeTableSlotCard extends StatelessWidget {
  final String status;
  final TimeSlot timeSlot;
  const TimeTableSlotCard({
    Key? key,
    required this.timeSlot,
    required this.status,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Color primaryColor = Theme.of(context).primaryColor;
    Color primaryColorDarker = darkenColor(primaryColor, 10);

    LinearGradient cardBoxGradient = LinearGradient(
      colors: [primaryColor, primaryColorDarker],
      stops: const [0, 1],
      begin: const AlignmentDirectional(0.79, -1),
      end: const AlignmentDirectional(-0.79, 1),
    );

    return Container(
      constraints: const BoxConstraints(maxWidth: 400),
      decoration: BoxDecoration(
        boxShadow: const [
          BoxShadow(
            blurRadius: 6,
            color: Color(0x4B1A1F24),
            offset: Offset(0, 2),
          )
        ],
        gradient: cardBoxGradient,
        borderRadius: BorderRadius.circular(8),
        shape: BoxShape.rectangle,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                StatusInfoWidget(status: status),
                const SizedBox(height: 10),
                CourseInfoWidget(timeSlot: timeSlot),
                const SizedBox(height: 12),
                Text(timeSlot.classRoom,
                    style: const TextStyle(color: Colors.white, fontSize: 14)),
              ],
            ),
          ),
          const Spacer(),
          TimeInfoWidget(
              classDuration: "${timeSlot.startTime} - ${timeSlot.endTime}"),
        ],
      ),
    );
  }
}

class CourseInfoWidget extends StatelessWidget {
  const CourseInfoWidget({
    Key? key,
    required this.timeSlot,
  }) : super(key: key);

  final TimeSlot timeSlot;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Flexible(
          child: Text(
            timeSlot.courseName,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 20,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
        const SizedBox(width: 10),
        Text(
          timeSlot.slot,
          style: const TextStyle(
            color: Colors.white70,
            fontSize: 13,
            fontWeight: FontWeight.w600,
          ),
        ),
      ],
    );
  }
}

class TimeInfoWidget extends StatelessWidget {
  const TimeInfoWidget({
    Key? key,
    required this.classDuration,
  }) : super(key: key);

  final String classDuration;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 50,
      decoration: const BoxDecoration(
        color: Color(0xFF191B1F),
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(8),
          bottomRight: Radius.circular(8),
        ),
      ),
      alignment: const AlignmentDirectional(-0.85, 0),
      child: Text(classDuration, style: const TextStyle(color: Colors.white)),
    );
  }
}

class StatusInfoWidget extends StatelessWidget {
  const StatusInfoWidget({
    Key? key,
    required this.status,
  }) : super(key: key);

  final String status;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 69,
      height: 30,
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(7),
          bottomRight: Radius.circular(7),
          topLeft: Radius.circular(0),
          topRight: Radius.circular(0),
        ),
        shape: BoxShape.rectangle,
      ),
      child: Align(
        alignment: const AlignmentDirectional(0.1, 0),
        child: Text(
          status,
          style: const TextStyle(
            color: Color(0xFF1A1F24),
            fontSize: 12,
            fontWeight: FontWeight.w500,
            fontStyle: FontStyle.normal,
            letterSpacing: 0,
          ),
        ),
      ),
    );
  }
}
