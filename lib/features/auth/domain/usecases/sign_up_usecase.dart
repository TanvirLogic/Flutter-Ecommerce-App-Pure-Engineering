// lib/features/auth/domain/usecases/signup_usecase.dart
import '../../data/repositories/auth_repository.dart';
import '../entities/user.dart';

class SignupUseCase {
  final AuthRepository repository;

  SignupUseCase(this.repository);

  Future<User> execute({
    required String firstName,
    required String lastName,
    required String email,
    required String password,
    required String phone,
    required String city,
  }) async {
    final response = await repository.signup(
      firstName: firstName,
      lastName: lastName,
      email: email,
      password: password,
      phone: phone,
      city: city,
    );

    final userModel = response.user;
    return User(
      id: userModel.id,
      firstName: userModel.firstName,
      lastName: userModel.lastName,
      email: userModel.email,
      emailVerified: userModel.emailVerified,
      phone: userModel.phone,
      phoneVerified: userModel.phoneVerified,
      avatarUrl: userModel.avatarUrl,
      city: userModel.city,
      role: userModel.role,
      token: "", // signup doesn’t return token
    );
  }
}