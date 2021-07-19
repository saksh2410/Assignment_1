import 'package:flutter/material.dart';
import 'LoginText.dart';
import 'LoginForm.dart';

class FinalScreen extends StatelessWidget {
  final String id;
  FinalScreen({Key? key, required this.id}) : super(key: key);
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Final Screen'),
        ),
        body: Padding(
            padding: EdgeInsets.symmetric(vertical: 80, horizontal: 30),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                LoginText(),
                Expanded(
                    child: Container(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Text('welcomes you'),
                      Text(
                        id.toUpperCase(),
                        style: TextStyle(
                          fontSize: 30,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text('Have a great journey ahead !!')
                    ],
                  ),
                ))
              ],
            )));
  }
}
