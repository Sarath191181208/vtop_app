import 'package:flutter/material.dart';
import 'dart:async';

import '/pages/dialogs.dart';
import '../Student/fetch_student_details.dart';
import '../Student/student_object.dart';

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
  final TextEditingController _userNameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  void dispose() {
    _userNameController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  _validateForm() {
    final FormState? form = _formKey.currentState;
    if (form == null || !form.validate()) {
      return false;
    }
    return true;
  }

  _handleLoginPress(BuildContext ctx) {
    if (_validateForm()) {
      showLoaderDialog(ctx);
      Future<Student?> stu = fetchStudentDetails(
          _userNameController.text, _passwordController.text);
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
    final _loginButton = CustomButton(
      text: "LOGIN",
      onPressed: () => _handleLoginPress(context),
      icon: Icons.arrow_right_alt_rounded,
    );

    final _homeButton = CustomButton(
      text: "HOME",
      onPressed: () => Navigator.pushReplacementNamed(context, '/'),
      icon: Icons.home_rounded,
    );

    // reutrning login screen
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          const LoginText(),

          //## Login form ##
          const SizedBox(height: 50.0),
          LoginForm(
              formKey: _formKey,
              emailController: _userNameController,
              passwordController: _passwordController),

          const SizedBox(height: 20.0),
          _loginButton,

          const SizedBox(height: 10.0),
          _homeButton,
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
        hintText: "21BCE111",
        hintStyle: const TextStyle(color: Color.fromRGBO(180, 180, 180, 0.6)),
        labelText: "VTOP User Name",
        labelStyle: const TextStyle(
          color: Colors.grey,
        ),
        prefixIcon: Icon(
          Icons.account_circle,
          color: Theme.of(context).primaryColor,
        ),
        // change the focus border color
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(32.0),
          borderSide: BorderSide(color: Theme.of(context).primaryColor),
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(32.0),
        ),
        contentPadding: const EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
      ),
      autofocus: true,
    );

    // ## Password Input ##
    final passwordInput = TextFormField(
      controller: widget.passwordController,
      obscureText: !_showPassword,
      validator: _passwordValidation,
      decoration: InputDecoration(
          hintText: "123456",
          hintStyle: const TextStyle(color: Color.fromRGBO(180, 180, 180, 0.6)),
          labelText: "Password",
          labelStyle: const TextStyle(
            color: Colors.grey,
          ),
          prefixIcon: Icon(
            Icons.lock,
            color: Theme.of(context).primaryColor,
          ),
          contentPadding: const EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(32.0),
            borderSide: BorderSide(color: Theme.of(context).primaryColor),
          ),
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(32.0)),
          suffixIcon: IconButton(
              onPressed: () {
                setState(() {
                  _showPassword = !_showPassword;
                });
              },
              icon: Icon(
                _showPassword ? Icons.visibility : Icons.visibility_off,
                color: _showPassword
                    ? Theme.of(context).primaryColor
                    : Colors.grey,
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

class CustomButton extends StatelessWidget {
  final String text;
  final Function onPressed;
  final IconData icon;
  const CustomButton(
      {Key? key,
      required this.text,
      required this.onPressed,
      required this.icon})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        TextButton(
            style: TextButton.styleFrom(
              backgroundColor: Theme.of(context).primaryColor,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(30.0),
              ),
            ),
            onPressed: () => onPressed(),
            // onPressed: () => Navigator.pushReplacementNamed(context, '/details',
            //     arguments: get_student_obj()),
            child: Padding(
              padding: const EdgeInsets.fromLTRB(20.0, 3.0, 20.0, 3.0),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    text,
                    textAlign: TextAlign.start,
                    style: const TextStyle(color: Colors.white),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 8.0),
                    child: Icon(
                      icon,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            )),
      ],
    );
  }
}
