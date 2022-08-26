import 'package:flutter/material.dart';

bottomNavWithHomeButton(BuildContext context) => BottomAppBar(
      color: Theme.of(context).primaryColor,
      child: TextButton(
        onPressed: () => Navigator.pushNamed(context, '/'),
        child: const Icon(
          Icons.home_rounded,
          color: Colors.white,
        ),
      ),
    );
