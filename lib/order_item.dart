import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'dart:math';
import 'orders.dart' as ord;

class OrderItem extends StatefulWidget {
  final ord.OrderItem order;
  OrderItem(this.order);

  @override
  _OrderItemState createState() => _OrderItemState();
}

class _OrderItemState extends State<OrderItem> {
  var _expanded = false;
  @override
  Widget build(BuildContext context) {
    return Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
        margin: EdgeInsets.symmetric(horizontal: 15, vertical: 4),
        child: Padding(
          padding: EdgeInsets.all(8),
          child: Column(
            children: <Widget>[
              ListTile(
                title: Text('₹ ' + widget.order.amount.toString()),
                subtitle: Text(DateFormat('dd MM yyyy hh:mm')
                    .format(widget.order.datetime)),
                trailing: IconButton(
                    icon: _expanded
                        ? Icon(Icons.expand_less)
                        : Icon(Icons.expand_more),
                    onPressed: () {
                      setState(() {
                        _expanded = !_expanded;
                      });
                    }),
              ),
              if (_expanded)
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 16,vertical: 4),
                    height: min(widget.order.products.length * 20.0 + 10, 180),
                    child: ListView(
                      children: widget.order.products
                          .map((prod) => Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: <Widget>[
                                  Text(prod.title,style:TextStyle(fontSize: 18,fontWeight: FontWeight.bold)),
                                  Text(prod.quantity.toString() +
                                      'X' +
                                      prod.price.toString(),style: TextStyle(color:Colors.grey,fontSize:18),)
                                ],
                              ))
                          .toList(),
                    )),
            ],
          ),
        ));
  }
}
