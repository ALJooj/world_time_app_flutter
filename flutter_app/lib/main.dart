import 'package:flutter/material.dart';

void main() => runApp(MaterialApp(
  home: IdCard(),
));

class IdCard extends StatefulWidget {
  @override
  _IdCardState createState() => _IdCardState();
}

class _IdCardState extends State<IdCard> {

  int level = 2;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[900],
      appBar: AppBar(
        title: Text('ID Card'),
        backgroundColor: Colors.grey[800],
        elevation: 0,
      ),

      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            level += 1;
          });
        },
        child: Icon(Icons.add),
        backgroundColor: Colors.grey[800],
      ),

      body: Padding(
        padding: const EdgeInsets.fromLTRB(30, 40, 30, 0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Center(
              child: CircleAvatar(
                backgroundImage: AssetImage('images/avatatr.jpg'),
                radius: 40,
              ),
            ),
            Divider(
              height: 60,
              color: Colors.grey[800],
            ),

            Text(
              'NAME',
              style: TextStyle(
                letterSpacing: 2,
                color: Colors.grey,
//                fontSize: 19,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 10,),
            Text(
              'Mark',
              style: TextStyle(
                letterSpacing: 1,
                color: Colors.limeAccent,
                fontSize: 28,
                fontWeight: FontWeight.bold,
              ),
            ),

            SizedBox(height: 30,),
            Text(
              'LEVEL',
              style: TextStyle(
                letterSpacing: 1,
                color: Colors.grey,
//                fontSize: 19,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 10,),
            Text(
              '$level',
              style: TextStyle(
                letterSpacing: 1,
                color: Colors.limeAccent,
                fontSize: 28,
                fontWeight: FontWeight.bold,
              ),
            ),

            SizedBox(height: 30,),
            Row(
              children: <Widget>[
                Icon(
                  Icons.email,
                  color: Colors.grey[400],
                ),
                SizedBox(width: 10,),
                Text(
                  'test@mail.com',
                  style: TextStyle(
                    color: Colors.grey,
                    letterSpacing: 1,
                    fontSize: 18
                  ),
                )
              ],
            )


          ],
        ),
      ),
    );
  }
}
