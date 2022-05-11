import 'package:brew_crew_kirshin/services/auth.dart';
import 'package:flutter/material.dart';


class Register extends StatefulWidget {

  final Function toggleView;

  Register({ this.toggleView });


  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  AuthService _auth = AuthService();
  String email = '';
  String password = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.brown[100],
      appBar: AppBar(
        backgroundColor: Colors.brown[400],
        title: Text('Sign up'),
        actions: <Widget>[
          FlatButton.icon(onPressed: () {widget.toggleView();}, icon: Icon(Icons.person), label: Text('Sign In', style: TextStyle(color: Colors.white),))
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
                  'Register', 
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