import 'package:apphotels/Auth/Auth.dart';
import 'package:apphotels/Forget.dart';

import 'package:apphotels/GloabalVariables.dart';
import 'package:apphotels/Signup.dart';
import 'package:apphotels/Widgets/Dialogue.dart';
import 'package:apphotels/Widgets/Dialoguebox.dart';
import 'package:apphotels/components/already_have_an_account_acheck.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  String email;
  String password;
  Auth auth = Auth();
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        title: const Text('SIGN IN'),
        backgroundColor: Colors.red,
      ),
      body: Container(
        height: double.infinity,
        color: Colors.grey ,
        child: SingleChildScrollView(
          child: Container(
            child: Column(
              children: <Widget>[
                SizedBox(
                  height: height / 50,
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
                  child: Align(
                    alignment: Alignment(0, -1),
                    child: Container(
                      width: width * 0.8,
                      height: height / 2,
                      decoration: BoxDecoration(
                        shape: BoxShape.rectangle,
                        image: DecorationImage(
                            image: AssetImage('images/Trans.png'),
                            fit: BoxFit.fill),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: height / 20),
                Container(
                  width: width * .9,
                  child: TextField(
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
                      userEmail = value;
                    },
                  ),
                ),
                SizedBox(
                  height: height / 25,
                ),
                Container(
                  width: width * .9,
                  child: TextField(
                    obscureText: true,
                    decoration: new InputDecoration(
                      prefixIcon: Icon(Icons.lock, color: Colors.white),
                      labelText: "Password",
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
                      password = value;
                    },
                  ),
                ),
                SizedBox(
                  height: height / 25,
                ),
                Container(
                  width: width * 0.9,
                  height: height / 8,
                  child: RaisedButton(
                    textColor: Colors.white,
                    color: Colors.red,
                    child: Text("Log in "),
                    onPressed: () async {
                      showDialog(
                        barrierDismissible: false,
                        context: context,
                        builder: (BuildContext context) => Dialogue(
                          status: 'Logging you in',
                        ),
                      );
                      await auth.logInToFb(userEmail, password);

                      Navigator.pop(context);
                      showGeneralDialog(
                        context: context,
                        barrierDismissible: true,
                        barrierLabel: MaterialLocalizations.of(context)
                            .modalBarrierDismissLabel,
                        barrierColor: Colors.black45,
                        transitionDuration: const Duration(milliseconds: 200),
                        pageBuilder: (BuildContext buildContext,
                            Animation animation, Animation secondaryAnimation) {
                          return Dialoguebox();
                          //
                        },
                      );
                    },
                    shape: new RoundedRectangleBorder(
                      borderRadius: new BorderRadius.circular(20.0),
                    ),
                  ),
                ),
                SizedBox(
                  height: height / 25,
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) {
                          return ForegetPassword();
                        },
                      ),
                    );
                  },
                  child: Text(
                    'Forget Password? Recover it ',
                    style: TextStyle(fontSize: 14.0, color: Colors.grey[900]),
                  ),
                ),
                SizedBox(
                  height: height / 25,
                ),
                AlreadyHaveAnAccountCheck(
                  press: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) {
                          return Sign();
                        },
                      ),
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
