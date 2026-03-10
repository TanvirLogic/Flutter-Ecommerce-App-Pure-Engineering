import '../../data/repositories/auth_repository.dart';
import '../../data/models/login_response.dart';
import '../entities/user.dart';

class LoginUseCase {
  final AuthRepository repository;

  LoginUseCase(this.repository);

  Future<User> execute(String email, String password) async {
    final response = await repository.login(email, password);
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
      token: response.token,
    );
  }
}
