import 'package:flutter/material.dart';
import 'package:worldtimeapp/pages/loading.dart';
import 'package:worldtimeapp/pages/home.dart';
import 'package:worldtimeapp/pages/choose_location.dart';



void main() => runApp(MaterialApp(
  initialRoute: '/',
  routes: {
    '/home': (context) => Home(),
    '/': (context) => Loading(),
    '/location': (context) => ChooseLocations(),
  },
));

