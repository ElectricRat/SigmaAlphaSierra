import 'package:flutter/material.dart';

class MenuIcon extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Widget icon = Icon(IconData(58908, fontFamily: 'MaterialIcons'));
    debugPrint(icon.toString());
    return (
        IconButton(
          icon: icon, // should be 59669, but is 58908
          onPressed: null,
        )
    );
  }
}