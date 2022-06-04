import 'package:flutter/material.dart';

class SizedIcon extends StatelessWidget {
  final IconData icon;
  final double? size;
  final Color? color;
  final String? text;

  final double? upperSpacingSize;

  const SizedIcon(
      {Key? key,
      required this.icon,
      this.size,
      this.color,
      this.text,
      this.upperSpacingSize})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    Widget _icon = Row(mainAxisAlignment: MainAxisAlignment.center, children: [
      Icon(
        icon,
        color: color ?? Theme.of(context).primaryColor,
        size: size?.toDouble() ?? 50.0,
      )
    ]);
    double windowHeight = MediaQuery.of(context).size.height;

    return Column(
      children: [
        SizedBox(
          height: upperSpacingSize ?? (windowHeight * 0.4),
        ),
        _icon,
        Text(
          text ?? '',
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: size?.toDouble() ?? 20.0,
            color: color ?? Theme.of(context).primaryColor,
          ),
        ),
        const SizedBox(height: 30.0),
      ],
    );
  }
}
