import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ProfilePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Profiles'),
        backgroundColor: Colors.green,
      ),
      body: ProfileItem(),
    );
  }
}

class ProfileItem extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.grey[300],
      padding: EdgeInsets.all(17.0),
      height: 130,
      alignment: Alignment.center,
      child: Row(
        children: [
          Column(
            children: [
              Expanded(child: Image.asset('assets/glau.jpeg')),
            ],
          ),
          Expanded(
            child: Container(
              child: Column(
                children: [
                  Row(
                    children: [
                      Text(
                        'Gerald Lau',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 25,
                        ),
                      ),
                      Container(
                        child:
                          Text(
                            'professor',
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
                        child: Text('I\’m an academic advisor, and I participate in coding ...',),
                        width: MediaQuery.of(context).size.width*0.47,
                        padding: EdgeInsets.fromLTRB(0, 5.0, 0, 0),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Spacer(),
                      Icon(
                        Icons.arrow_drop_down,
                        size: 27,
                        color: Colors.grey,
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
    );
  }
}