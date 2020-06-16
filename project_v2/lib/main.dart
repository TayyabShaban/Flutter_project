import 'package:flutter/material.dart';
import 'Pages/Setup/welcome.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Sign In',
      theme: ThemeData(
         primarySwatch: Colors.green,
      ),
      home: WelcomePage(),
    );
  }
}