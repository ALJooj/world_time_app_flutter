import 'package:flutter/material.dart';


class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override

  Map data = {};

  Widget build(BuildContext context) {

    data = data.isNotEmpty ? data: ModalRoute.of(context).settings.arguments;
    print(data);

    return Scaffold(
      body: SafeArea(
        child: Column(
          children: <Widget>[
            FlatButton.icon(
              onPressed: () async {
                dynamic result = await Navigator.pushNamed(context, '/location');
                setState(() {
                  data['time'] = result['time'];
                  data['flag'] = result['flag'];
                  data['location'] = result['location'];
                });
              },
              icon: Icon(Icons.edit_location),
              label: Text('to the locations'),
            ),
            Text(data['time']),
            Text(data['location'])
          ],
        )
      ),
    );
  }
}
