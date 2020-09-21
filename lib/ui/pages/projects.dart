import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

// components
import '../components/appbar.dart';

class ProjectPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Projects'),
        backgroundColor: Colors.green,
        actions: [
          IconButton(icon: Icon(Icons.person), onPressed: null),
        ],
      ),
      drawer: Drawer(
        child: DrawerList(),
      ),
      body: Container(
        child: FlatButton(
          child: Text('This is the project page, go back?'),
          onPressed: () => {
            Navigator.pushNamed(context, '/profiles')
          },
        ),
      ),
    );
  }
}
