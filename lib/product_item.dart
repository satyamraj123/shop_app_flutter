import 'package:flutter/material.dart';
import 'package:shop_app/product_details_screen.dart';
import 'product.dart';
import 'package:provider/provider.dart';
import 'cart.dart';
class ProductItem extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    final product=Provider.of<Product>(context);
    final cart=Provider.of<Cart>(context,listen: false);
    return ClipRRect(
      borderRadius: BorderRadius.circular(10),
      
          child: GridTile(
      
        child: InkWell(
          splashColor: Theme.of(context).primaryColor,
          onTap: (){
            Navigator.of(context).pushNamed(ProductDetailsScreen.routeName,arguments: product.id);
          },
                  child: Image.network(
            product.imageUrl,
            fit: BoxFit.cover,
          ),
        ),
        
        footer: GridTileBar(

          trailing: IconButton(icon: Icon(Icons.shopping_cart), onPressed: (){cart.addItem(product.id, product.price, product.title);},color: Theme.of(context).accentColor,),
            leading: IconButton(icon: Icon(product.isFavourite?Icons.favorite:Icons.favorite_border), onPressed: (){product.toggleFavourite();},color: Theme.of(context).accentColor,),
            backgroundColor: Colors.black87,
            title: Text(product.title, textAlign: TextAlign.center,softWrap: true,)),
      ),
    );
  }
}
