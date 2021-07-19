import 'package:flutter/material.dart';

class LoginText extends StatelessWidget {
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          'CRUX FLUTTER',
          style: TextStyle(
              color: Color(0xff2FC4B2),
              fontSize: 30,
              fontWeight: FontWeight.bold),
        ),
        Text(
          'SUMMER GROUP',
          style: TextStyle(
              color: Color(0xff2FC4B2),
              fontSize: 30,
              fontWeight: FontWeight.bold),
        )
      ],
    );
  }
}
