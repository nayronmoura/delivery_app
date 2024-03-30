abstract class IHttp {
  static const String baseUrl = 'http://192.168.1.10:8080';
  Future<Map<String, dynamic>> get(String url);
  Future<Map<String, dynamic>> post(String url, dynamic data);
  Future<Map<String, dynamic>> put(String url, dynamic data);
  Future<Map<String, dynamic>> delete(String url);
  Future<Map<String, dynamic>> patch(String url, dynamic data);
}
