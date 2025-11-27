import 'package:dio/dio.dart';

/// ✅ ApiConsumer: ملف عام للتعامل مع الطلبات HTTP باستخدام Dio.
/// كل Repository يستدعي هذا الملف بدل ما يكرر نفس الكود.
class ApiConsumer {
  final Dio dio;

  ApiConsumer(this.dio);

  /// ✅ GET request
  Future<dynamic> get(
    String path, {
    Map<String, dynamic>? queryParameters,
  }) async {
    final response = await dio.get(path, queryParameters: queryParameters);
    return response.data;
  }

  /// ✅ POST request
  Future<dynamic> post(
    String path, {
    dynamic data,
    Map<String, dynamic>? queryParameters,
  }) async {
    final response = await dio.post(
      path,
      data: data,
      queryParameters: queryParameters,
    );
    return response.data;
  }

  /// ✅ PUT request
  Future<dynamic> put(
    String path, {
    dynamic data,
    Map<String, dynamic>? queryParameters,
  }) async {
    final response = await dio.put(
      path,
      data: data,
      queryParameters: queryParameters,
    );
    return response.data;
  }

  /// ✅ DELETE request
  Future<dynamic> delete(
    String path, {
    dynamic data,
    Map<String, dynamic>? queryParameters,
  }) async {
    final response = await dio.delete(
      path,
      data: data,
      queryParameters: queryParameters,
    );
    return response.data;
  }
}
