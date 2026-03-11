// lib/features/auth/data/repositories/auth_repository.dart
import 'package:dio/dio.dart';
import 'package:flutter_instabuy_app/features/auth/data/models/sign_up_response.dart';
import '../../../../core/api/api_constants.dart';
import '../../../../core/api/dio_client.dart';
import '../models/login_response.dart';


class AuthRepository {
  final DioClient _client = DioClient();

  Future<LoginResponse> login(String email, String password) async {
    final response = await _client.dio.post(
      ApiConstants.loginEndpoint,
      data: {"email": email, "password": password},
    );
    return LoginResponse.fromJson(response.data);
  }

  Future<SignupResponse> signup({
    required String firstName,
    required String lastName,
    required String email,
    required String password,
    required String phone,
    required String city,
  }) async {
    final response = await _client.dio.post(
      ApiConstants.signupEndpoint,
      data: {
        "first_name": firstName,
        "last_name": lastName,
        "email": email,
        "password": password,
        "phone": phone,
        "city": city,
      },
    );
    return SignupResponse.fromJson(response.data);
  }
}