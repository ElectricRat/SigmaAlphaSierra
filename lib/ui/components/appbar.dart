import 'package:flutter/material.dart';

class NewAppBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text('Projects'),
      backgroundColor: Colors.green,
      actions: [
        IconButton(icon: Icon(Icons.person), onPressed: null),
      ],
    );
  }
}

class DrawerList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        DrawerHeader(child: Text('Menu'),
        ),
        ListTile(
          leading: Icon(Icons.group),
          title: Text('Profiles'),
          onTap: () => {
            Navigator.pushNamed(context, '/profiles')
          },
        ),
        ListTile(
          leading: Icon(Icons.filter_none),
          title: Text('Projects'),
          onTap: () => {
            Navigator.pushNamed(context, '/projects')
          },
        ),
        ListTile(
          leading: Icon(Icons.message),
          title: Text('Message other people'),
        ),
      ],
    );
  }
}