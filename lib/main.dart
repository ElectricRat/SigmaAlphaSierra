import 'package:flutter/material.dart';
// page import
import 'ui/pages/profiles.dart';

//firebase core import
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'FirebaseFunctions.dart';

void main() => runApp(MyApp());

/// This Widget is the main application widget.
class MyApp extends StatelessWidget {

  //sets title for AppBar

  static const String _title = 'Bowfolios';

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: _title,

      //body of the page
      home: Scaffold(

        //appBar with Bowfolios title
        appBar: AppBar(
            title: const Text(_title),
        backgroundColor: Colors.green[800],),
        body: Center(
    child: MyStatefulWidget(),


          )
        ),
      );
  }
}



class MyStatefulWidget extends StatefulWidget {
  MyStatefulWidget({Key key}) : super(key: key);

  @override
  _MyStatefulWidgetState createState() => _MyStatefulWidgetState();
}

class _MyStatefulWidgetState extends State<MyStatefulWidget> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Center(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[

          //widget for email text field entry
          Padding(
      padding: const EdgeInsets.all(20.0),
          child: TextFormField(
            decoration: const InputDecoration(
              hintText: 'Enter your email',
            ),
            validator: (value) {

              //prompts user to input email if not entered
              if (value.isEmpty) {
                return 'Please enter your email';
              }
              return null;
            },
          ),
          ),

          //widget for password text field entry. will update to hide password
          Padding(
            padding: const EdgeInsets.all(20.0),

          child: TextFormField(


            decoration: const InputDecoration(
              hintText: 'Enter your password',
            ),

            validator: (value) {

              //prompts user to enter password if not entered
              if (value.isEmpty) {
                return 'Please enter your password';
              }
              return null;
            },
           obscureText: true,
          ),
          ),

          //submit button
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 100.0, vertical: 8),

            child: RaisedButton(
              onPressed: () {
                // Validate will return true if the form is valid, or false if
                // the form is invalid.
                if (_formKey.currentState.validate()) {
                  // Process data.
                }
              },
              child: Center (child: Text('Submit'),),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 100.0, vertical: 5),
            child: RaisedButton(
              onPressed: () {
                // Validate will return true if the form is valid, or false if
                // the form is invalid.
                if (_formKey.currentState.validate()) {
                  // Process data.
                }
              },
              child: Center (child: Text('Forgot password?'),),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 100.0, vertical: 5),
            child: RaisedButton(
              onPressed: () {
              },
              child: Center (child: Text('Sign up'),),
            ),
          ),
        ],
      ),
      ),
    );
  }
}
