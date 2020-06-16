import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'package:flutter/widgets.dart';
//import 'package:projectv2/Pages/Setup/sign_in.dart';
import 'package:projectv2/Pages/Setup/welcome.dart';

import 'package:projectv2/Pages/dashboard.dart';
import 'package:projectv2/Pages/home.dart';





class UserManagement{

  Widget handleAuth(){
    return new StreamBuilder(
      stream: FirebaseAuth.instance.onAuthStateChanged,
      builder:(BuildContext context, snapshot){
        if(snapshot.hasData){
          return DashboardPage();
        }else{
          return WelcomePage();
          //return LoginPage();
        }

      },
    );
  }

  getUserData(BuildContext context){
    return "sending";
//    FirebaseAuth.instance.currentUser().then((user){
//      Firestore.instance.collection('/User').where('uid',isEqualTo: user.uid).getDocuments().then((docs){
//        print('getData   '+ user.uid);
//        if(docs.documents[0].exists){
////          print(user.email);
////          return user.email.toString();
//        return "abc";
//        }
//        else{
//          return "Sorry! No user found :(";
//        }
//      });
//    });
  }



  authorizeAccess(BuildContext context){
    FirebaseAuth.instance.currentUser().then((user){
      Firestore.instance.collection('/User').where('uid',isEqualTo: user.uid).getDocuments().then((docs){
        print('b///////////////////////////////   '+ user.uid);
        if(docs.documents[0].exists){
          if(docs.documents[0].data['is_senior']==true){
            Navigator.of(context).push(
              new MaterialPageRoute(
                  //builder:(BuildContext context )=> new Home()));
                  builder :(BuildContext context)=> new Home()));
          }
          else{
            print('Not Authorized');
          }
        }
        else{
          print('No data found');
        }
      });
    });
  }

  signOut() async {
    print('00000000000000000000000000000000000000000000000000000000');
    await FirebaseAuth.instance.signOut();
    if (FirebaseAuth.instance!=null){
      print ('still true');
    }
    print('111111111111111111111111111111111111111111111111111111111');
  }
}