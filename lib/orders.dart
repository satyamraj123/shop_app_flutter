import 'package:flutter/cupertino.dart';
import 'package:shop_app/cart.dart';

class OrderItem {
  @required
  final String id;
  @required
  final double amount;
  @required
  final List<CartItem> products;
  @required
  final DateTime datetime;

  OrderItem({this.id, this.amount, this.products, this.datetime});
}

class Orders with ChangeNotifier {
  List<OrderItem> _orders = [];
  List<OrderItem> get orders {
    return [..._orders];
  }

  void addOrder(List<CartItem> cartproducts, double total) {
    _orders.insert(
        0,
        OrderItem(
            amount: total,
            datetime: DateTime.now(),
            id: DateTime.now().toString(),
            products: cartproducts));
notifyListeners();            
  }

}
