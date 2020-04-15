import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'cart.dart';

class CartItem extends StatelessWidget {
  final String id;
  final String productId;
  final double price;
  final int quantity;
  final String title;
  CartItem(this.id,this.productId, this.price, this.quantity, this.title);
  @override
  Widget build(BuildContext context) {
    return Dismissible(
      onDismissed: (direcion){Provider.of<Cart>(context,listen: false).removeItem(productId);},
      key: ValueKey(id),
      background: Container(
decoration: BoxDecoration(borderRadius: BorderRadius.circular(15),color: Theme.of(context).errorColor),
        padding: EdgeInsets.only(left: 20,right: 20),
        margin: EdgeInsets.symmetric(horizontal: 15, vertical: 4),
        child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          
          Icon(Icons.delete,color: Colors.white,size: 40,),
          Icon(Icons.delete,color: Colors.white,size: 40,),
        ],
      ),),
          child: Card(
shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
        margin: EdgeInsets.symmetric(horizontal: 15, vertical: 4),
        child: Padding(
          padding: EdgeInsets.all(8),
          child: ListTile(
              leading: CircleAvatar(child: Padding(padding:EdgeInsets.all(5),child: FittedBox(child: Text('₹' + price.toString())))),
              title: Text(title),
              subtitle: Text("Total: ₹${price*quantity}"),
              trailing: Text(quantity.toString()+'X'),),
        ),
      ),
    );
  }
}
