import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  bool _answer = false;
  bool _newDay = true;

  Future<dynamic> dialogAlert(BuildContext context) {
    return showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: const Text("alert title"),
            content: Text('did u?'),
            actions: [
              MaterialButton(
                onPressed: () {
                  _answer = true;
                  print(_answer.toString());
                  Navigator.of(context).pop();
                },
                child: Text('Ok'),
                elevation: 5.0,
              ),
              MaterialButton(
                onPressed: () {},
                child: Text('No'),
                elevation: 5.0,
              )
            ],
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    if (_newDay == true) {
      _newDay = false;
      print(_newDay.toString());
      Future.delayed(Duration.zero, () async {
        dialogAlert(context);
      });
    }

    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Container(
        child: Center(
          child: FlatButton(
            child: Text('Submit'),
            onPressed: () {
              dialogAlert(context).then((value) {
                SnackBar snackBar = SnackBar(content: Text('Hello $value'));
                ScaffoldMessenger.of(context).showSnackBar(snackBar);
              });
            },
          ),
        ),
      ),
    );
  }
}
