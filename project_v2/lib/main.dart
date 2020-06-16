import 'package:flutter/material.dart';
import 'package:projectv2/Pages/Setup/usermanagement.dart';

//import 'Pages/Setup/welcome.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Main',
      theme: ThemeData(
         primarySwatch: Colors.green,
      ),
     home: UserManagement().handleAuth(),
      //home: WelcomePage(),
    );
  }
}