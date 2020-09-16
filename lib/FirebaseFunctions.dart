import 'package:flutter/material.dart';

// Import the firebase_core and cloud_firestore plugin
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class AddUser extends StatelessWidget {
  final String name;
  final String job;

  AddUser(this.name, this.job);

  @override
  Widget build(BuildContext context) {
    // Create a CollectionReference called users that references the firestore collection
    CollectionReference profiles = FirebaseFirestore.instance.collection('Profiles');

    Future<void> addUser() {
      // Call the user's CollectionReference to add a new user
      print("Added user");
      return profiles
          .add({
        'Name': name, // John Doe
        'Profession': job // 42
      })
          .then((value) => print("User Added"))
          .catchError((error) => print("Failed to add user: $error"));
    }

    return FlatButton(
      onPressed: addUser,
      child: Text(
        "Add User",
      ),
    );
  }
}