import 'package:delivery_mobile/app/models/product_model.dart';
import 'package:delivery_mobile/app/services/product_service.dart';
import 'package:flutter/material.dart';

enum HomeState { loading, content, error }

extension HomeStateExt on HomeState {
  bool get isLoading => this == HomeState.loading;
  bool get iscontent => this == HomeState.content;
  bool get isError => this == HomeState.error;
}

class HomeStore with ChangeNotifier {
  final ProductService _productService;
  HomeStore(this._productService);

  HomeState state = HomeState.loading;
  List<ProductModel> products = [];

  String? categorySelected;

  void setCategorySelected(String? value) {
    categorySelected = value;
    notifyListeners();
  }

  void setState(HomeState value) {
    state = value;
    notifyListeners();
  }

  void fetchData() async {
    try {
      emitLoading();
      products = await _productService.getProducts();
      emitContent();
    } catch (e) {
      emitError();
    }
  }

  void emitLoading() {
    state = HomeState.loading;
    notifyListeners();
  }

  void emitContent() {
    state = HomeState.content;
    notifyListeners();
  }

  void emitError() {
    state = HomeState.error;
    notifyListeners();
  }
}
