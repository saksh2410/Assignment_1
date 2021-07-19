import 'package:flutter/material.dart';
import 'LoginText.dart';
import 'RegistrationScreen.dart';
import 'FinalScreen.dart';

class LoginForm extends StatefulWidget {
  @override
  _LoginFormState createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  final _formKey = GlobalKey<FormState>();
  String bitsid = '';
  @override
  Widget build(BuildContext context) {
    return Form(
        key: _formKey,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Center(child: LoginText()),
            Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Text(
                  'ID Number',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 7),
                TextFormField(
                  validator: (value) {
                    if (value == null || value.length != 13)
                      return 'please enter valid ID';
                  },
                  onSaved: (val) => setState(() {
                    if (val != null) {
                      bitsid = val;
                    }
                  }),
                  decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      hintText: 'Please Enter your BITS ID Number'),
                ),
                SizedBox(height: 18),
                Text(
                  'Password',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 7),
                TextFormField(
                  validator: (value) {
                    if (value == null || value.length < 5)
                      return 'Password must contain at least 5 chars';
                  },
                  obscureText: true,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: 'Please Enter your Password',
                  ),
                ),
              ],
            ),
            ElevatedButton(
              onPressed: () {
                final form = _formKey.currentState;
                if (form != null) {
                  if (form.validate()) {
                    form.save();

                    Navigator.push(
                        context,
                        new MaterialPageRoute(
                            builder: (context) => FinalScreen(
                                  id: bitsid,
                                )));
                  }
                }
              },
              child: Text('LOG IN', style: TextStyle(fontSize: 20)),
              style: ElevatedButton.styleFrom(
                  primary: Color(0xff2FC4B2),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10))),
            ),
            Row(children: [
              Text('Don\'t have an account'),
              TextButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      new MaterialPageRoute(
                          builder: (context) => RegistrationScreen()));
                },
                child: Text('Register'),
              ),
            ])
          ],
        ));
  }
}
