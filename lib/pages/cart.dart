import 'package:flutter/material.dart';

class CartModel extends ChangeNotifier {
  // list of items on sale
  final List _shopItems = [
    ["Apple", "10", 'lib/images/apple.png', Colors.red],
    ["Burger", "50", 'lib/images/burger.png', Colors.brown],
    ["Pizza", "100", 'lib/images/pizza.png', Colors.orange],
    ["Cheery", "75", 'lib/images/cheery.png', Colors.green],
  ];
  List _cartitems = [];
  get cartItems => _cartitems;
  get shopItems => _shopItems;

  // add items to cart
  void addItemToCart(int index) {
    _cartitems.add(_shopItems[index]);
    notifyListeners();
  }

// remove items from car
  void removeItemFromCart(int index) {
    _cartitems.removeAt(index);
    notifyListeners();
  }

  // calculate total price
  String calculateTotal() {
    double totalPrice = 0;
    for (int i = 0; i < _cartitems.length; i++) {
      totalPrice += double.parse(_cartitems[i][1]);
    }
    return totalPrice.toStringAsFixed(2);
  }
}
