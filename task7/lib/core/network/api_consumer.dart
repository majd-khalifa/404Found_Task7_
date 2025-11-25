// ignore_for_file: avoid_print

import 'package:dio/dio.dart';

class ApiConsumer {
  final Dio _dio =
      Dio(
          BaseOptions(
            baseUrl: "https://fakestoreapi.com",
            connectTimeout: Duration(seconds: 10),
            receiveTimeout: Duration(seconds: 10),
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
  } //تابع التعديل يسخدم في واجهة البروفايل
}
