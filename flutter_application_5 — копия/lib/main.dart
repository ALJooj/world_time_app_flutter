import 'package:flutter/material.dart';
import 'package:flutter_application_5/provider/event_provider.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'page/event_editing_page.dart';
import 'page/view_list_page.dart';
import 'widget/calendar_widget.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => EventProvider(),
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: const MyHomePage(title: 'Flutter Demo Home Page'),
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  bool _answer = false;
  DateTime today = DateTime.now();
  String lastDay = DateTime(2001, 1, 1).toIso8601String();
  List<String> dependsList = [];

  Future<dynamic> dialogAlert(BuildContext context, String item) {
    return showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: const Text("alert title"),
            content: Text('have you given up $item today?'),
            actions: [
              MaterialButton(
                onPressed: () {
                  _answer = true;
                  print(_answer.toString());
                  Navigator.of(context).pop();
                },
                child: Text('Yes'),
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
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // rebuildAllChildren(context);

    getLastDay();
    if (today.compareTo(DateTime.parse(lastDay)) >= 1) {
      for (var item in dependsList) {
        Future.delayed(Duration.zero, () async {
          print(item);
          dialogAlert(context, item);
          // final event = Event(title: item, desc: 'No desc for now..');
          // final provider = Provider.of<EventProvider>(context, listen: false);
          // provider.addEvent(event);
        });
      }
      setLastDay();
    }

    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        centerTitle: true,
        actions: [
          IconButton(
              onPressed: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => NavBar(dependsLis: dependsList))),
              icon: Icon(Icons.book))
        ],
      ),
      body: CalendarWidget(),
      floatingActionButton: FloatingActionButton(
          child: const Icon(Icons.add),
          onPressed: () async {
            final List<String> data = await Navigator.of(context).push(
                MaterialPageRoute(builder: (context) => EventEditingPage()));
            dependsList = data;
            print(dependsList);
          }),
    );
  }

  void getDepsList() async {
    final SharedPreferences pref = await SharedPreferences.getInstance();
    dependsList = pref.getStringList('depends')!;
  }

  void getLastDay() async {
    final SharedPreferences pref = await SharedPreferences.getInstance();
    lastDay = pref.getString('lastDay') ?? '';
  }

  void setLastDay() async {
    final SharedPreferences preferences = await SharedPreferences.getInstance();
    preferences.setString('lastDay', today.toIso8601String());
  }

  // void reloadPrefs() async {
  //   final SharedPreferences prefs = await SharedPreferences.getInstance();
  //   prefs.reload();
  // }

  // void rebuildAllChildren(BuildContext context) {
  //   void rebuild(Element el) {
  //     el.visitChildren(rebuild);
  //   }

  //   (context as Element).visitChildren(rebuild);
  // }
}
