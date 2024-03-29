import 'package:brew_crew_kirshin/modules/user.dart';
import 'package:brew_crew_kirshin/screens/wrapper.dart';
import 'package:brew_crew_kirshin/services/auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return StreamProvider<User>.value(
      value: AuthService().streamUser,
      child: MaterialApp(
        home: Wrapper(),
      ),
    );
  }
}

