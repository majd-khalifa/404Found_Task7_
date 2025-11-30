import 'package:dio/dio.dart';
import '../../../core/network/api_consumer.dart';
import '../../../core/network/api_constants.dart';
import '../model/details_product_model.dart';

class DetailsRepository {
  final ApiConsumer api = ApiConsumer(ApiConstants.producturl);

  DetailsRepository();

  /// ✅ جلب تفاصيل منتج واحد حسب الـ id
  Future<DetailsProductModel> getProductDetails(int id) async {
    try {
      final response = await api.get("${ApiConstants.products}/$id");
      return DetailsProductModel.fromJson(response);
      // ignore: deprecated_member_use
    } on DioError catch (e) {
      throw Exception("Failed to load product details: ${e.message}");
    }
  }
}
