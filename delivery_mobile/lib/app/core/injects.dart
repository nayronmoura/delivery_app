import 'package:delivery_mobile/app/core/interfaces/http_interface.dart';
import 'package:delivery_mobile/app/services/dio_service.dart';
import 'package:delivery_mobile/app/services/product_service.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';

final getIt = GetIt.instance;

void setup() {
  getIt.registerFactory<Dio>(() => Dio(BaseOptions(baseUrl: IHttp.baseUrl)));

  getIt.registerFactory<IHttp>(() => DioService(getIt<Dio>()));
  getIt.registerFactory<ProductService>(() => ProductService(getIt<IHttp>()));
}
