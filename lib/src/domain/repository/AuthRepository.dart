import 'package:matriculas/src/domain/models/AuthResponse.dart';
import 'package:matriculas/src/domain/models/User.dart';
import 'package:matriculas/src/domain/utils/Resource.dart';

abstract class AuthRepository {
  Future<AuthResponse?> getUserSession();
  Future<bool> logout();
  Future<void> saveUserSession(AuthResponse authResponse);
  Future<Resource<AuthResponse>> login(String email, String password);
  Future<Resource<AuthResponse>> register(User User);
}
