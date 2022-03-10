import 'package:flutter/material.dart';
import 'package:karkarapp/constaints.dart';
import 'package:karkarapp/screens/home/home.dart';
import 'package:karkarapp/screens/welcome/welcome.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Kar Kar App',
      theme: ThemeData(
        primaryColor: cPrimaryColor,
        scaffoldBackgroundColor: Colors.white,
      ),
      initialRoute: '/',
      routes: {
        '/' : (context) => const WelcomePage(),
        '/home' : (context) =>const HomePage(),
      },
    );
  }
}

