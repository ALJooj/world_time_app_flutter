import 'package:flutter/material.dart';
import 'quotes.dart';


class QuoteCard extends StatelessWidget {

  final Quotes quote;
  final Function delete;
  QuoteCard({ this.quote, this.delete });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.fromLTRB(16, 16, 16, 0),
      child: Padding(
        padding: const EdgeInsets.all(8),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Text(
              quote.text,
              style: TextStyle(
                fontSize: 18,
                color: Colors.grey[600],
              ),
            ),
            SizedBox(height: 6,),
            Text(
              quote.author,
              style: TextStyle(
                  fontSize: 14,
                  color: Colors.grey[800]
              ),
            ),
            SizedBox(height: 10,),
            Center(
              child: FlatButton.icon(
                onPressed: delete,
                label: Text('delete'),
                icon: Icon(Icons.delete),
              ),
            )
          ],
        ),
      ),
    );
  }
}
