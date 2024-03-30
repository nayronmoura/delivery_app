import 'package:delivery_mobile/app/core/interfaces/http_interface.dart';
import 'package:delivery_mobile/app/models/product_model.dart';

class ProductService {
  final IHttp _http;

  ProductService(this._http);

  Future<List<ProductModel>> getProducts({
    ProductCategory? category,
  }) async {
    final result = await _http.post('/api/product/filtered', {
      if (category != null) 'category': category.toApi,
    });

    return (result['response'] as List)
        .map((product) => ProductModel.fromJson(product))
        .toList();
  }
}
