import 'package:apphotels/UI/Screens/MainPage.dart';
import 'package:apphotels/UI/Screens/ViewOnMap.dart';
import 'package:apphotels/components/rounded_button.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:apphotels/GloabalVariables.dart';

class DisplayHotelsDetails extends StatelessWidget {
  final QuerySnapshot snapshot;
  final int index;
  DisplayHotelsDetails({this.snapshot, this.index});
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Colors.grey,
      appBar: AppBar(
        title: Text('Details'),
        centerTitle: true,
        backgroundColor: Colors.red,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              SizedBox(
                height: 48.0,
              ),
              Row(
                children: <Widget>[
                  Align(
                    alignment: Alignment.topCenter,
                    child: Text(
                      'Name:',
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w900,
                          fontStyle: FontStyle.italic,
                          fontFamily: 'Open Sans',
                          fontSize: width / 12),
                    ),
                  ),
                  SizedBox(
                    width: 24,
                  ),
                  Align(
                    alignment: Alignment.topCenter,
                    child: Text(
                      ('$name'),
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w900,
                          fontStyle: FontStyle.italic,
                          fontFamily: 'Open Sans',
                          fontSize: width / 12),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 15.0,
              ),
              Row(
                children: <Widget>[
                  Align(
                    alignment: Alignment.topCenter,
                    child: Text(
                      'Email :',
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w900,
                          fontStyle: FontStyle.italic,
                          fontFamily: 'Open Sans',
                          fontSize: width / 12),
                    ),
                  ),
                  SizedBox(
                    width: 24,
                  ),
                  Align(
                    alignment: Alignment.topCenter,
                    child: Text(
                      '$email',
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w900,
                          fontStyle: FontStyle.italic,
                          fontFamily: 'Open Sans',
                          fontSize: width / 12),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 15.0,
              ),
              Row(
                children: <Widget>[
                  Align(
                    alignment: Alignment.topCenter,
                    child: Text(
                      ' Email:',
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w900,
                          fontStyle: FontStyle.italic,
                          fontFamily: 'Open Sans',
                          fontSize: width / 12),
                    ),
                  ),
                  SizedBox(
                    width: 24,
                  ),
                  Align(
                    alignment: Alignment.topCenter,
                    child: Text(
                      '$directwebLink',
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w900,
                          fontStyle: FontStyle.italic,
                          fontFamily: 'Open Sans',
                          fontSize: width / 12),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 15.0,
              ),
              Row(
                children: <Widget>[
                  Align(
                    alignment: Alignment.topCenter,
                    child: Text(
                      'Contact:',
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w900,
                          fontStyle: FontStyle.italic,
                          fontFamily: 'Open Sans',
                          fontSize: width / 12),
                    ),
                  ),
                  SizedBox(
                    width: 24,
                  ),
                  Align(
                    alignment: Alignment.topCenter,
                    child: Text(
                      '$phoneNo',
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w900,
                          fontStyle: FontStyle.italic,
                          fontFamily: 'Open Sans',
                          fontSize: width / 12),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 15.0,
              ),
              Row(
                children: <Widget>[
                  Align(
                    alignment: Alignment.topCenter,
                    child: Text(
                      'Address :',
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w900,
                          fontStyle: FontStyle.italic,
                          fontFamily: 'Open Sans',
                          fontSize: width / 12),
                    ),
                  ),
                  SizedBox(
                    width: 24,
                  ),
                  Align(
                    alignment: Alignment.topCenter,
                    child: Text(
                      '$address',
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w900,
                          fontStyle: FontStyle.italic,
                          fontFamily: 'Open Sans',
                          fontSize: width / 12),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 12.0,
              ),
              Container(
                width: width * .9,
                height: height / 9,
                child: RaisedButton(
                  textColor: Colors.white,
                  color: Colors.red,
                  child: Text("View on Maps"),
                  onPressed: () async {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) {
                          return ViewOnMap();
                        },
                      ),
                    );
                  },
                  shape: new RoundedRectangleBorder(
                    borderRadius: new BorderRadius.circular(20.0),
                  ),
                ),
              ),
              SizedBox(
                height: 12.0,
              ),
              Container(
                width: width * .9,
                height: height / 9,
                child: RaisedButton(
                  textColor: Colors.white,
                  color: Colors.red,
                  child: Text("Home"),
                  onPressed: () async {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) {
                          return MainPage();
                        },
                      ),
                    );
                  },
                  shape: new RoundedRectangleBorder(
                    borderRadius: new BorderRadius.circular(20.0),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
