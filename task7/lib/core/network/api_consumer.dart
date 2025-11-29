import 'package:dio/dio.dart';

class ApiConsumer {
  late final Dio _dio;
  ApiConsumer(String url) {
     _dio =
        Dio(
            BaseOptions(
              baseUrl: url,
              connectTimeout: Duration(seconds: 30),
              receiveTimeout: Duration(seconds: 30),
              headers: {"Content-Type": "application/json"},
            ),
          )
          ..interceptors.add(
            InterceptorsWrapper(
              onRequest: (options, handler) {
                print("[${options.method}][${options.uri}]");
                handler.next(options);
              },
              onResponse: (response, handler) {
                print("${response.data}");
                handler.next(response);
              },
              onError: (error, handler) {
                print(error.message);
                handler.next(error);
              },
            ),
          );
  }

  Future<dynamic> post(String endpoint, {Map<String, dynamic>? body}) async {
    final response = await _dio.post(endpoint, data: body);
    return response.data;
  }

  Future<dynamic> get(String endpoint) async {
    final response = await _dio.get(endpoint);
    return response.data;
  }

  Future<dynamic> update(String endpoint, {Map<String, dynamic>? body}) async {
    final response = await _dio.put(endpoint, data: body);
    return response.data;
  }
}
