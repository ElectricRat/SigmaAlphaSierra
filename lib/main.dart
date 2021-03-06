import 'package:flutter/material.dart';
import 'package:sigmaalphasierra/ui/pages/addproject.dart';
// page import
import 'ui/pages/profiles.dart';
import 'ui/pages/projects.dart';
import 'ui/pages/home.dart';
import 'ui/pages/interests.dart';
import 'ui/pages/login.dart';

//firebase core import
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'FirebaseFunctions.dart';

void main() {
  //hotfix for a bug
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {


  //sets title for AppBar
  static const String _title = 'Bowfolios';

  // Create the initilization Future outside of `build`:
  final Future<FirebaseApp> _initialization = Firebase.initializeApp();

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      // Initialize FlutterFire:
      future: _initialization,
      builder: (context, snapshot) {
        // Check for errors
        if (snapshot.hasError) {
          //"Container()" is just the pagebuilding equivalent of "null" AFAIK. Replace at will.
          print("error");
          print(snapshot.error);
          return Container(); //todo: "error" window?
        }

        // Once complete, show your application
        if (snapshot.connectionState == ConnectionState.done) {
          print("Firebase initialized");
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
            theme: ThemeData(
              // This is the theme of your application.
              //
              // Try running your application with "flutter run". You'll see the
              // application has a blue toolbar. Then, without quitting the app, try
              // changing the primarySwatch below to Colors.green and then invoke
              // "hot reload" (press "r" in the console where you ran "flutter run",
              // or simply save your changes to "hot reload" in a Flutter IDE).
              // Notice that the counter didn't reset back to zero; the application
              // is not restarted.
              primarySwatch: Colors.blue,
              // This makes the visual density adapt to the platform that you run
              // the app on. For desktop platforms, the controls will be smaller and
              // closer together (more dense) than on mobile platforms.
              visualDensity: VisualDensity.adaptivePlatformDensity,
            ),
            initialRoute: '/login',
            routes: {
              '/home': (context) => HomePage(),
              '/profiles': (context) => ProfilePage(),
              '/projects': (context) => ProjectPage(),
              '/interests': (context) => InterestPage(),
              '/addproject': (context) => AddProjectPage(),
              '/login': (context) => LoginPage(),
            },
          );
        }

        // Otherwise, show something whilst waiting for initialization to complete
        print("loading");
        return Container(); //todo: "loading" window?
      },
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      // This call to setState tells the Flutter framework that something has
      // changed in this State, which causes it to rerun the build method below
      // so that the display can reflect the updated values. If we changed
      // _counter without calling setState(), then the build method would not be
      // called again, and so nothing would appear to happen.
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(widget.title),
      ),
      drawer: Drawer(

      ),
      body: Center(
        // Center is a layout widget. It takes a single child and positions it
        // in the middle of the parent.
        child: Column(
          // Column is also a layout widget. It takes a list of children and
          // arranges them vertically. By default, it sizes itself to fit its
          // children horizontally, and tries to be as tall as its parent.
          //
          // Invoke "debug painting" (press "p" in the console, choose the
          // "Toggle Debug Paint" action from the Flutter Inspector in Android
          // Studio, or the "Toggle Debug Paint" command in Visual Studio Code)
          // to see the wireframe for each widget.
          //
          // Column has various properties to control how it sizes itself and
          // how it positions its children. Here we use mainAxisAlignment to
          // center the children vertically; the main axis here is the vertical
          // axis because Columns are vertical (the cross axis would be
          // horizontal).
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headline4,
            ),
        AddUser("John Bean", "Chiropractor"), //PLACEHOLDER: button that when pressed adds a user to database
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
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

