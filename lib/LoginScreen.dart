import 'package:flutter/material.dart';
import 'LoginForm.dart';

class LoginScreen extends StatelessWidget {
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          title: Text('Login Page'),
        ),
        body: Container(padding: const EdgeInsets.all(30), child: LoginForm()));
  }
}
