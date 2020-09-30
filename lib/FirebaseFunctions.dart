import 'package:flutter/material.dart';

// Import the firebase_core and cloud_firestore plugin
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'dart:math';
import 'dart:async';

class fireFunctions {
  /**
   * RED ALERT RED ALERT
   *
   * THIS IS NOT HOW YOU SHOULD HANDLE USER LOGIN DATA
   *
   * This has been a practice exercise in asynchronicity and database manipulation. Will convert this database-based login system to Firebase Authserver ASAP.
   * In the meantime: DO NOT SUBMIT REAL PASSWORDS. THEY ARE STORED AS PLAINTEXT
   *
   */
  static Future<int> createLogin(user, pass) {
    CollectionReference logins = FirebaseFirestore.instance.collection('Logins');
    Completer<int> completer = new Completer<int>();
    Future<QuerySnapshot> results = logins.where("username", isEqualTo: user).get();
    results.then((value) {
      if (value.size != 0) {
        completer.complete(-1);
        return;
      }
      Random rng = new Random();
      int newID = rng.nextInt(10000000);
      logins.add({
        'username': user,
        'password': pass,
        'verif_ID': newID
      });
      completer.complete(newID);
    });

    return completer.future;
  }
  static Future<int> findLogin(String user, String pass) async { //Returns a future with the ID of the found user, or -1 if user not found
    CollectionReference logins = FirebaseFirestore.instance.collection('Logins');
    Completer<int> completer = new Completer<int>();
    Future<QuerySnapshot> results = logins.where("username", isEqualTo: user).where("password", isEqualTo: pass).get();

    results.then((value) {
      if (value.size != 1) {
        completer.complete(-1);
        return;
      }
      int ID = value.docs[0].data()["verif_ID"];
      completer.complete(ID);
    });
    return completer.future;
  }
}

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