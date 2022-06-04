import 'package:flutter/material.dart';

bottomNavWithBackButton(BuildContext context, Widget child) => BottomAppBar(
      color: Theme.of(context).primaryColor,
      child: child,
    );
