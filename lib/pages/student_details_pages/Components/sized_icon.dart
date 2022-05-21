import 'package:flutter/material.dart';

class SizedIcon extends StatelessWidget {
  final IconData icon;
  final double? size;
  final Color? color;
  final String? text;

  const SizedIcon(
      {Key? key, required this.icon, this.size, this.color, this.text})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    Widget _icon = Row(mainAxisAlignment: MainAxisAlignment.center, children: [
      Icon(
        icon,
        color: (color == null) ? Theme.of(context).primaryColor : color,
        size: size?.toDouble() ?? 50.0,
      )
    ]);

    return Column(
      children: [
        const SizedBox(height: 250.0),
        _icon,
        const SizedBox(height: 30.0),
      ],
    );
  }
}
