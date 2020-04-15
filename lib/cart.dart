import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';

class CartItem {
  final String id;
  final String title;
  final int quantity;
  final double price;
  CartItem({
    @required this.id,
    @required this.title,
    @required this.quantity,
    @required this.price,
  });
}

class Cart with ChangeNotifier {
  Map<String, CartItem> _items={};
  Map<String, CartItem> get items {
    return {..._items};
  }
  double get totalAmount{
    var total =0.0;
    items.forEach((key,cartItem){
      total+=cartItem.price*cartItem.quantity;
    });
    return total;
  }
int get itemCount{
  return items==null?0:items.length;
}
void removeItem(String productid){
  _items.remove(productid);
  notifyListeners();
}
void clear(){
  _items={};
  notifyListeners();
}
  void addItem(String productId, double price, String title) {
    if (_items.containsKey(productId)) {
      _items.update(
          productId,
          (existingCartItem) => CartItem(
              id: existingCartItem.id,
              title: existingCartItem.title,
              quantity: existingCartItem.quantity + 1,
              price: existingCartItem.price));
    } else {
      _items.putIfAbsent(
          productId,
          () => CartItem(
              id: DateTime.now().toString(),
              title: title,
              price: price,
              quantity: 1));
    }
    notifyListeners();
  }
}
