import 'package:flutter/material.dart';
class JHome extends StatefulWidget {
  @override
  _JHomeState createState() => _JHomeState();
}

class _JHomeState extends State<JHome> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Junior Home'),
        centerTitle: true,
      ),
    );
  }
}