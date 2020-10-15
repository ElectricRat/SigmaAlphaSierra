import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_tagging/flutter_tagging.dart';


class Tags extends StatefulWidget {
  @override
  _Tags createState() => _Tags();
}

class _Tags extends State<Tags> {
  List<String> _tagList;
  List<Widget> _tagWidgets;

  @override
  @mustCallSuper
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(child: Column(
      children: [
        Row(
          children: [
            TextField(

            ),
          ],
        ),
        Row(

        ),
      ],
    ));
  }

  // add chips of interests
  List<Widget> _populateTags(List<String> interests) {
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
}
