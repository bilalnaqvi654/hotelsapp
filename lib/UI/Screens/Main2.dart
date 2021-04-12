import 'package:apphotels/UI/Screens/AddMyHotels.dart';
import 'package:apphotels/UI/Screens/home.dart';
import 'package:apphotels/UI/Screens/profile.dart';
import 'package:apphotels/UI/Screens/ViewHotels.dart';
import 'package:flutter/material.dart';
import 'package:bottom_navy_bar/bottom_navy_bar.dart';

class MainPage2 extends StatefulWidget {
  static const String id = 'mainpage';
  @override
  _MainPage2State createState() => _MainPage2State();
}

class _MainPage2State extends State<MainPage2> with TickerProviderStateMixin {
  int _currrentIndex = 2;

  PageController _pageController;

  List myList = [];
  void initState() {
    super.initState();
    _pageController = PageController();
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox.expand(
        child: PageView(
          controller: _pageController,
          onPageChanged: (index) {
            setState(() => _currrentIndex = index);
          },
          children: <Widget>[Home(), ViewHotels(), AddHotels(), View()],
        ),
      ),
      bottomNavigationBar: BottomNavyBar(
        selectedIndex: _currrentIndex,
        showElevation: true, // use this to remove appBar's elevation
        onItemSelected: (index) => setState(() {
          _currrentIndex = index;
          _pageController.animateToPage(index,
              duration: Duration(milliseconds: 300), curve: Curves.ease);
        }),

        curve: Curves.easeInCirc,
        iconSize: 24,
        animationDuration: Duration(milliseconds: 400),
        items: <BottomNavyBarItem>[
          BottomNavyBarItem(
            title: Text(
              'Home',
              style: TextStyle(
                fontSize: 12.0,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            icon: Icon(
              Icons.home,
              color: Colors.black,
            ),
            activeColor: Colors.red[900],
            inactiveColor: Colors.grey[800],
          ),
          BottomNavyBarItem(
            title: Text(
              'Our Hottels',
              style: TextStyle(
                fontSize: 12.0,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            icon: Icon(
              Icons.restaurant,
              color: Colors.black,
            ),
            activeColor: Colors.red[900],
            inactiveColor: Colors.grey[800],
          ),
          BottomNavyBarItem(
            activeColor: Colors.red[900],
            inactiveColor: Colors.grey[800],
            title: Text(
              'Contact US',
              style: TextStyle(
                fontSize: 12.0,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            icon: Icon(
              Icons.contact_page,
              color: Colors.black,
            ),
          ),
          BottomNavyBarItem(
            activeColor: Colors.red[900],
            inactiveColor: Colors.grey[800],
            title: Text(
              'Setting',
              style: TextStyle(
                fontSize: 12.0,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            icon: Icon(
              Icons.settings,
              color: Colors.black,
            ),
          ),
        ],
      ),
    );
  }
}
