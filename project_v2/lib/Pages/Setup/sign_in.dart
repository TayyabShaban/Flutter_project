import 'package:flutter/material.dart';
import 'package:projectv2/Pages/home.dart';
import 'package:firebase_auth/firebase_auth.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
// TODO: declare var to hold values
// _ to set var as private in dart
  String _email,_password;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text('Sign In'),
      ),
      body: Form(
        // TODO: implement key
          key: _formKey,
          child: Column(
            children: <Widget>[
              //TODO: Implement fields
              TextFormField(
                validator: (input){
                  if(input.isEmpty){
                    // ignore: missing_return
                    return 'Please type an email address';
                  }
                // return 'email incorrect';
                },
                onSaved:(input)=>_email=input ,
                decoration: InputDecoration(
                  // text that appears on screen
                    labelText: 'Email'
                ),
              ),
              TextFormField(
                validator: (input){
                  if(input.length < 6){
                    return 'Please enter password of at least 6 characters long.';
                  }
                 //return 'Please enter correct  password';
                },
                onSaved:(input)=>_password=input ,
                decoration: InputDecoration(
                  // text that appears on screen
                    labelText: 'Password'
                ),
                // to hide password text
                obscureText: true,
              ),
              RaisedButton(
                onPressed: signIn,
                child: Text('Sign In'),
              )
            ],
          )
      ),
    );
  }

  Future <void>  signIn() async {
    //TODO validate fields and login
    final formState =_formKey.currentState;
    if (formState.validate()){
      formState.save();
      try{
        // used due to error
        //FirebaseUser user = (await FirebaseAuth.instance.signInWithEmailAndPassword(email: _email, password: _password)).user;
       // Navigator.push(context, MaterialPageRoute(builder: (context) =>Home()));
        //actual used in tutorial
        //FirebaseUser user = await FirebaseAuth.instance.signInWithEmailAndPassword(email: _email, password: _password);
       // AuthResult user = await FirebaseAuth.instance.signInWithEmailAndPassword(email: _email, password: _password);
       //Future<AuthResult> user = FirebaseAuth.instance.signInWithEmailAndPassword(email: _email, password: _password);

        AuthResult result=await FirebaseAuth.instance.signInWithEmailAndPassword(email: _email, password: _password);
        FirebaseUser user=result.user;
        Navigator.push(context, MaterialPageRoute(builder: (context) =>Home()));
      }catch(e){
        print(e.message);
      }

    }
  }
}