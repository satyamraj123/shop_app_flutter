import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'cart.dart' show Cart;
import 'cart_item.dart';
import 'orders.dart';

class CartScreen extends StatelessWidget {
  static const routeName = 'cartscreen';
  @override
  Widget build(BuildContext context) {
    final cart = Provider.of<Cart>(context);
    return Scaffold(
        appBar: AppBar(
          title: Text('Your Cart'),
        ),
        body: Column(
          children: <Widget>[
            Card(
              margin: EdgeInsets.all(15),
              child: Padding(
                padding: EdgeInsets.all(8),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text(
                      'Total',
                      style: TextStyle(fontSize: 20),
                    ),
                    Spacer(),
                    Chip(
                      label: Text(
                        '₹' + cart.totalAmount.toString(),
                        style: TextStyle(color: Colors.white),
                      ),
                      backgroundColor: Theme.of(context).primaryColor,
                    ),
                    FlatButton(
                        onPressed: () {
                          Provider.of<Orders>(context, listen: false).addOrder(
                              cart.items.values.toList(), cart.totalAmount);
                              cart.clear();
                        },
                        child: Text(
                          'Order Now',
                          style: Theme.of(context).textTheme.title,
                        )),
                  ],
                ),
              ),
            ),
            SizedBox(height: 20),
            Expanded(
              child: ListView.builder(
                itemBuilder: (ctx, i) => CartItem(
                    cart.items.values.toList()[i].id,
                    cart.items.keys.toList()[i],
                    cart.items.values.toList()[i].price,
                    cart.items.values.toList()[i].quantity,
                    cart.items.values.toList()[i].title),
                itemCount: cart.items.length,
              ),
            )
          ],
        ));
  }
}
