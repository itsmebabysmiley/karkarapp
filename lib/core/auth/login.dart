import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:karkarapp/screens/home/home.dart';

class Login {
  Future singInWithEmail(
    String email,
    String password,
    BuildContext context,
  ) async {
    try {
      await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: password);
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => HomePage()));
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
        },
      );
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
        },
      );
    }
  }

  Future signInWithFacebook(BuildContext context) async {
    try {
      // Trigger the sign-in flow
      final LoginResult loginResult = await FacebookAuth.instance.login();

      // Create a credential from the access token
      final OAuthCredential facebookAuthCredential =
          FacebookAuthProvider.credential(loginResult.accessToken!.token);

      // Sign in into Firebase
      await FirebaseAuth.instance.signInWithCredential(facebookAuthCredential);

      // Once signed in, return the UserCredential
      // return FirebaseAuth.instance.signInWithCredential(facebookAuthCredential);
      final userData = await FacebookAuth.instance.getUserData();
      // Keep a copy of user
      await FirebaseFirestore.instance.collection('users').add({
        'email': userData['email'],
        'imageUrl': userData['picture']['data']['url'],
        'name': userData['name'],
      });
      // Update user photo.
      final User user = FirebaseAuth.instance.currentUser!;
      print('login');
      user.updatePhotoURL(userData['picture']['data']['url']);
      print(user);
      print('----');

      Navigator.push(
          context, MaterialPageRoute(builder: (context) => HomePage()));
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
        },
      );
    }

  }
}
