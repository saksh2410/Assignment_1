import 'package:flutter/material.dart';
import 'RegistrationForm.dart';

class RegistrationScreen extends StatelessWidget {
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          title: Text('Registration Page'),
        ),
        body: SingleChildScrollView(
            child: Container(
                padding: const EdgeInsets.all(30), child: RegistrationForm())));
  }
}
