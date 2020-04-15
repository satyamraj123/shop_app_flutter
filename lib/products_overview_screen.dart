import 'package:flutter/material.dart';
import 'package:shop_app/app_drawer.dart';
import 'products_grid.dart';
import 'badge.dart';
import 'package:provider/provider.dart';
import 'cart.dart';
import 'cart_screen.dart';

enum FilterOtptions { Faviourites, All }

class ProductsOverviewScreen extends StatefulWidget {
  @override
  _ProductsOverviewScreenState createState() => _ProductsOverviewScreenState();
}

class _ProductsOverviewScreenState extends State<ProductsOverviewScreen> {
  var showFavourites = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Shop App'),
        actions: <Widget>[
          PopupMenuButton(
              onSelected: (FilterOtptions selectedValue) {
                setState(() {
                  if (selectedValue == FilterOtptions.Faviourites) {
                    showFavourites = true;
                  } else {
                    showFavourites = false;
                  }
                });
              },
              icon: Icon(Icons.more_vert),
              itemBuilder: (_) => [
                    PopupMenuItem(
                        child: Text('Only Favourite'),
                        value: FilterOtptions.Faviourites),
                    PopupMenuItem(
                        child: Text('Show All'), value: FilterOtptions.All),
                  ]),
          Consumer<Cart>(
              builder: (_, cart, ch) =>
                  Badge(child: ch, value: cart.itemCount.toString()),
              child:
                  IconButton(icon: Icon(Icons.shopping_cart), onPressed: (){Navigator.of(context).pushNamed(CartScreen.routeName);}))
        ],
      ),
      drawer: AppDrawer(),
      body: ProductsGrid(showFavourites),
    );
  }
}
