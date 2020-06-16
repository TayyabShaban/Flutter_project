import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:projectv2/Pages/Setup/sign_in.dart';


class SignUppage extends StatefulWidget {
  @override
  _SignUppageState createState() => _SignUppageState();
}

class _SignUppageState extends State<SignUppage> {
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
                  // return '2nd return email sign in';
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
                  //return '2nd return password sign in';
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
                onPressed: signUp,
                child: Text('Sign Up'),
              )
            ],
          )
      ),
    );
  }

  Future <void>  signUp() async {
    //TODO validate fields and login
    final formState =_formKey.currentState;
    if (formState.validate()){
      formState.save();
      try{
        // used due to error
        //AuthResult user = await FirebaseAuth.instance.signInWithEmailAndPassword(email: _email, password: _password);
        // Navigator.push(context, MaterialPageRoute(builder: (context) =>Home()));
        //actual used in tutorial
        //FirebaseUser user = (await FirebaseAuth.instance.signInWithEmailAndPassword(email: _email, password: _password)).user;
        //Future<AuthResult> user = FirebaseAuth.instance.signInWithEmailAndPassword(email: _email, password: _password);

//        final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
//        Future<String> SignIn(String _email, String _password) async {
//          FirebaseUser user = (await _firebaseAuth.signInWithEmailAndPassword(
//              email: _email, password: _password)).user;
//          //return user.uid;
//        }
        AuthResult result=await FirebaseAuth.instance.createUserWithEmailAndPassword(email: _email, password: _password);
        FirebaseUser user=result.user;
        //Future<AuthResult> user = FirebaseAuth.instance.signInWithEmailAndPassword(email: _email, password: _password);
        // to be uncommented @ end of project
  //       user.sendEmailVerification();
  //
  //
  //       Navigator.of(context).pop();
        Navigator.push(context, MaterialPageRoute(builder: (context) =>LoginPage()));
      }catch(e){
        print(e.message);
      }

    }
  }
}
