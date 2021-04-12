import 'package:apphotels/Auth/Auth.dart';
import 'package:apphotels/GloabalVariables.dart';

import 'package:apphotels/Widgets/ProfileDisplay.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class View extends StatefulWidget {
  @override
  _ViewState createState() => _ViewState();
}

@override
class _ViewState extends State<View> {
  var dbref = FirebaseFirestore.instance
      .collection("Users")
      .where('Email', isEqualTo: '$userEmail')
      .snapshots();
  Auth auth = Auth();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey,
      appBar: AppBar(
        actions: [
          Icon(Icons.home),
        ],
        title: Text('Profile'),
        centerTitle: true,
        backgroundColor: Colors.red,
      ),
      body: StreamBuilder<QuerySnapshot>(
        stream: dbref,
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return CircularProgressIndicator();
          }
          return ListView.builder(
            itemCount: snapshot.data.docs.length,
            itemBuilder: (context, int index) {
              return Profile(snapshot: snapshot.data, index: index);
            },
          );
        },
      ),
    );
  }
}
