import 'package:brew_crew_kirshin/services/auth.dart';
import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  AuthService _auth = AuthService();
  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.brown[50],
      appBar: AppBar(
        backgroundColor: Colors.brown[400],
        title: Text('Wrlcom User!'),
        actions: <Widget>[
          FlatButton.icon(
            onPressed: () {
              return _auth.signOut();
            },
            icon: Icon(Icons.exit_to_app, color: Colors.brown[50],), 
            label: Text('')
          ),
        ],
      ),
    );
  }
}