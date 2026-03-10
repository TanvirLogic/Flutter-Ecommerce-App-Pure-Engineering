// lib/features/auth/data/repositories/auth_repository.dart
import 'package:dio/dio.dart';
import '../../../../core/api/api_constants.dart';
import '../../../../core/api/dio_client.dart';
import '../models/login_response.dart';

class AuthRepository {
  final DioClient _client = DioClient();

  Future<LoginResponse> login(String email, String password) async {
    try {
      final response = await _client.dio.post(
        ApiConstants.loginEndpoint,
        data: {"email": email, "password": password},
      );

      return LoginResponse.fromJson(response.data);
      // Here response.data = full json which I have seen in postman
    } on DioException catch (e) {
      throw Exception("Login failed: ${e.response?.data ?? e.message}");
    }
  }
}
