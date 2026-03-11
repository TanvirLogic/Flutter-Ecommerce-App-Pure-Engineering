// lib/features/auth/presentation/providers/auth_provider.dart
import 'package:flutter/material.dart';
import 'package:flutter_instabuy_app/features/auth/domain/usecases/sign_up_usecase.dart';
import '../../domain/entities/user.dart';
import '../../domain/usecases/login_usecase.dart';
import '../../data/repositories/auth_repository.dart';

class AuthProvider with ChangeNotifier {
  // Single repository instance shared across use cases
  final AuthRepository _repository = AuthRepository();

  // Use cases depend on the same repository type
  late final LoginUseCase _loginUseCase = LoginUseCase(_repository);
  late final SignupUseCase _signupUseCase = SignupUseCase(_repository);

  User? _user;
  bool _isLoading = false;
  String? _error;

  User? get user => _user;
  bool get isLoading => _isLoading;
  String? get error => _error;

  /// LOGIN FLOW
  Future<void> login(String email, String password) async {
    _isLoading = true;
    _error = null;
    notifyListeners();

    try {
      _user = await _loginUseCase.execute(email, password);
    } catch (e) {
      _error = e.toString();
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  /// SIGNUP FLOW (no token yet, only user info)
  Future<void> signup({
    required String firstName,
    required String lastName,
    required String email,
    required String password,
    required String phone,
    required String city,
  }) async {
    _isLoading = true;
    _error = null;
    notifyListeners();

    try {
      _user = await _signupUseCase.execute(
        firstName: firstName,
        lastName: lastName,
        email: email,
        password: password,
        phone: phone,
        city: city,
      );
    } catch (e) {
      _error = e.toString();
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }
}
