import 'package:flutter/material.dart';
import 'package:weather_flutter/domain/model/product.dart';
import 'package:weather_flutter/domain/repository/api_repository.dart';

class ProductsBLoC extends ChangeNotifier {
  final ApiRepositoryInterface apiRepositoryInterface;

  ProductsBLoC({this.apiRepositoryInterface});

  List<Product> productList = <Product>[];

  void loadProducts() async {
    final result = await apiRepositoryInterface.getProducts();
    productList = result;
    notifyListeners();
  }
}
