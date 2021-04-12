import 'dart:io';

import 'package:apphotels/Auth/Auth.dart';

import 'package:apphotels/GloabalVariables.dart';
import 'package:apphotels/Login.dart';
import 'package:apphotels/Widgets/Dialogue.dart';
import 'package:apphotels/Widgets/Dialoguebox.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_geofire/flutter_geofire.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path/path.dart';

String male = 'male';
String female = 'female';
String gender = 'gender';

class Sign extends StatefulWidget {
  @override
  _SignState createState() => _SignState();
}

class _SignState extends State<Sign> {
  String password;
  String confirmPassword;
  String firstName;
  String lastName;
  int Selectedradio;
  File _image;
  GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  String Gender;
  final picker = ImagePicker();
  String UserImageUrl = '';
  Auth auth = Auth();
  Future GallerImagePicker() async {
    var pickedFile = await picker.getImage(source: ImageSource.gallery);
    setState(() {
      _image = File(pickedFile.path);
    });
    print(_image);
  }

  @override
  void makeAvailabel() {
    Geofire.initialize('HotelsAvailable');
    Geofire.setLocation(
      new DateTime.now().millisecondsSinceEpoch.toString(),
      currentposition.latitude,
      currentposition.longitude,
    );
  }

  SelectedRadio(int val) {
    setState(() {
      Selectedradio = val;
    });
  }

  @override
  void initState() {
    super.initState();

    Selectedradio = 0;
  }

  Future UploadTOFireBase(BuildContext context) async {
    String fileName = basename(_image.path);
    FirebaseStorage storage = FirebaseStorage.instance;
    Reference ref = storage.ref().child('UserImage/$fileName');
    UploadTask uploadTask = ref.putFile(_image);

    uploadTask.then((res) async {
      UserImageUrl = await ref.getDownloadURL();
      print(url);

      FirebaseFirestore.instance.collection('Users').doc(id).set(
        {
          "url": "$UserImageUrl",
          "First_Name": "$firstName",
          "Gender": "$Gender",
          "Email": "$userEmail",
          "time": DateTime.now(),
        },
      );
      print(" Picture uploaded");
      Scaffold.of(context)
          .showSnackBar(SnackBar(content: Text(' Picture Uploaded')));
    });
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.width;

    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        title: const Text('Signup'),
        backgroundColor: Colors.red,
      ),
      body: Container(
        color: Colors.grey,
        child: SingleChildScrollView(
          child: Container(
            height: height * 2,
            color: Colors.grey,
            child: Form(
              child: Column(
                children: [
                  SizedBox(
                    height: height / 50,
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
                    child: Align(
                      alignment: Alignment(0, -1),
                      child: GestureDetector(
                        onTap: () {
                          GallerImagePicker();
                        },
                        child: Container(
                          width: width / 3,
                          height: height / 3,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            image: DecorationImage(
                                image: (_image != null)
                                    ? FileImage(_image)
                                    : AssetImage('images/dummy.png'),
                                fit: BoxFit.fill),
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: height / 10,
                  ),
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
                    width: width * .9,
                    child: TextField(
                      obscureText: true,
                      decoration: new InputDecoration(
                        prefixIcon: Icon(Icons.lock, color: Colors.white),
                        labelText: "Confirm Password",
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
                        confirmPassword = value;
                      },
                    ),
                  ),
                  SizedBox(
                    height: height / 25,
                  ),
                  Container(
                    width: width * .9,
                    child: TextField(
                      decoration: new InputDecoration(
                        prefixIcon: Icon(Icons.person, color: Colors.white),
                        labelText: "Your Name",
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
                        firstName = value;
                      },
                    ),
                  ),
                  Row(
                    // mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      SizedBox(
                        width: width / 20,
                      ),
                      new Radio(
                        value: 1,
                        groupValue: Selectedradio,
                        onChanged: (val) {
                          SelectedRadio(val);
                          print(Selectedradio);

                          if (Selectedradio == 1) {
                            setState(() {
                              Gender = 'male';
                            });
                          } else {
                            setState(() {
                              Gender = 'female';
                            });
                          }
                        },
                      ),
                      new Text(
                        'Male',
                        style: new TextStyle(fontSize: 16.0),
                      ),
                      new Radio(
                        activeColor: Colors.black,
                        value: 2,
                        groupValue: Selectedradio,
                        onChanged: (val) {
                          SelectedRadio(val);
                          print(Selectedradio);

                          if (Selectedradio == 2) {
                            setState(() {
                              Gender = 'female';
                            });
                          } else {
                            setState(() {
                              Gender = 'male';
                            });
                          }
                        },
                      ),
                      new Text(
                        'Female',
                        style: new TextStyle(
                          fontSize: 16.0,
                        ),
                      ),
                    ],
                  ),
                  Container(
                    width: width * .9,
                    height: height / 9,
                    child: RaisedButton(
                      textColor: Colors.white,
                      color: Colors.red,
                      child: Text("Sign up"),
                      onPressed: () async {
                        print(email);
                        if (userEmail.isEmpty) {
                          Scaffold.of(context).showSnackBar(
                              SnackBar(content: Text(' Enter the email')));
                        } else if (password != confirmPassword) {
                          Scaffold.of(context).showSnackBar(
                              SnackBar(content: Text(' Password dont Match')));
                        } else if (password.isEmpty) {
                          Scaffold.of(context).showSnackBar(
                              SnackBar(content: Text(' Enter Password')));
                        } else if (firstName.isEmpty) {
                          Scaffold.of(context).showSnackBar(
                              SnackBar(content: Text(' Enter First name ')));
                        } else if (Selectedradio == 0) {
                          Scaffold.of(context).showSnackBar(
                              SnackBar(content: Text(' Select the gender')));
                        } else {
                          showDialog(
                            barrierDismissible: false,
                            context: context,
                            builder: (BuildContext context) => Dialogue(
                              status: 'Registering you',
                            ),
                          );
                          await auth.registerToFb(
                            userEmail,
                            password,
                          );
                          Navigator.pop(context);
                          await UploadTOFireBase(context);
                          showGeneralDialog(
                            context: context,
                            barrierDismissible: true,
                            barrierLabel: MaterialLocalizations.of(context)
                                .modalBarrierDismissLabel,
                            barrierColor: Colors.black45,
                            transitionDuration:
                                const Duration(milliseconds: 200),
                            pageBuilder: (BuildContext buildContext,
                                Animation animation,
                                Animation secondaryAnimation) {
                              return Dialoguebox();
                              //
                            },
                          );
                        }
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
                            return Login();
                          },
                        ),
                      );
                    },
                    child: Text(
                      'Already Have an Account? Log in  ',
                      style: TextStyle(fontSize: 14.0, color: Colors.grey[900]),
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
