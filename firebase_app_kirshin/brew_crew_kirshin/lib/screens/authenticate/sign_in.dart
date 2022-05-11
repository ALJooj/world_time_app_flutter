import 'package:brew_crew_kirshin/modules/user.dart';
import 'package:brew_crew_kirshin/services/auth.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';


class SignIn extends StatefulWidget {

  final Function toggleView;

  SignIn({ this.toggleView });

  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  final AuthService _auth = AuthService();
  String email = '';
  String password = '';


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.brown[100],
      appBar: AppBar(
        backgroundColor: Colors.brown[400],
        title: Text('Sign in'),
        actions: <Widget>[
          FlatButton.icon(onPressed: () {widget.toggleView();}, icon: Icon(Icons.person), label: Text('Sign Up', style: TextStyle(color: Colors.white),))
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 35),
        child: Form(
          child: Column(
            children: <Widget>[
              SizedBox(height: 20),
              TextFormField(
                onChanged: (val) {
                  setState(() {
                    email = val;
                  });
                },
              ),
              SizedBox(height: 20),
              TextFormField(
                onChanged: (val) {
                  setState(() {
                    password = val;
                  });
                },
              ),
              FlatButton(
                color: Colors.brown,
                onPressed: () {}, 
                child: 
                Text(
                  'Sign up', 
                style: TextStyle(
                  
                ),
              )
            ),
            ],
          ),
        ),
      ),
    );
  }
}