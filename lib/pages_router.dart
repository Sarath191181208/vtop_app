// build a basic router

import 'package:flutter/material.dart';
import 'package:vtop_app/pages/home.dart';

import 'Student/student_object.dart';
import '/pages/login_page.dart';
import 'pages/student_details.dart';

class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    final args = settings.arguments;
    switch (settings.name) {
      case '/':
        return MaterialPageRoute(builder: (_) => const HomePage());
      case '/login':
        return MaterialPageRoute(builder: (_) => const LoginPage());
      case '/details':
        if (args is Student) {
          return MaterialPageRoute(
              builder: (_) => DetailsPage(
                    studentDetails: args,
                  ));
        } else {
          return MaterialPageRoute(
              builder: (_) => ErrorPage(
                  errorMsg: "The arg in /details must be of type Student",
                  routeName: settings.name));
        }
      default:
        return MaterialPageRoute(
            builder: (_) => ErrorPage(
                errorMsg: "This paths isn't defined",
                routeName: settings.name));
    }
  }
}

class ErrorPage extends StatelessWidget {
  final String? routeName;
  final String errorMsg;
  const ErrorPage({Key? key, required this.routeName, required this.errorMsg})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text("msg : $errorMsg, route: $routeName"),
      ),
    );
  }
}
