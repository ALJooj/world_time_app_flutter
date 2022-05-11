import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class NavBar extends StatefulWidget {
  NavBar({Key? key, required this.dependsLis}) : super(key: key);
  List<String>? dependsLis;
  @override
  State<NavBar> createState() => _NavBarState();
}

class _NavBarState extends State<NavBar> {
  String itemToDelete = '';

  @override
  Widget build(BuildContext context) {
    // getDepsList();\
    // reloadPrefs();
    print('depends list navbar ${widget.dependsLis}');

    return Scaffold(
      appBar: AppBar(
        leading: CloseButton(),
      ),
      body: ListView(
        padding: EdgeInsets.fromLTRB(30, 60, 0, 0),
        children: [
          for (var item in widget.dependsLis ?? [])
            Row(
              children: [
                Expanded(
                  child: ListTile(
                    title: Text(item.toString()),
                  ),
                  flex: 2,
                ),
                Expanded(
                  child: IconButton(
                    icon: Icon(Icons.delete),
                    onPressed: () {
                      setState(() {
                        itemToDelete = item;
                      });
                      setDependList();
                    },
                  ),
                  flex: 1,
                ),
              ],
            ),
        ],
      ),
    );
  }

  void setDependList() async {
    final SharedPreferences pref = await SharedPreferences.getInstance();
    widget.dependsLis?.remove(itemToDelete);
    pref.setStringList('depends', widget.dependsLis ?? []);
  }
}
