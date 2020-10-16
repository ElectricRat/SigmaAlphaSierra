import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

// components
import '../components/appbar.dart';

class InterestPage extends StatefulWidget {
  @override
  _InterestPageState createState() => _InterestPageState();
}

class _InterestPageState extends State<InterestPage> {
  @override
  @mustCallSuper
  void initState() {
    super.initState();
  }

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
        child: ListView(
          children: [
            ProjectItem(
              name: 'Algorithms',
              role: 'professor',
              participants: ['cnaga@hawaii.edu'],
            ),
            ProjectItem(
              name: 'Government',
              role: 'professor',
              participants: ['glau@hawaii.edu',],
            ),
            ProjectItem(
              name: 'Data Science',
              role: 'professor',
              participants: ['cnaga@hawaii.edu'],
            ),
            ProjectItem(
              name: 'ACM',
              role: 'professor',
              participants: ['cnaga@hawaii.edu'],
            ),
            ProjectItem(
              name: 'Cybersecurity',
              role: 'professor',
              participants: ['radington@hawaii.edu'],
            ),
            ProjectItem(
              name: 'Advising',
              role: 'professor',
              participants: ['glau@hawaii.edu',],
            ),
          ],
        ),
      ),
    );
  }
}

class ProjectItem extends StatefulWidget {
  const ProjectItem({
    Key key,
    this.name = '',
    this.role = '',
    this.participants,
  }) : super(key: key);

  final String name;
  final String role;
  final List<String> participants;

  @override
  _ProjectItemState createState() => _ProjectItemState();
}

class _ProjectItemState extends State<ProjectItem> {

  // internal array for dynamic stats
  List<Widget> _participantWidget;

  @override
  @mustCallSuper
  void initState() {
    super.initState();
    _populateParticipants(widget.participants);
  }

  void _populateParticipants(List<String> participants) {
    // this needs to be here??? otherwise error?
    _participantWidget = [Text("")];
    int index = 0;
    while (index < participants.length && index < 7) {
      _participantWidget.add(
        Chip(
          label: Text(
            participants[index],
            style: TextStyle(
              color: Colors.white,
            ),
          ),
          backgroundColor: Colors.green,
        ),
      );
      index++;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.grey[300],
      padding: EdgeInsets.fromLTRB(17.0, 17.0, 17.0, 0),
      height: 200,
      alignment: Alignment.center,
      child: Column(
        children: [
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: Container(
                    child: Column(
                      children: [
                        Row(
                          children: [
                            Text(
                              widget.name,
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 25,
                              ),
                            ),
                          ],
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        ),
                      ],
                    ),
                    margin:  EdgeInsets.fromLTRB(15, 0, 0, 0),
                  ),
                ),
              ],
            ),
          ),
          const Divider(
            color: Colors.black,
            indent: 100.0,
            endIndent: 100.0,
          ),
          Row(
            children: [
              Text(
                'Participants',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                ),
              ),
            ],
          ),
          Container(
            child: Wrap(
              children: _participantWidget,
            ),
            padding: EdgeInsets.fromLTRB(0, 10.0, 0, 0),
          ),
          const Divider(
            color: Colors.black,
          ),
        ],
      ),
    );
  }
}

