import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

// components
import '../components/appbar.dart';

class ProjectPage extends StatefulWidget {
  @override
  _ProjectPageState createState() => _ProjectPageState();
}

class _ProjectPageState extends State<ProjectPage> {
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
  }

  _readProject() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    List<String> user = prefs.getStringList("profile1");
    setState(() {
      _name = user[0];
      _URL = user[1];
      _homepage = user[2];
      _description = user[3];
      _interestsList = prefs.getStringList("profile1_interests");
      _participantsList = prefs.getStringList("profile1_participants");
    });
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

  Widget _nullGuard() {
    if(_name != null && _name != ''){
      return
          ProjectItem(
            name: _name,
            imageLink: 'assets/no-image.png',
            role: 'professor',
            description: _description,
            interests: _interestsList,
            participants: _participantsList,
          );
    }
    else{
      return Text('');
    }
  }

  @override
  Widget build(BuildContext context) {
    _readProject();
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
              name: 'Aloha Access',
              imageLink: 'assets/hacc19_header2.jpg',
              role: 'professor',
              description: 'Creating oppurtunity for the community through competitions',
              interests: ['Algorithms'],
              participants: ['glau@hawaii.edu', 'cnaga@hawaii.edu'],
            ),
            _nullGuard(),
            ProjectItem(
              name: 'ACM at UH Manoa',
              imageLink: 'assets/acm.png',
              role: 'professor',
              description: 'Student-led club aiming to provide students with applied experience',
              interests: ['ACM', 'Data Science'],
              participants: ['cnaga@hawaii.edu'],
            ),
            ProjectItem(
              name: 'Cybersecurity Project',
              imageLink: 'assets/greyhats.png',
              role: 'professor',
              description: 'Providing organizations with cybersecurity consultation',
              interests: ['Cybersecurity', 'Government'],
              participants: ['radington@hawaii.edu'],
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
    this.imageLink = '',
    this.role = '',
    this.description = '',
    this.interests,
    this.participants,
  }) : super(key: key);

  final String name;
  final String imageLink;
  final String role;
  final String description;
  final List<String> interests;
  final List<String> participants;

  @override
  _ProjectItemState createState() => _ProjectItemState();
}

class _ProjectItemState extends State<ProjectItem> {

  // internal array for dynamic stats
  List<Widget> _interestsWidget;
  List<Widget> _participantWidget;

  @override
  @mustCallSuper
  void initState() {
    super.initState();
    _populateParticipants(widget.participants);
    _interestsWidget = _populateInterests(widget.interests);
  }

  // add chips of interests
  List<Widget> _populateInterests(List<String> interests) {
    List<Widget> _interestLists = List<Widget>();
    interests.forEach((element) {

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
      height: 290,
      alignment: Alignment.center,
      child: Column(
        children: [
          Expanded(
            child: Row(
              children: [
                Column(
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(40.0),
                      child: Container(
                        child: Image.asset(widget.imageLink),
                        height: 80.0,
                      ),
                    )
                  ],
                ),
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
                        Row(
                          children: [
                            Container(
                              child: Text(widget.description),
                              width: MediaQuery.of(context).size.width*0.47,
                              padding: EdgeInsets.fromLTRB(0, 4.0, 0, 0),
                            ),
                          ],
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
          Text('Interests',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 13.0,
            ),
          ),
          Wrap(
            children: _interestsWidget,
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

