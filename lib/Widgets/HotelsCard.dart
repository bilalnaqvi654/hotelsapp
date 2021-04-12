import 'package:apphotels/UI/Screens/ViewHotels.dart';
import 'package:apphotels/Widgets/displayHotelsDetails.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:apphotels/GloabalVariables.dart';

class HotelsCard extends StatelessWidget {
  final QuerySnapshot snapshot;
  final int index;
  HotelsCard({this.snapshot, this.index});
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Expanded(
        child: Card(
          color: Colors.white,
          elevation: 8.0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15.0),
          ),
          borderOnForeground: true,
          semanticContainer: true,
          margin: EdgeInsets.all(8.0),
          shadowColor: Colors.blueGrey,
          child: ListTile(
            selectedTileColor: Colors.white,
            title: Text(
              snapshot.docs[index].data()["Hotel_Name"].toString(),
              style: TextStyle(
                fontSize: 20.0,
                color: Colors.red,
              ),
            ),
            onTap: () {
              hotelLng = snapshot.docs[index].data()["Longitude"];
              hotellat = snapshot.docs[index].data()["Latitude"];
              print(hotelLng);
              name = '${snapshot.docs[index].data()["Hotel_Name"].toString()}';
              print(name);
              String email =
                  '${snapshot.docs[index].data()["Email"].toString()}';
              print(email);

              directwebLink =
                  '${snapshot.docs[index].data()["DirectWebLink"].toString()}';

              openingdays =
                  '${snapshot.docs[index].data()["openingDays"].toString()}';

              phoneNo =
                  '${snapshot.docs[index].data()["telePhoneNumber"].toString()}';
              print(name);
              address = '${snapshot.docs[index].data()["Address"].toString()}';

              town = '${snapshot.docs[index].data()["Town"].toString()}';

              comments =
                  '${snapshot.docs[index].data()["Comments"].toString()}';
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) {
                    return DisplayHotelsDetails();
                  },
                ),
              );
              print(snapshot.docs[index].data()["Hotel_Name"].toString());
            },
          ),
        ),
      ),
    );
  }
}
