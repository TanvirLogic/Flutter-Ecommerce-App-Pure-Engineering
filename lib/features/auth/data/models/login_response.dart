// lib/features/auth/data/models/login_response.dart
class LoginResponse {
  final String token;
  final UserModel user;

  LoginResponse({required this.token, required this.user});

  factory LoginResponse.fromJson(Map<String, dynamic> json) {
    final data = json['data'];
    return LoginResponse(
      token: data['token'],
      user: UserModel.fromJson(data['user']),
    );
  }
}

class UserModel {
  final String id;
  final String firstName;
  final String lastName;
  final String email;
  final bool emailVerified;
  final String phone;
  final bool phoneVerified;
  final String? avatarUrl;
  final String city;
  final int role;

  UserModel({
    required this.id,
    required this.firstName,
    required this.lastName,
    required this.email,
    required this.emailVerified,
    required this.phone,
    required this.phoneVerified,
    this.avatarUrl,
    required this.city,
    required this.role,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      id: json['_id'],
      firstName: json['first_name'],
      lastName: json['last_name'],
      email: json['email'],
      emailVerified: json['email_verified'],
      phone: json['phone'],
      phoneVerified: json['phone_verified'],
      avatarUrl: json['avatar_url'],
      city: json['city'],
      role: json['role'],
    );
  }
}