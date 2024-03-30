import 'package:delivery_mobile/app/core/interfaces/http_interface.dart';
import 'package:dio/dio.dart';

class DioService implements IHttp {
  final Dio _dio;

  DioService(this._dio);

  @override
  Future<Map<String, dynamic>> delete(String url) async {
    final result = await _dio.delete(url);
    return result.data;
  }

  @override
  Future<Map<String, dynamic>> get(String url) async {
    final result = await _dio.get(url);
    return result.data;
  }

  @override
  Future<Map<String, dynamic>> patch(String url, data) async {
    final result = await _dio.patch(url, data: data);
    return result.data;
  }

  @override
  Future<Map<String, dynamic>> post(String url, data) async {
    final result = await _dio.post(url, data: data);
    return result.data;
  }

  @override
  Future<Map<String, dynamic>> put(String url, data) async {
    final result = await _dio.put(url, data: data);
    return result.data;
  }
}
