import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ProfilePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Profiles'),
        backgroundColor: Colors.green,
        actions: [
          IconButton(icon: Icon(Icons.dehaze), onPressed: null),
        ],
      ),
      body: ListView(
        children: [
          ProfileItem(
            name: 'Gerald Lau',
            imageLink: 'assets/glau.jpeg',
            role: 'professor',
            description: 'I\’m an academic advisor, and I participate in coding competitions.',
            interests: ['Government', 'Advising'],
            projectsImage: [
              Image.asset('assets/hacc19_header2.jpg'),
            ],
          ),
          ProfileItem(
            name: 'Cade Naga',
            imageLink: 'assets/cade.png',
            role: 'student',
            description: 'I tutor 311 students. These profiles are a variable template.',
            interests: ['Data Science', 'ACM', 'Algorithms'],
            projectsImage: [
              Image.asset('assets/hacc19_header2.jpg'),
              Image.asset('assets/acm.png'),
            ],
          ),
          ProfileItem(
            name: 'Chad Radington',
            imageLink: 'assets/chadmmm.jpg',
            role: 'PH.D.',
            description: 'I\'m a president of Grey Hats at Manoa',
            interests: ['Cybersecurity'],
            projectsImage: [
              Image.asset('assets/greyhats.png'),
            ],
          ),
        ],
      ),
    );
  }
}

class ProfileItem extends StatefulWidget {
  const ProfileItem({
    Key key,
    this.name = '',
    this.imageLink = '',
    this.role = '',
    this.description = '',
    this.interests,
    this.projectsImage,
  }) : super(key: key);

  final String name;
  final String imageLink;
  final String role;
  final String description;
  final List<String> interests;
  final List<Widget> projectsImage;

  @override
  _ProfileItemState createState() => _ProfileItemState();
}

class _ProfileItemState extends State<ProfileItem> {
  // profile item settings
  double _size = 320;

  // internal array for dynamic stats
  List<Widget> _interestsWidget;
  List<Widget> _projectWidget;

  @override
  @mustCallSuper
  void initState() {
    super.initState();

    _projectWidget = _populateProjects(widget.projectsImage);
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

  // fill the projects tab with images of projects
  List<Widget> _populateProjects(List<Widget> images) {
    List<Widget> _projects = List<Widget>();
    int index = 0;
    int imagesLength = images.length;
    while (index < imagesLength && index < 7) {
      _projects.insert(_projects.length,
          ClipRRect(
            borderRadius: BorderRadius.circular(30.0),
            child: Container(
              child: images[index],
              height: 50.0,
            ),
          )
      );
      index++;
    }

    return _projects;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.grey[300],
      padding: EdgeInsets.fromLTRB(17.0, 17.0, 17.0, 0),
      height: _size,
      alignment: Alignment.center,
      child: Column(
        children: [
          Expanded(
              child: Row(
                children: [
                  Column(
                    children: [
                      Image.asset(widget.imageLink, height: 113.0,),
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
                              Container(
                                child:
                                Text(
                                  widget.role,
                                  style: TextStyle(
                                    fontSize: 18,
                                    color: Colors.grey,
                                  ),
                                ),
                              )
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
                      margin:  EdgeInsets.fromLTRB(10, 0, 0, 0),
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
                'Projects',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                ),
              ),
            ],
          ),
          Container(
            child: Row(
              children: _projectWidget,
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