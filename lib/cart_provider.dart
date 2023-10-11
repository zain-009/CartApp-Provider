import 'package:flutter/cupertino.dart';

import 'models/product_model.dart';

class CartProvider extends ChangeNotifier {
  Map<Product, int> cartItems = {};

  void addToCart(Product product) {
    if (product != null) {
      if (cartItems.containsKey(product)) {
        cartItems[product] = (cartItems[product] ?? 0) + 1;
      } else {
        cartItems[product] = 1;
      }
      notifyListeners();
    }
  }

  void removeFromCart(Product product) {
    if (product != null) {
      if (cartItems.containsKey(product)) {
        cartItems[product] = (cartItems[product] ?? 0) - 1;
        if (cartItems[product] == 0) {
          cartItems.remove(product);
        }
        notifyListeners();
      }
    }
  }

  double calculateTotal() {
    double total = 0.0;
    for (var product in cartItems.keys) {
      total += product.price * cartItems[product]!;
    }
    return total;
  }

}
