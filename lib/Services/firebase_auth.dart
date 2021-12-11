import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../Screens/home_page.dart';
import '../Screens/login_page.dart';

class Authentication {
  loginservice() {
    return StreamBuilder(
      stream: FirebaseAuth.instance.authStateChanges(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return const MyHomePage();
        } else {
          return const LoginPage();
        }
      },

      
    );
  }

  signUp(String emailID, String password) async {
    try {
      await FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: emailID, password: password);
      debugPrint("Logged in successfully!");
    } on FirebaseAuthException catch (e) {
      switch (e.code) {
        case 'weak-password':
          debugPrint('The password provided is too weak.');
          break;
        case 'email-already-in-use':
          debugPrint('The account already exists for that email.');
          break;
        default:
          debugPrint('Error in signup');
      }
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  signOut() async {
    try {
      await FirebaseAuth.instance.signOut();
      debugPrint("Logged out successfully!");
    } catch (e) {
      debugPrint(e.toString());
    }
  }
}
