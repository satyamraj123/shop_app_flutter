import 'package:flutter/material.dart';
import 'products.dart';
import 'package:provider/provider.dart';

class ProductDetailsScreen extends StatelessWidget {
  static const routeName = 'product detail screen';
  @override
  Widget build(BuildContext context) {
    final productId = ModalRoute.of(context).settings.arguments as String;
    final loadedProduct =
        Provider.of<Products>(context, listen: false).findById(productId);

    return Scaffold(
        appBar: AppBar(title: Text(loadedProduct.title)),
        body: SingleChildScrollView(
                  child: Column(
            children: <Widget>[
              Container(
                  width: double.infinity,
                  height: 300,
                  child:
                      Image.network(loadedProduct.imageUrl, fit: BoxFit.cover)),
                      SizedBox(height:10),
                      Text('₹ '+loadedProduct.price.toString(),style: TextStyle(color:Colors.grey,fontSize:20,),),
                       SizedBox(height:10),
                       Container(padding:EdgeInsets.all(10),width:double.infinity,child: Text(loadedProduct.description,softWrap: true,))
            ],
          ),
        ));
  }
}
