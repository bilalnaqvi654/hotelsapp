import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class Profile extends StatelessWidget {
  final QuerySnapshot snapshot;
  final int index;
  Profile({this.snapshot, this.index});
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.width;

    return Container(
      child: Column(
        children: [
          Container(
            color: Colors.grey,
            child: Expanded(
              child: Column(
                children: [
                  SizedBox(
                    height: height / 5,
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
                    child: Align(
                      alignment: Alignment(0, -1),
                      child: Container(
                        width: width / 2,
                        height: height / 2,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          image: DecorationImage(
                              image: NetworkImage(snapshot.docs[index]
                                  .data()["url"]
                                  .toString()),
                              fit: BoxFit.fill),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: height / 10,
                  ),
                  Align(
                    alignment: Alignment.topCenter,
                    child: Text(
                      snapshot.docs[index].data()["First_Name"].toString(),
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w900,
                          fontStyle: FontStyle.italic,
                          fontFamily: 'Open Sans',
                          fontSize: width / 9),
                    ),
                  ),
                  SizedBox(
                    height: height / 30,
                  ),
                  Text(
                    snapshot.docs[index].data()["Email"].toString(),
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w900,
                        fontStyle: FontStyle.italic,
                        fontFamily: 'Open Sans',
                        fontSize: width / 22),
                  ),
                  SizedBox(
                    height: height / 6,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
