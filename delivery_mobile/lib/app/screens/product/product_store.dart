import 'package:delivery_mobile/app/models/cart_item_model.dart';
import 'package:delivery_mobile/app/services/cart_service.dart';
import 'package:flutter/material.dart';

enum ProductStoreStatus { LOADING, CONTENT, ADDED_TO_CART }

extension ProductStoreStatusX on ProductStoreStatus {
  bool get isLoading => this == ProductStoreStatus.LOADING;
  bool get isContent => this == ProductStoreStatus.CONTENT;
  bool get isAddedToCart => this == ProductStoreStatus.ADDED_TO_CART;
}

class ProductStore with ChangeNotifier {
  final CartService _cartService = CartService.instance;

  int productCount = 1;

  ProductStoreStatus status = ProductStoreStatus.LOADING;

  void addProduct() {
    productCount++;
    notifyListeners();
  }

  void fetchProduct() {
    emitLoading();

    emitContent();
  }

  void removeProduct() {
    productCount--;
    notifyListeners();
  }

  void addToCart() {
    _cartService.addCartItem(
        CartItemModel(id: 0, name: 'name', quantity: productCount));

    emitAddedToCart();
  }

  void emitContent() {
    status = ProductStoreStatus.CONTENT;
    notifyListeners();
  }

  void emitLoading() {
    status = ProductStoreStatus.LOADING;
    notifyListeners();
  }

  void emitAddedToCart() {
    status = ProductStoreStatus.ADDED_TO_CART;
    notifyListeners();
  }
}
