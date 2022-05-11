import 'package:flutter/material.dart';

class Event {
  final String title;
  final String desc;
  final Color bgcolor;

  const Event({
    required this.title,
    required this.desc,
    this.bgcolor = Colors.lightGreen,
  });
}
