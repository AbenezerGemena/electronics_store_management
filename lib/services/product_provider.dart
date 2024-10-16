import 'package:flutter/material.dart';



class ProductModel {
  final String productName;
  final String productType;
  final int quantity; 

  ProductModel({
    required this.productName,
    required this.productType,
    required this.quantity,
  });
}



class ProductProvider extends ChangeNotifier {
  List<ProductModel> _products = [];

  List<ProductModel> get products => _products;

  void addProduct(ProductModel product) {
    _products.add(product);
    notifyListeners(); 
  }
}