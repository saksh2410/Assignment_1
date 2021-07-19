import 'package:assignment220202143/LoginScreen.dart';
import 'package:flutter/material.dart';
import 'FinalScreen.dart';
import 'LoginScreen.dart';

class RegistrationForm extends StatefulWidget {
  @override
  _RegistrationFormState createState() => _RegistrationFormState();
}

class _RegistrationFormState extends State<RegistrationForm> {
  final _formKey = GlobalKey<FormState>();
  String bitsid = '';
  var batchyearlist = ['2020', '2019', '2018', '2017'];
  String _batchyear = '2020';
  bool _updates = false;
  int radiovalue = 0;
  @override
  Widget build(BuildContext context) {
    return Form(
        key: _formKey,
        child: Column(children: [
          Container(
            height: 60,
            color: Color(0xff2FC4B2),
            child: (Center(
              child: Text(
                'CRUX FLUTTER SUMMER GROUP',
                style: TextStyle(
                    fontSize: 20,
                    color: Colors.white,
                    fontWeight: FontWeight.bold),
                textAlign: TextAlign.center,
              ),
            )),
          ),
          SizedBox(height: 15),
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
              TextField(
                obscureText: true,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: 'Please Enter your Password',
                ),
              ),
              SizedBox(height: 20),
              Text(
                'Batch',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 7),
              DropdownButtonFormField(
                decoration: InputDecoration(border: OutlineInputBorder()),
                onChanged: (newValue) {
                  setState(() {
                    _batchyear = newValue.toString();
                  });
                },
                value: _batchyear,
                items: batchyearlist.map((String batchyearlist) {
                  return DropdownMenuItem(
                    child: Text(batchyearlist),
                    value: batchyearlist,
                  );
                }).toList(),
              ),
              SwitchListTile(
                value: _updates,
                onChanged: (val) {
                  setState(() {
                    _updates = val;
                  });
                },
                title: Text('Receive Regular Updates'),
              ),
              SizedBox(height: 10),
              Text('Are you excited for this'),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Row(children: [
                    Radio(
                        value: 1,
                        groupValue: radiovalue,
                        onChanged: (value) => setState(() => radiovalue = 1)),
                    Text('Yes'),
                  ]),
                  Row(children: [
                    Radio(
                        value: 2,
                        groupValue: radiovalue,
                        onChanged: (value) => setState(() => radiovalue = 2)),
                    Text('No'),
                  ]),
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
                child: Text('Register', style: TextStyle(fontSize: 20)),
                style: ElevatedButton.styleFrom(
                    primary: Color(0xff2FC4B2),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10))),
              ),
              Row(children: [
                Text('Already have an account'),
                TextButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        new MaterialPageRoute(
                            builder: (context) => LoginScreen()));
                  },
                  child: Text('Login'),
                ),
              ])
            ],
          )
        ]));
  }
}
