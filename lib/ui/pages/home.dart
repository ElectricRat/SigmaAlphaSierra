import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

// components
import '../components/appbar.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<String> _interestsList;
  List<String> _projectsList;

  @override
  @mustCallSuper
  void initState() {
    super.initState();
    setState(() {
      _interestsList = [];
      _projectsList = [];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home'),
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
              title: Text('Firstname',
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
              title: Text('Lastname',
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
              title: Text('Bio',
                style: TextStyle(
                  fontSize: 22.0,
                ),
              ),
            ),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              height: 200,
              child: Expanded(
                child: TextFormField(
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                    ),
                    style: TextStyle(
                      height: 10.0,
                    )
                ),
              ),
            ),
            ListTile(
              title: Text('Title',
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
              title: Text('Projects',
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
                  setState(() {_projectsList.add(value);})
                },
              ),
            ),
            Container(
              padding: const EdgeInsets.all(8.0),
              child: Wrap(
                children: _populateTags(_projectsList),
              ),
            ),
            RaisedButton(
              onPressed: () {},
              color: Colors.green,
              child: const Text(
                'Submit Changes',
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