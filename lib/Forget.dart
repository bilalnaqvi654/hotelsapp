import 'package:apphotels/Auth/Auth.dart';
import 'package:apphotels/Login.dart';
import 'package:apphotels/Widgets/Dialogue.dart';
import 'package:flutter/material.dart';

class ForegetPassword extends StatelessWidget {
  String email;
  Auth _auth = Auth();
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Colors.grey,
      appBar: AppBar(
        title: Text('Foreget Password'),
        centerTitle: true,
      ),
      body: Column(
        children: <Widget>[
          SizedBox(height: 240),
          TextField(
            decoration: new InputDecoration(
              prefixIcon: Icon(Icons.email, color: Colors.white),
              labelText: "Your Email",
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
            onChanged: (value) {
              email = value;
            },
          ),
          SizedBox(
            height: 18.0,
          ),
          Container(
            width: width * .9,
            height: height / 10,
            child: RaisedButton(
              textColor: Colors.white,
              color: Colors.red,
              child: Text("Recover Password"),
              onPressed: () async {
                showDialog(
                  barrierDismissible: false,
                  context: context,
                  builder: (BuildContext context) => Dialogue(
                    status: 'Sending reset Link',
                  ),
                );
                _auth.resetPassword(email);
                Navigator.pop(context);
                Scaffold.of(context).showSnackBar(
                    SnackBar(content: Text(' Link Sent to You Email')));
              },
              shape: new RoundedRectangleBorder(
                borderRadius: new BorderRadius.circular(20.0),
              ),
            ),
          ),
          SizedBox(
            height: 20.0,
          ),
          GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) {
                    return Login();
                  },
                ),
              );
            },
            child: Text(
              "Log in to Account",
              style: TextStyle(
                fontSize: 14.0,
                color: Colors.white,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
