import 'package:flutter/material.dart';
import 'quotes.dart';
import 'quote_card.dart';

void main() => runApp(MaterialApp(
  home: QuoteList(),
));


class QuoteList extends StatefulWidget {
  @override
  _QuoteListState createState() => _QuoteListState();
}

class _QuoteListState extends State<QuoteList> {

  List<Quotes> quotes = [
    Quotes(author: 'A. Pushkin', text: 'Lorem ipsum godness sees us',),
    Quotes(author: 'A. Pushkin', text: 'i have nothing to declare expect my geniuss',),
    Quotes(author: 'A. Pushkin', text: 'The truth is rarely pure and never simple',)
  ];

//  Widget quoteTemplate(quote) {
//    return QuoteCard(quote: quote,);
//  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {
          setState(() {
            quotes.add(Quotes(text: 'dddd', author: 'lolita'));
          });
        },
      ),

      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        title: Text('Awesome quote'),
        centerTitle: true,
        backgroundColor: Colors.redAccent,
      ),
      body: Column(
        children: quotes.map((quote) {
          return QuoteCard(
            quote: quote,
            delete: () {
              setState(() {
                quotes.remove(quote);
              });
            },
          );
        }).toList(),
      ),
    );
  }
}

