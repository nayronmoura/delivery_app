import 'package:delivery_mobile/app/models/cart_item_model.dart';

class CartService {
  CartService._();
  static CartService? _instance;

  static CartService get instance {
    _instance ??= CartService._();
    return _instance!;
  }

  final List<CartItemModel> _cartItems = [];

  List<CartItemModel> get cartItems => _cartItems;

  void addCartItem(CartItemModel cartItem) {
    _cartItems.add(cartItem);
  }
}
