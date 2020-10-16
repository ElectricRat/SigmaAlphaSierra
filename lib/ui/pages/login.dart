import 'package:flutter/material.dart';

//firebase core import
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '../../FirebaseFunctions.dart';

class LoginPage extends StatelessWidget {
  //sets title for AppBar
  static const String _title = 'Bowfolios';

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      //appBar with Bowfolios title
        appBar: AppBar(
          title: const Text(_title),
          backgroundColor: Colors.green[800],),
        body: Center(
          child: MyStatefulWidget(),


        )
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
  final emailHandler = TextEditingController();
  final pwdHandler = TextEditingController();

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
                controller: emailHandler,
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
                controller: pwdHandler,
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
                    //entries are valid, check credentials
                    Future<int> id = fireFunctions.findLogin(emailHandler.value.text, pwdHandler.value.text);
                    id.then((value) {
                      print(value);
                      if (value != -1 && value != null) {
                        Navigator.pushNamed(context, '/profiles');
                      } else {
                        showDialogue(context, "An error has occurred", "Your email or password may be incorrect");
                      }
                    });
                  }
                },
                child: Center (child: Text('Submit'),),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 100.0, vertical: 5),
              child: RaisedButton(
                onPressed: () {
                  showDialogue(context, "TODO: this button", "Sorry, this button doesn't do anything");
                },
                child: Center (child: Text('Forgot password?'),),
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
                    Future<int> id = fireFunctions.createLogin(emailHandler.value.text, pwdHandler.value.text);
                    id.then((value) {
                      print(value);
                      if (value != -1 && value != null) {
                        print("Account created!");
                        showDialogue(context, "Account created!", "You can now log in");
                      } else {
                        showDialogue(context, "An error has occurred", "That email may already be taken");
                      }
                    });
                    print("test");

                  }
                },
                child: Center (child: Text('Sign up'),),
              ),
            ),
          ],
        ),
      ),
    );
  }
  showDialogue(BuildContext context, String titleText, String descText) {

    // set up the button
    Widget okButton = FlatButton(
      child: Text("OK"),
      onPressed:  () {
        Navigator.of(context).pop(); // dismiss dialog
      },
    );

    // set up the AlertDialog
    AlertDialog alert = AlertDialog(
      title: Text(titleText),
      content: Text(descText),
      actions: [
        okButton,
      ],
    );

    // show the dialog
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }
}