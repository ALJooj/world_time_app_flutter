import 'package:flutter/material.dart';
import 'package:flutter_application_5/model/event.dart';
import 'package:flutter_application_5/provider/event_provider.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class EventEditingPage extends StatefulWidget {
  final Event? event;

  const EventEditingPage({Key? key, this.event}) : super(key: key);

  @override
  _EventEditingPageState createState() => _EventEditingPageState();
}

class _EventEditingPageState extends State<EventEditingPage> {
  final _formKey = GlobalKey<FormState>();
  final titleController = TextEditingController();
  List<String> dependsList = [];

  @override
  void dispose() {
    titleController.dispose();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    getDepsList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: CloseButton(),
        actions: buildEditingActions(),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(12),
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              buildTitle(),
            ],
          ),
        ),
      ),
    );
  }

  List<Widget> buildEditingActions() => [
        ElevatedButton.icon(
          onPressed: saveForm,
          icon: Icon(Icons.done),
          label: Text('save me'),
        ),
      ];

  Widget buildTitle() => TextFormField(
        style: TextStyle(fontSize: 24),
        decoration: const InputDecoration(
          border: UnderlineInputBorder(),
          hintText: 'Add title',
        ),
        onFieldSubmitted: (_) => saveForm(),
        controller: titleController,
        validator: (title) =>
            title != null && title.isEmpty ? 'Title can not be empty' : null,
      );

  Future saveForm() async {
    final isValid = _formKey.currentState!.validate();

    if (isValid) {
      final event =
          Event(title: titleController.text, desc: 'No desc for now..');
      final provider = Provider.of<EventProvider>(context, listen: false);
      provider.addEvent(event);

      //  SET FUNC
      final SharedPreferences pref = await SharedPreferences.getInstance();
      //  dependences
      dependsList.add(titleController.text);
      pref.setStringList('depends', dependsList);
      // print('event editing $dependsList');
      //  datetime
      pref.setString(
          titleController.text,
          DateTime.now()
              .add(Duration(days: 1))
              .toIso8601String()
              .substring(0, 10));

      //  nav pop
      Navigator.of(context).pop(dependsList);
    }
  }

  void getDepsList() async {
    final SharedPreferences pref = await SharedPreferences.getInstance();
    dependsList = pref.getStringList('depends')!;
  }
}
