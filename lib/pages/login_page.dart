import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';

import 'package:vtop_app/pages/dialogs.dart';
import 'package:vtop_app/test.dart';
import '../StudentObject.dart';

// function to get the Student details
Future<Student?> _getStudent(String username, String password) async {
  //return null if the response took too long

  var response = await http.post(
      Uri.parse("https://vtop-api.herokuapp.com/api/v1/alldetails"),
      headers: {},
      body: {
        'username': username,
        'password': password
      }).catchError((error) => print("Error $error"));
  print("response code ${response.statusCode}");

  if (response.statusCode == 200) {
    var jsonResponse = json.decode(response.body);
    return Student.fromJson(jsonResponse);
  } else {
    return null;
  }
}

class LoginPage extends StatelessWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: LoginScreen(),
    );
  }
}

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);
  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  _validateForm() {
    final FormState? form = _formKey.currentState;
    if (form == null || !form.validate()) {
      return false;
    }
    print("email: " + _emailController.text);
    print("passwd: " + _passwordController.text);
    return true;
  }

  _handleLoginPress(BuildContext ctx) {
    if (_validateForm()) {
      showLoaderDialog(ctx);
      Future<Student?> stu =
          _getStudent(_emailController.text, _passwordController.text);
      stu.then((stu) {
        // taking the loading animation off
        Navigator.pop(ctx);

        if (stu == null) {
          showErrorDialog(ctx, "Try again !");
          // Navigator.pop(ctx);
        } else {
          Navigator.pushReplacementNamed(context, '/details', arguments: stu);
        }
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    //## login button ##
    final loginButton = Row(
      children: [
        TextButton(
            style: TextButton.styleFrom(
              backgroundColor: Theme.of(context).primaryColor,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(30.0),
              ),
            ),
            onPressed: () => _handleLoginPress(context),
            // onPressed: () => Navigator.pushReplacementNamed(context, '/details',
            //     arguments: get_student_obj()),
            child: Padding(
              padding: const EdgeInsets.fromLTRB(20.0, 3.0, 20.0, 3.0),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: const [
                  Text(
                    "LOGIN",
                    textAlign: TextAlign.start,
                    style: TextStyle(color: Colors.white),
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 8.0),
                    child: Icon(
                      Icons.arrow_right_alt_rounded,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            )),
      ],
    );

    // reutrning login screen
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          const LoginText(),

          //## Login form ##
          Padding(
            padding: const EdgeInsets.only(top: 50.0),
            child: LoginForm(
                formKey: _formKey,
                emailController: _emailController,
                passwordController: _passwordController),
          ),

          //## Login Button ##
          Padding(
            padding: const EdgeInsets.only(top: 30.0),
            child: loginButton,
          ),
        ]),
      ),
    );
  }
}

class LoginText extends StatelessWidget {
  const LoginText({Key? key}) : super(key: key);
  final double fontSize = 20.0;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        // ## user icon ##
        Padding(
          padding: const EdgeInsets.only(right: 10.0),
          child: Icon(
            Icons.account_circle,
            color: Theme.of(context).primaryColor,
            size: fontSize + 8.00,
          ),
        ),

        // ## Login Text ##
        Text("Login To VTOP",
            style: TextStyle(
              fontSize: fontSize,
            )),
      ],
    );
  }
}

class LoginForm extends StatefulWidget {
  final GlobalKey<FormState> formKey;
  final TextEditingController emailController;
  final TextEditingController passwordController;

  const LoginForm(
      {Key? key,
      required this.formKey,
      required this.emailController,
      required this.passwordController})
      : super(key: key);

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  bool _showPassword = false;

  String? _passwordValidation(String? value) {
    if (value == null || value.isEmpty) {
      return "Field Can't be empty.";
    } else if (value.length < 6) {
      return "Password must be of six characters long.";
    }
    return null;
  }

  String? _checkValidEmail(String? value) {
    try {
      if (value == null || value.isEmpty) {
        return "Field Can't be empty.";
      }
    } catch (e) {
      return "Email is not valid.";
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    // ## Email Input ##
    final emailInput = TextFormField(
      controller: widget.emailController,
      validator: _checkValidEmail,
      decoration: InputDecoration(
        hintText: "21bce111",
        labelText: "VTOP User Name",
        contentPadding: const EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(32.0)),
      ),
      autofocus: true,
    );

    // ## Password Input ##
    final passwordInput = TextFormField(
      controller: widget.passwordController,
      obscureText: !_showPassword,
      validator: _passwordValidation,
      decoration: InputDecoration(
          hintText: "password",
          labelText: "Password",
          contentPadding: const EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(32.0)),
          suffixIcon: IconButton(
              onPressed: () {
                setState(() {
                  _showPassword = !_showPassword;
                });
              },
              icon: Icon(
                _showPassword ? Icons.visibility : Icons.visibility_off,
              ))),
      autofocus: true,
    );

    // returing.... the form
    return Form(
        key: widget.formKey,
        child: Column(
          children: [
            Padding(
                padding: const EdgeInsets.only(bottom: 20.0),
                child: emailInput),
            passwordInput
          ],
        ));
  }
}
