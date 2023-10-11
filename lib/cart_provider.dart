import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'models/product_model.dart';

class CartProvider extends ChangeNotifier {
  List<Product> cartItems = [];

  void addToCart(Product product) {
    cartItems.add(product);
    notifyListeners();
  }

  void removeFromCart(Product product) {
    cartItems.remove(product);
    notifyListeners();
  }
}
