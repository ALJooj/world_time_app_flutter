import 'package:brew_crew_kirshin/screens/authenticate/register.dart';
import 'package:brew_crew_kirshin/screens/authenticate/sign_in.dart';
import 'package:flutter/material.dart';

class Authenticate extends StatefulWidget {
  @override
  _AuthenticateState createState() => _AuthenticateState();
}

class _AuthenticateState extends State<Authenticate> {
  bool isSignIn = true;

  void toggleView() {
    setState(() {
      isSignIn = !isSignIn;
    });
  }

  @override
  Widget build(BuildContext context) {

    if (isSignIn) {
      return SignIn(toggleView: toggleView);
    } else {
    return Register(toggleView: toggleView,);
    }
  }
}