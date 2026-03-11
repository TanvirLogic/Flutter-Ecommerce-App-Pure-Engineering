import 'package:flutter_instabuy_app/features/auth/data/models/login_response.dart';

class SignupResponse {
  final UserModel user;

  SignupResponse({required this.user});

  factory SignupResponse.fromJson(Map<String, dynamic> json) {
    final data = json['data'];
    return SignupResponse(
      user: UserModel.fromJson(data),
    );
  }
}