import 'package:flutter/material.dart';


class Product {
  Product( {this.name} );
  final String name;
}


typedef void CartChangedCallback(Product product, bool inCart);


class ShoppingListItem extends StatelessWidget {
  ShoppingListItem({this.product, this.inCart, this.onCartChanged}): super(key: ObjectKey(product));

  final Product product;
  final bool inCart;
  final CartChangedCallback onCartChanged;

  Color _getColor(BuildContext context){
    return inCart ? Colors.black54 : Theme.of(context).primaryColor;
  } 

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(product.name.toString()),
      onTap: () {
        onCartChanged(product, inCart);
      },
      leading: CircleAvatar(
        backgroundColor: _getColor(context),
        child: Text(product.name[0]),
      ),
    );
  }
}


class ShoppingList extends StatefulWidget {
  ShoppingList({Key key, this.products});
  final List<Product> products;
  
  @override
  ShoppingListState createState() => ShoppingListState();
}

class ShoppingListState extends State<ShoppingList> {
  Set<Product> _shoppingCart = Set<Product>();

  void _handleCartChanged(Product product, bool inCart) {
    setState(() {
      if (!inCart) {
      _shoppingCart.add(product);
    } else {
      _shoppingCart.remove(product);
    }
    });
    
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('hi there'),
      ),
      body: ListView(
        padding: EdgeInsets.symmetric(vertical: 8.0),
        children: widget.products.map((Product product) {
          return ShoppingListItem(
            product: product,
            inCart: _shoppingCart.contains(product),
            onCartChanged: _handleCartChanged,
          );
        }).toList(),
      )
    );
  }
}


void main() {
  return runApp(MaterialApp(
    home: ShoppingList(
      products: <Product>[
        Product(name: 'Eggs'),
        Product(name: 'Flour'),
        Product(name: 'Chocolate chips'),
      ]
    ),
  ));
}