import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:karkarapp/screens/home/home.dart';

class Login {
  emailLogin(String email, String password, BuildContext context) async {
    try {
      await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: password);
      Navigator.of(context)
          .push(MaterialPageRoute(builder: (context) => HomePage()));
    } on FirebaseAuthException {
      showDialog(
          context: context,
          builder: (context) {
            return AlertDialog(
              title: const Text('Log in failed'),
              content: const Text('Email or password is incorrect'),
              actions: [
                TextButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    child: const Text('Close'))
              ],
            );
          });
    } on Exception {
      showDialog(
          context: context,
          builder: (context) {
            return AlertDialog(
              title: const Text('Error Occurred'),
              content: const Text('Please contact develop.'),
              actions: [
                TextButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    child: const Text('Close'))
              ],
            );
          });
    }
  }
}
