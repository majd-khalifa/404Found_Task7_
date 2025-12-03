import 'package:dio/dio.dart';
import '../../../core/network/api_consumer.dart';
import '../../../core/network/api_constants.dart';
import '../model/details_product_model.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

class DetailsRepository {
  final ApiConsumer api = ApiConsumer(ApiConstants.producturl);

  DetailsRepository();

  Future<DetailsProductModel> getProductDetails(int id) async {
    try {
      final response = await api.get("${ApiConstants.products}/$id");
      return DetailsProductModel.fromJson(response);
      // ignore: deprecated_member_use
    } on DioError catch (e) {
      throw Exception("Failed to load product details: ${e.message}");
    }
  }

  Future<List<DetailsProductModel>> getAllProducts() async {
    final response = await http.get(
      Uri.parse('https://fakestoreapi.com/products'),
    );
    final data = jsonDecode(response.body) as List;
    return data.map((e) => DetailsProductModel.fromJson(e)).toList();
  }
}
