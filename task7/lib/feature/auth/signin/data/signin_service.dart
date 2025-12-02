import 'package:shared_preferences/shared_preferences.dart';
import 'package:task7/core/network/api_constants.dart';
import 'package:task7/core/network/api_consumer.dart';
import 'package:task7/feature/auth/signin/model/login_request.dart';
import 'package:task7/feature/auth/signin/model/login_respons.dart';

class SigninService {
  final ApiConsumer api = ApiConsumer(ApiConstants.authurl);

  Future<LoginResponse> login(LoginRequest request) async {
    final data = await api.post(ApiConstants.users, body: request.toJson());

    final response = LoginResponse.fromJson(data);

    final token = response.token;
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString("token", token);

    return response;
  }
}
