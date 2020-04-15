import 'package:flutter/material.dart';
import 'package:shop_app/cart.dart';
import 'package:shop_app/cart_screen.dart';
import 'package:shop_app/orders.dart';
import 'package:shop_app/orders_screen.dart';
import 'package:shop_app/product_details_screen.dart';
import 'package:shop_app/products.dart';
import 'package:shop_app/products_overview_screen.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (ctx) => Products(),
        ),
        ChangeNotifierProvider.value(
          value: Cart(),
        ),
        ChangeNotifierProvider.value(
          value: Orders()
          ),

      ],
      child: MaterialApp(
        theme: ThemeData(
          primarySwatch: Colors.orange,
          accentColor: Colors.deepOrange,
          fontFamily: 'Lato',
          textTheme: TextTheme(
            title: TextStyle(
                color: Colors.orange,
                fontFamily: 'Lato',
                fontWeight: FontWeight.bold,
                fontSize: 20),
          ),
        ),
        home: ProductsOverviewScreen(),
        routes: {
          ProductDetailsScreen.routeName: (ctx) => ProductDetailsScreen(),
          CartScreen.routeName: (ctx) => CartScreen(),
          OrdersScreen.routeName:(ctx)=>OrdersScreen(),
        },
      ),
    );
  }
}
