import 'package:apphotels/GloabalVariables.dart';
import 'package:firebase_auth/firebase_auth.dart';

class Auth {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  Future registerToFb(String email, String password) async {
    final FirebaseAuth _auth = FirebaseAuth.instance;

    await _auth
        .createUserWithEmailAndPassword(email: email, password: password)
        .then((result) {
      print('ok');
    });
  }

  void logInToFb(String email, String password) async {
    _auth
        .signInWithEmailAndPassword(email: email, password: password)
        .then((result) {
      User user = FirebaseAuth.instance.currentUser;
      currentid = user.uid;
      print('log in');
    });
  }

  Future<String> getCurrentUserId() async {
    User currentfirebaseuser = FirebaseAuth.instance.currentUser;
    id = currentfirebaseuser.uid;
    return id;
  }

  Future<void> resetPassword(String email) async {
    await _auth.sendPasswordResetEmail(email: email);
  }
}
