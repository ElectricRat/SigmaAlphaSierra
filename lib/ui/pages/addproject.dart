import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

// components
import '../components/appbar.dart';
import '../components/tags.dart';

class AddProjectPage extends StatefulWidget {
  @override
  _AddProjectPage createState() => _AddProjectPage();
}

class _AddProjectPage extends State<AddProjectPage> {
  String _name;
  String _URL;
  String _homepage;
  String _description;
  List<String> _interestsList;
  List<String> _participantsList;

  @override
  @mustCallSuper
  void initState() {
    super.initState();
    setState(() {
      _name = '';
      _URL = '';
      _homepage = '';
      _description = '';
      _interestsList = [];
      _participantsList = [];
    });
  }

  List<String> toArray() {
    List<String> data = [];
    data.add(_name);
    data.add(_URL);
    data.add(_homepage);
    data.add(_description);
    return data;
  }

  /// Converts the class to json string.
  String toJson() {
    String interests = _interestsList.join(', ');
    String participants = _participantsList.join(', ');

    return '''  {
    "name": $_name,\n
    "URL": $_URL,\n
    "homepage": $_homepage,\n
    "description": $_description,\n
    "interestsList": [$interests],\n
    "participantsList": [$participants],\n
  }''';
  }

  //Incrementing counter after click
  _writeProject() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setStringList("profile1", toArray());
    prefs.setStringList("profile1_interests", _interestsList);
    prefs.setStringList("profile1_participants", _participantsList);
    _setUploadTrue();
  }

  _setUploadFalse () async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool("ProjectUpload", false);
  }

  _setUploadTrue () async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool("ProjectUpload", true);
  }

  @override
  Widget build(BuildContext context) {
    _setUploadFalse();
    // debugPrint(this.toJson());
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
                onChanged: (text) => setState(() {_name = text;}),
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
                onChanged: (text) => setState(() {_URL = text;}),
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
                onChanged: (text) => setState(() {_homepage = text;}),
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
                onChanged: (text) => setState(() {_description = text;}),
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
              onPressed: _writeProject,
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
