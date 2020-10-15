import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_tagging/flutter_tagging.dart';

// components
import '../components/appbar.dart';
import '../components/tags.dart';

class AddProjectPage extends StatefulWidget {
  @override
  _AddProjectPage createState() => _AddProjectPage();
}

class _AddProjectPage extends State<AddProjectPage> {
  List<String> _interestsList;
  List<String> _participantsList;

  @override
  @mustCallSuper
  void initState() {
    super.initState();
    setState(() {
      _interestsList = [];
      _participantsList = [];
    });
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text('Add Project'),
        backgroundColor: Colors.green,
        actions: [
          IconButton(icon: Icon(Icons.person), onPressed: null),
        ],
      ),
      drawer: Drawer(
        child: DrawerList(),
      ),
      body: ListView(
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          children: <Widget>[
            ListTile(
              title: Text('Project Name',
                style: TextStyle(
                  fontSize: 22.0,
                ),
              ),
            ),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: TextFormField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                ),
              ),
            ),
            ListTile(
              title: Text('Picture URL',
                style: TextStyle(
                  fontSize: 22.0,
                ),
              ),
            ),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: TextFormField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                ),
              ),
            ),
            ListTile(
              title: Text('Homepage',
                style: TextStyle(
                  fontSize: 22.0,
                ),
              ),
            ),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: TextFormField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                ),
              ),
            ),
            ListTile(
              title: Text('Description',
                style: TextStyle(
                  fontSize: 22.0,
                ),
              ),
            ),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: TextFormField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                ),
              ),
            ),
            ListTile(
              title: Text('Interests',
                style: TextStyle(
                  fontSize: 22.0,
                ),
              ),
            ),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: TextFormField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                ),
                onFieldSubmitted: (value) => {
                  setState(() {_interestsList.add(value);})
                },
              ),
            ),
            Container(
              padding: const EdgeInsets.all(8.0),
              child: Wrap(
                children: _populateTags(_interestsList),
              ),
            ),
            ListTile(
              title: Text('Participant',
                style: TextStyle(
                  fontSize: 22.0,
                ),
              ),
            ),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: TextFormField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                ),
                onFieldSubmitted: (value) => {
                  setState(() {_participantsList.add(value);})
                },
              ),
            ),
            Container(
              padding: const EdgeInsets.all(8.0),
              child: Wrap(
                children: _populateTags(_participantsList),
              ),
            ),
            RaisedButton(
              onPressed: () {},
              color: Colors.green,
              child: const Text(
                  'Submit',
                  style: TextStyle(fontSize: 20, color: Colors.white),
              ),
            ),
          ]
      ),
    );
  }

  // add chips of interests
  List<Widget> _populateTags(List<String> tags) {
    List<Widget> _interestLists = List<Widget>();

    if (tags.length < 1) {
      return [Text('Empty')];
    }

    tags.forEach((element) {
      _interestLists.insert(_interestLists.length,
        Container(
          child: Chip(
            label: Text(
              element,
              style: TextStyle(
                color: Colors.white,
              ),
            ),
            backgroundColor: Colors.green,
          ),
          padding: EdgeInsets.all(5.0),
        ),
      );
    });

    return _interestLists;
  }
}
