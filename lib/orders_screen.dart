import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop_app/app_drawer.dart';
import 'orders.dart';
import 'order_item.dart' as o;
class OrdersScreen extends StatelessWidget {
  static const routeName='orders';
  @override
  Widget build(BuildContext context) {
    final orderData=Provider.of<Orders>(context);
    return Scaffold(
      appBar: AppBar(title:Text('Your Orders')),
      drawer: AppDrawer(),
      body: ListView.builder(itemBuilder: (ctx,i)=>o.OrderItem(orderData.orders[i]),itemCount: orderData.orders.length,),
      
    );
  }
}