import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class NotesPage extends StatefulWidget {
  const NotesPage({Key? key}) : super(key: key);

  @override
  State<NotesPage> createState() => _NotesPageState();
}

class _NotesPageState extends State<NotesPage> {
  String? val;

  @override
  void initState() {
    super.initState();
    getNotes();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: CloseButton(),
      ),
      body: Center(
        child: val == null ? Text('no notes') : Text(val!),
      ),
    );
  }

  void getNotes() async {
    final SharedPreferences pref = await SharedPreferences.getInstance();
    val = pref.getString('username2');
    setState(() {});
  }
}
