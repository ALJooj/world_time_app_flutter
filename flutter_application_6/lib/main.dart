import 'package:flutter/material.dart';
import 'package:flutter_application_6/user_prefs.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'notes.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  UserSimplePreferences.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.grey,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final formKey = GlobalKey<FormState>();
  String name = '';
  final TextEditingController _controller = TextEditingController();

  @override
  void initState() {
    super.initState();
    name = UserSimplePreferences.getUsername() ?? '123';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Shared Preferences'),
      ),
      body: SafeArea(
        child: ListView(
          padding: const EdgeInsets.all(16),
          children: [
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: buildName(),
            ),
            MaterialButton(
              child: Text('Save'),
              onPressed: () async {
                setNotesData(_controller.text);
                await UserSimplePreferences.setUsername(name);
              },
            ),
            MaterialButton(
              child: Text('View Notes'),
              onPressed: () {
                Navigator.of(context)
                    .push(MaterialPageRoute(builder: (context) => NotesPage()));
              },
            ),
            TextField(
              controller: _controller,
            )
          ],
        ),
      ),
    );
  }

  Future<void> setNotesData(val) async {
    final SharedPreferences pref = await SharedPreferences.getInstance();
    pref.setString('username2', val);
  }

  TextFormField buildName() {
    return TextFormField(
      initialValue: name,
      decoration: const InputDecoration(
        hintText: 'enter your name',
        border: OutlineInputBorder(),
      ),
      onChanged: (name) => setState(() {
        this.name = name;
        print(this.name);
      }),
    );
  }
}
