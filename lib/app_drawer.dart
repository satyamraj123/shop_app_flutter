import 'package:flutter/material.dart';
import 'package:shop_app/orders_screen.dart';
class AppDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(child: Column(children: <Widget>[
      AppBar(title: Text('Lets Buy'),automaticallyImplyLeading: false,),
      Divider(),
      ListTile(leading:Icon(Icons.shop),title:Text('Shop'),onTap:(){
        Navigator.of(context).pushReplacementNamed('/');
      }),
       Divider(),
      ListTile(leading:Icon(Icons.shop),title:Text('Your Orders'),onTap:(){
        Navigator.of(context).pushReplacementNamed(OrdersScreen.routeName);
      }),
    ],),
      
    );
  }
}