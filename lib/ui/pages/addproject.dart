import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_tagging/flutter_tagging.dart';

// components
import '../components/appbar.dart';

class Tag extends Taggable {
  const Tag(this.name, this.position);

  final String name;
  final int position;

  @override
  List<Object> get props => [name, position];
}

class AddProjectPage extends StatelessWidget {

  static Future<List<Tag>> getLanguages(String query) async {
    await Future.delayed(Duration(milliseconds: 500), null);
    return <Tag>[
      Tag(name: 'JavaScript', position: 1),
      Tag(name: 'Python', position: 2),
      Tag(name: 'Java', position: 3),
      Tag(name: 'PHP', position: 4),
      Tag(name: 'C#', position: 5),
      Tag(name: 'C++', position: 6),
    ].where((lang) => lang.name.toLowerCase().contains(query.toLowerCase())).toList();
  }

  List<Tag> _interests = [];
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

            FlutterTagging<Tag>(
                initialItems: _interests,
                findSuggestions: _suggestions,
                configureChip: (lang) {
                  return ChipConfiguration(
                    label: Text(lang.name),
                    backgroundColor: Colors.green,
                    labelStyle: TextStyle(color: Colors.white),
                    deleteIconColor: Colors.white,
                  );
                },
                configureSuggestion: (lang) {
                  return SuggestionConfiguration(
                    title: Text(lang.name),
                    subtitle: Text(lang.position.toString()),
                    additionWidget: Chip(
                      avatar: Icon(
                        Icons.add_circle,
                        color: Colors.white,
                      ),
                      label: Text('Add New Tag'),
                      labelStyle: TextStyle(
                        color: Colors.white,
                        fontSize: 14.0,
                        fontWeight: FontWeight.w300,
                      ),
                      backgroundColor: Colors.green,
                    ),
                  );
                },
            )
          ]
      ),
    );
  }
}