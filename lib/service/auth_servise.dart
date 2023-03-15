/*
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:pinterest_clone/service/utils_service.dart';

class AuthService {
  static final _auth = FirebaseAuth.instance;

  static bool isLoggedIn() {
    final User? firebaseUser = _auth.currentUser;
    return firebaseUser != null;
  }

  static Future<User?> signInUser(
      BuildContext context,
      String email,
      String password
      ) async {

    try{
      await _auth.signInWithEmailAndPassword(email: email, password: password);
      final User firebaseUser = _auth.currentUser!;
      return firebaseUser;
    }on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        Utils.snackBarError('No user found for that email', context);
      } else if (e.code == 'wrong-password') {
        Utils.snackBarError('Wrong password provided for that user', context);
      }
    }
    return null;
  }

  static Future<User?> signUpUser(
      BuildContext context,
      String fullname,
      String email,
      String password) async {
    try{
      var authResult = await _auth.createUserWithEmailAndPassword(
          email: email, password: password);
      User? user = authResult.user;
      Utils.snackBarSucces('You register successfully ', context);
      return user;
    } on FirebaseAuthException catch (e) {
      if(e.code == 'weak-passord') {
        Utils.snackBarError('The password provided if too ', context);
      } else if (e.code == 'email-already') {
        Utils.snackBarError('The account already exists for that email ', context);
      } else {
        Utils.snackBarError('Try again later ', context);
      }
    }
     return null;
  }
  static void signOutUser(BuildContext context) {
    _auth.signOut();
    Navigator.pushReplacementNamed(context, '/SignIn');
  }
}*/
