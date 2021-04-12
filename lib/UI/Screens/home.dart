import 'dart:async';
import 'dart:io';

import 'package:apphotels/HelperClass/FireHelpers.dart';
import 'package:apphotels/Widgets/HotelsCard.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:geolocator/geolocator.dart';
import 'package:apphotels/GloabalVariables.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_geofire/flutter_geofire.dart';
import 'package:apphotels/Models/NearByhotels.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> with TickerProviderStateMixin {
  @override
  @override
  Set<Marker> HotelMarker;
  void initState() {
    super.initState();
    HotelMarker = Set<Marker>();
  }

  bool ishotelAvailable = false;

  BitmapDescriptor nearbyIcon;
  var datbaseRefernce =
      FirebaseFirestore.instance.collection("Hotels").snapshots();

  void startGeofire() {
    Geofire.initialize('HotelsAvailable');
    Geofire.queryAtLocation(
      currentposition.latitude,
      currentposition.longitude,
      20,
    ).listen((map) {
      print(map);
      if (map != null) {
        var callBack = map['callBack'];

        //latitude will be retrieved from map['latitude']
        //longitude will be retrieved from map['longitude']

        switch (callBack) {
          case Geofire.onKeyEntered:
            NearByHotels nearByHotels = NearByHotels();
            nearByHotels.key = map['key'];
            nearByHotels.longitute = map['longitude'];
            nearByHotels.latitude = map['latitude'];
            FireHelper.nearbyhotelList.add(nearByHotels);
            if (ishotelAvailable) {
              setState(() {
                updateHotelsOnMap();
              });
            }

            break;

          case Geofire.onKeyExited:
            FireHelper.removeFromList(map['key']);

            updateHotelsOnMap();
            break;

          case Geofire.onKeyMoved:
            NearByHotels nearByHotels = NearByHotels();
            nearByHotels.key = map['key'];
            nearByHotels.longitute = map['longitude'];
            nearByHotels.latitude = map['latitude'];
            FireHelper.updateLocation(nearByHotels);
            updateHotelsOnMap();
            // Update your key's location
            break;

          case Geofire.onGeoQueryReady:
            // All Intial Data is loaded
            ishotelAvailable = true;
            updateHotelsOnMap();
            print('firehelper length :${FireHelper.nearbyhotelList.length}');

            break;
        }
      }
    });
  }

  double mappadding = 0;
  Completer<GoogleMapController> _controller = Completer();
  GoogleMapController mapController;
  void setupPOstionLocator() async {
    Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.bestForNavigation);
    currentposition = position;
    LatLng pos = LatLng(position.latitude, position.longitude);
    CameraPosition cp = new CameraPosition(target: pos, zoom: 14.0);
    mapController.animateCamera(
      CameraUpdate.newCameraPosition(cp),
    );
    startGeofire();
  }

  updateHotelsOnMap() {
    for (NearByHotels nearByHotels in FireHelper.nearbyhotelList) {
      LatLng hotelsPostions =
          LatLng(nearByHotels.latitude, nearByHotels.longitute);

      Marker thismarker = Marker(
        markerId:
            MarkerId('${new DateTime.now().millisecondsSinceEpoch.toString()}'),
        position: hotelsPostions,
        icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueRed),
        rotation: 90.0,
        //FireHelper.generateRandomNumbers(360),
        //infoWindow: InfoWindow(title: '$name'),
      );
      setState(() {
        HotelMarker.add(thismarker);
      });
    }
  }

  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          GoogleMap(
            padding: EdgeInsets.only(bottom: mappadding),
            mapType: MapType.normal,
            myLocationButtonEnabled: true,
            initialCameraPosition: kGooglePlex,
            myLocationEnabled: true,
            zoomGesturesEnabled: true,
            zoomControlsEnabled: true,
            markers: HotelMarker,
            onMapCreated: (GoogleMapController controller) {
              _controller.complete(controller);
              mapController = controller;
              setState(() {
                mappadding = (Platform.isAndroid) ? 250 : 270;
              });
              setupPOstionLocator();
            },
          ),
          // Positioned(
          //   left: 0,
          //   right: 0,
          //   bottom: 0,
          //   child: AnimatedSize(
          //     vsync: this,
          //     duration: Duration(microseconds: 150),
          //     curve: Curves.easeIn,
          //     child: Container(
          //       height: 250.0,
          //       decoration: BoxDecoration(
          //         color: Colors.white,
          //         borderRadius: BorderRadius.only(
          //           topLeft: Radius.circular(15),
          //           topRight: Radius.circular(15),
          //         ),
          //         boxShadow: [
          //           BoxShadow(
          //             color: Colors.black26,
          //             blurRadius: 15.0,
          //             spreadRadius: 0.5,
          //             offset: Offset(
          //               0.7,
          //               0.7,
          //             ),
          //           ),
          //         ],
          //       ),
          //       child: Padding(
          //         padding: const EdgeInsets.symmetric(
          //           horizontal: 24,
          //           vertical: 18,
          //         ),
          //         child: StreamBuilder<QuerySnapshot>(
          //           stream: datbaseRefernce,
          //           builder: (context, snapshot) {
          //             if (!snapshot.hasData) {
          //               return CircularProgressIndicator();
          //             }
          //             return ListView.builder(
          //               shrinkWrap: true,
          //               itemCount: snapshot.data.docs.length,
          //               itemBuilder: (context, int index) {
          //                 return HotelsCard(
          //                     snapshot: snapshot.data, index: index);
          //               },
          //             );
          //           },
          //         ),
          //       ),
          //     ),
          //   ),
          // )
        ],
      ),
    );
  }
}
