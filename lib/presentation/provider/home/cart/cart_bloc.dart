import 'package:flutter/material.dart';
import 'package:weather_flutter/domain/model/product.dart';
import 'package:weather_flutter/domain/model/product_cart.dart';

class CartBLoC extends ChangeNotifier {
  List<ProductCart> cartList = <ProductCart>[];
  int totalItems = 0;
  double totalPrice = 0.0;

  void add(Product product) {
    final temp = List<ProductCart>.from(cartList);
    bool found = false;
    for (ProductCart p in temp) {
      if (p.product.name == product.name) {
        p.quantity += 1;
        found = true;
        break;
      }
    }
    if (!found) {
      temp.add(ProductCart(product: product));
    }
    cartList = List<ProductCart>.from(temp);
    calculateTotals(temp);
  }

  void increment(ProductCart productCart) {
    productCart.quantity += 1;
    cartList = List<ProductCart>.from(cartList);
    calculateTotals(cartList);
  }

  void decrement(ProductCart productCart) {
    if (productCart.quantity > 1) {
      productCart.quantity -= 1;
      cartList = List<ProductCart>.from(cartList);
      calculateTotals(cartList);
    }
  }

  void calculateTotals(List<ProductCart> temp) {
    final total = temp.fold(0, (previousValue, element) => element.quantity + previousValue);
    totalItems = total;
    final totalCost =
        temp.fold(0.0, (previousValue, element) => (element.quantity * element.product.price) + previousValue);
    totalPrice = totalCost;
    notifyListeners();
  }

  void deleteProduct(ProductCart productCart) {
    cartList.remove(productCart);
    calculateTotals(cartList);
  }
}
