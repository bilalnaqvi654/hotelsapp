import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_geofire/flutter_geofire.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:apphotels/GloabalVariables.dart';
import 'package:apphotels/GloabalVariables.dart';

class AddHotels extends StatefulWidget {
  @override
  _AddHotelsState createState() => _AddHotelsState();
}

class _AddHotelsState extends State<AddHotels> {
  @override
  double lat;
  double long;
  void setupPOstionLocator() async {
    Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.bestForNavigation);
    currentposition = position;
    LatLng pos = LatLng(position.latitude, position.longitude);
    CameraPosition cp = new CameraPosition(target: pos, zoom: 14.0);
  }

  void initState() {
    super.initState();
    setupPOstionLocator();
    long = currentposition.longitude;
    lat = currentposition.latitude;
  }

  void makeAvailabel() {
    Geofire.initialize('HotelsAvailable');
    Geofire.setLocation(
      new DateTime.now().millisecondsSinceEpoch.toString(),
      currentposition.latitude,
      currentposition.longitude,
    );
  }

  @override
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.width;

    String hotelName;
    String town;
    String Address;
    String telePhoneNumber;
    String openingDays;
    String Email;
    String DirectWebLink;
    String Comments;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add Hotels'),
        backgroundColor: Colors.red,
      ),
      body: Container(
        color: Colors.grey,
        child: SingleChildScrollView(
          child: Container(
            height: height * 2,
            color: Colors.grey,
            child: Column(
              children: [
                SizedBox(
                  height: height / 50,
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
                  child: Align(
                    alignment: Alignment(0, -1),
                    child: Container(),
                  ),
                ),
                SizedBox(
                  height: height / 10,
                ),
                Container(
                  width: width * .9,
                  height: height / 8,
                  child: TextField(
                    decoration: new InputDecoration(
                      prefixIcon: Icon(Icons.hotel, color: Colors.white),
                      labelText: "Hotel Name",
                      labelStyle: TextStyle(
                        color: Colors.white,
                      ),
                      enabledBorder: const OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(20.0)),
                        borderSide: const BorderSide(
                          color: Colors.white,
                        ),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10.0)),
                        borderSide: BorderSide(color: Colors.blue),
                      ),
                    ),
                    onChanged: (val) {
                      hotelName = val;
                    },
                  ),
                ),
                SizedBox(
                  height: height / 25,
                ),
                Container(
                  width: width * .9,
                  height: height / 8,
                  child: TextField(
                    onChanged: (val) {
                      town = val;
                    },
                    decoration: new InputDecoration(
                      prefixIcon: Icon(Icons.home, color: Colors.white),
                      labelText: "Town",
                      labelStyle: TextStyle(
                        color: Colors.white,
                      ),
                      enabledBorder: const OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(20.0)),
                        borderSide: const BorderSide(
                          color: Colors.white,
                        ),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10.0)),
                        borderSide: BorderSide(color: Colors.blue),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: height / 25,
                ),
                Container(
                  width: width * .9,
                  height: height / 8,
                  child: TextField(
                    onChanged: (val) {
                      Address = val;
                    },
                    decoration: new InputDecoration(
                      prefixIcon: Icon(Icons.home_sharp, color: Colors.white),
                      labelText: "Address",
                      labelStyle: TextStyle(
                        color: Colors.white,
                      ),
                      enabledBorder: const OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(20.0)),
                        borderSide: const BorderSide(
                          color: Colors.white,
                        ),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10.0)),
                        borderSide: BorderSide(color: Colors.blue),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: height / 25,
                ),
                Container(
                  width: width * .9,
                  height: height / 8,
                  child: TextField(
                    onChanged: (val) {
                      telePhoneNumber = val;
                    },
                    keyboardType: TextInputType.number,
                    decoration: new InputDecoration(
                      prefixIcon: Icon(Icons.phone, color: Colors.white),
                      labelText: "Phone Number",
                      labelStyle: TextStyle(
                        color: Colors.white,
                      ),
                      enabledBorder: const OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(20.0)),
                        borderSide: const BorderSide(
                          color: Colors.white,
                        ),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10.0)),
                        borderSide: BorderSide(color: Colors.blue),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: height / 25,
                ),
                Container(
                  width: width * .9,
                  height: height / 8,
                  child: TextField(
                    onChanged: (val) {
                      openingDays = val;
                    },
                    decoration: new InputDecoration(
                      prefixIcon: Icon(Icons.date_range, color: Colors.white),
                      labelText: "Operating days",
                      labelStyle: TextStyle(
                        color: Colors.white,
                      ),
                      enabledBorder: const OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(20.0)),
                        borderSide: const BorderSide(
                          color: Colors.white,
                        ),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10.0)),
                        borderSide: BorderSide(color: Colors.blue),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: height / 25,
                ),
                Container(
                  width: width * .9,
                  height: height / 8,
                  child: TextField(
                    decoration: new InputDecoration(
                      prefixIcon: Icon(Icons.phone, color: Colors.white),
                      labelText: "Phone Number",
                      labelStyle: TextStyle(
                        color: Colors.white,
                      ),
                      enabledBorder: const OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(20.0)),
                        borderSide: const BorderSide(
                          color: Colors.white,
                        ),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10.0)),
                        borderSide: BorderSide(color: Colors.blue),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: height / 25,
                ),
                Container(
                  height: height / 8,
                  width: width * .9,
                  child: TextField(
                    onChanged: (val) {
                      Email = val;
                    },
                    decoration: new InputDecoration(
                      prefixIcon: Icon(Icons.mail, color: Colors.white),
                      labelText: "Email",
                      labelStyle: TextStyle(
                        color: Colors.white,
                      ),
                      enabledBorder: const OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(20.0)),
                        borderSide: const BorderSide(
                          color: Colors.white,
                        ),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10.0)),
                        borderSide: BorderSide(color: Colors.blue),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: height / 25,
                ),
                Container(
                  height: height / 8,
                  width: width * .9,
                  child: TextField(
                    onChanged: (val) {
                      DirectWebLink = val;
                    },
                    decoration: new InputDecoration(
                      prefixIcon: Icon(
                        Icons.web,
                        color: Colors.white,
                      ),
                      labelText: "Direct web link",
                      labelStyle: TextStyle(
                        color: Colors.white,
                      ),
                      enabledBorder: const OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(20.0)),
                        borderSide: const BorderSide(
                          color: Colors.white,
                        ),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10.0)),
                        borderSide: BorderSide(color: Colors.blue),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: height / 25,
                ),
                Container(
                  height: height / 8,
                  width: width * .9,
                  child: TextField(
                    onChanged: (val) {
                      Comments = val;
                    },
                    decoration: new InputDecoration(
                      prefixIcon: Icon(Icons.comment, color: Colors.white),
                      labelText: "Comments",
                      labelStyle: TextStyle(
                        color: Colors.white,
                      ),
                      enabledBorder: const OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(20.0)),
                        borderSide: const BorderSide(
                          color: Colors.white,
                        ),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10.0)),
                        borderSide: BorderSide(color: Colors.blue),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: height / 25,
                ),
                Container(
                  width: width * .9,
                  height: height / 8,
                  child: RaisedButton(
                    textColor: Colors.white,
                    color: Colors.red,
                    child: Text("Submit"),
                    onPressed: () {
                      FirebaseFirestore.instance.collection('Hotels').add({
                        "Hotel_Name": "$hotelName",
                        "Town": "$town",
                        "Address": "$Address",
                        "telePhoneNumber": "$telePhoneNumber",
                        "openingDays": "$openingDays",
                        "Email": "$Email",
                        "DirectWebLink": "$DirectWebLink",
                        "Comments": "$Comments",
                        "Longitude": long,
                        "Latitude": lat,
                        "time": DateTime.now()
                      }).then((value) {
                        Scaffold.of(context).showSnackBar(
                          SnackBar(
                            content: Text(' Data Uploaded'),
                          ),
                        );
                      }).then((value) {
                        makeAvailabel();
                      });

                      shape:
                      new RoundedRectangleBorder(
                        borderRadius: new BorderRadius.circular(20.0),
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
