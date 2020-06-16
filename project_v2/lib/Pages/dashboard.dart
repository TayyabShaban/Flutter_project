import 'package:flutter/material.dart';
//import 'package:projectv2/Pages/Setup/sign_in.dart';
import 'package:projectv2/Pages/Setup/usermanagement.dart';
import 'package:projectv2/Pages/jhome.dart';



class DashboardPage extends StatefulWidget {
  @override
  _DashboardPageState createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:  AppBar(
        title: Text('Hi Fastian!'),
        centerTitle: true,
      ),
      drawer: Drawer(
        child: ListView(
          children: <Widget>[
            new UserAccountsDrawerHeader(
              
              accountName: new Text('Name'),
              accountEmail: new Text(UserManagement().getUserData(context)),
//              currentAccountPicture: new CircleAvatar(
//                backgroundImage: new NetworkImage('http://i.pravatar.cc/300'),
//              ),
            ),
            new ListTile(
              title: new Text('Junior Home'),
              onTap: () {
                Navigator.of(context).pop();
                Navigator.push(
                    context,
                    new MaterialPageRoute(
                        builder: (BuildContext context) => new JHome()));
              },
            ),
            new ListTile(
              title: new Text('Buddy Home'),
              onTap: () {
                UserManagement().authorizeAccess(context);
              },
            ),
            new ListTile(
              title: new Text('Logout'),
              onTap: () {
                UserManagement().signOut();
              },
            ),
          ],
        ),
      ),
      body: Center(
        child:Text('news feed goes here'),

      )
    );
  }
}
