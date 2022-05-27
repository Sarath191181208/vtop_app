import 'package:flutter/material.dart';
import 'pages/login_page.dart';
import 'pages_router.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primaryColor: const Color.fromRGBO(243, 33, 138, 1),
        // cursorColor: ,
        textSelectionTheme: const TextSelectionThemeData(
          cursorColor: Color.fromRGBO(243, 33, 138, 1),
        ),
        progressIndicatorTheme: const ProgressIndicatorThemeData(
          color: Color.fromRGBO(243, 33, 138, 1),
          circularTrackColor: Color.fromRGBO(205, 205, 205, 1),
        ),
      ),
      initialRoute: '/login',
      onGenerateRoute: RouteGenerator.generateRoute,
    );
  }
}
