import 'package:apphotels/Widgets/HotelsCard.dart';
import 'package:apphotels/Widgets/displayHotelsDetails.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class ViewHotels extends StatefulWidget {
  @override
  _ViewHotelsState createState() => _ViewHotelsState();
}

class _ViewHotelsState extends State<ViewHotels> {
  var datbaseref = FirebaseFirestore.instance.collection("Hotels").snapshots();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('My hotels'),
        centerTitle: true,
        backgroundColor: Colors.red,
      ),
      body: StreamBuilder<QuerySnapshot>(
        stream: datbaseref,
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return CircularProgressIndicator();
          }
          return ListView.builder(
            shrinkWrap: true,
            itemCount: snapshot.data.docs.length,
            itemBuilder: (context, int index) {
              return HotelsCard(snapshot: snapshot.data, index: index);
            },
          );
        },
      ),
    );
  }
}
