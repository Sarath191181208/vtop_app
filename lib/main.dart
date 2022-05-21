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
        primaryColor: Color.fromARGB(255, 243, 33, 138),
        progressIndicatorTheme: const ProgressIndicatorThemeData(
          color: Color.fromARGB(255, 243, 33, 138),
          circularTrackColor: Color.fromARGB(255, 205, 205, 205),
        ),
      ),
      initialRoute: '/login',
      onGenerateRoute: RouteGenerator.generateRoute,
    );
  }
}
