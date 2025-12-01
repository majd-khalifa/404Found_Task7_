// ignore_for_file: deprecated_member_use

import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:http/http.dart' as http;
import '../../../core/network/api_consumer.dart';
import '../../../core/network/api_constants.dart';
import '../model/home_product_model.dart';

class HomeRepository {
  final ApiConsumer api = ApiConsumer(ApiConstants.producturl);

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

  Future<HomeProductModel> getProductById(int id) async {
    try {
      final response = await api.get("${ApiConstants.users}/$id");

      if (response is Map<String, dynamic>) {
        return HomeProductModel.fromJson(response);
      } else {
        throw Exception("Unexpected response format: $response");
      }
    } on DioError catch (e) {
      throw Exception("Failed to load product: ${e.message}");
    }
  }

  Future<List<String>> getCategories() async {
    final response = await http.get(
      Uri.parse("https://fakestoreapi.com/products/categories"),
    );
    if (response.statusCode == 200) {
      final List data = json.decode(response.body);
      return data.map((item) => item.toString()).toList();
    } else {
      throw Exception("Failed to fetch categories");
    }
  }
}
