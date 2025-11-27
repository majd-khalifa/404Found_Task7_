// ignore_for_file: deprecated_member_use

import 'package:dio/dio.dart';
import '../../../core/network/api_consumer.dart';
import '../../../core/network/api_constants.dart';
import '../model/home_product_model.dart';

class HomeRepository {
  final ApiConsumer api;

  HomeRepository(this.api);

  /// ✅ جلب كل المنتجات
  Future<List<HomeProductModel>> getProducts() async {
    try {
      final response = await api.get(ApiConstants.products);

      if (response is List) {
        return response.map((json) => HomeProductModel.fromJson(json)).toList();
      } else {
        throw Exception("Unexpected response format: $response");
      }
    } on DioError catch (e) {
      throw Exception("Failed to load products: ${e.message}");
    }
  }

  /// ✅ جلب منتج واحد حسب الـ id
  Future<HomeProductModel> getProductById(int id) async {
    try {
      final response = await api.get("${ApiConstants.products}/$id");

      if (response is Map<String, dynamic>) {
        return HomeProductModel.fromJson(response);
      } else {
        throw Exception("Unexpected response format: $response");
      }
    } on DioError catch (e) {
      throw Exception("Failed to load product: ${e.message}");
    }
  }
}
