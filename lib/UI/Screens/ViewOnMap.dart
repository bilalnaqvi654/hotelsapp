import 'dart:async';
import 'dart:io';

import 'package:apphotels/HelperClass/FireHelpers.dart';
import 'package:apphotels/UI/Screens/MainPage.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:geolocator/geolocator.dart';
import 'package:apphotels/GloabalVariables.dart';
import 'package:flutter/material.dart';

class ViewOnMap extends StatefulWidget {
  @override
  _ViewOnMapState createState() => _ViewOnMapState();
}

class _ViewOnMapState extends State<ViewOnMap> {
  @override
  Set<Marker> HotelMarker;
  void initState() {
    super.initState();
    HotelMarker = Set<Marker>();
  }

  double mappadding = 0;
  Completer<GoogleMapController> _controller = Completer();
  GoogleMapController mapController;

  setupPostionLOcator() {
    LatLng pos = LatLng(hotellat, hotelLng);
    CameraPosition cp = new CameraPosition(target: pos, zoom: 14.0);
    mapController.animateCamera(
      CameraUpdate.newCameraPosition(cp),
    );
    updateMarkersOnMap();
  }

  updateMarkersOnMap() {
    LatLng hotelsPostions = LatLng(hotellat, hotelLng);
    Marker thismarker = Marker(
      markerId:
          MarkerId('${new DateTime.now().millisecondsSinceEpoch.toString()}'),
      position: hotelsPostions,
      icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueRed),
      rotation: FireHelper.generateRandomNumbers(360),
      infoWindow: InfoWindow(title: '$name'),
    );
    setState(() {
      HotelMarker.add(thismarker);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Hotel view'),
        backgroundColor: Colors.red,
        actions: [
          GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return MainPage();
                    },
                  ),
                );
              },
              child: Icon(Icons.home)),
        ],
      ),
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
              setupPostionLOcator();
            },
          ),
        ],
      ),
    );
  }
}
