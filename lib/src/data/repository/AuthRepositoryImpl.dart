import 'package:matriculas/src/data/dataSource/local/SharedPref.dart';
import 'package:matriculas/src/data/remote/services/AuthServices.dart';
import 'package:matriculas/src/domain/models/AuthResponse.dart';
import 'package:matriculas/src/domain/models/User.dart';
import 'package:matriculas/src/domain/repository/AuthRepository.dart';
import 'package:matriculas/src/domain/utils/Resource.dart';

class AuthRepositoryImpl implements AuthRepository {
  AuthServices authServices;
  SharedPref sharedPref;

  AuthRepositoryImpl(this.authServices, this.sharedPref);

  @override
  Future<AuthResponse?> getUserSession() async {
    final data = await sharedPref.read('user');
    if (data != null) {
      AuthResponse authResponse = AuthResponse.fromJson(data);
      return authResponse;
    }
    return null;
  }

  @override
  Future<Resource<AuthResponse>> login(String email, String password) {
    return authServices.login(email, password);
  }

  @override
  Future<bool> logout() async {
    return await sharedPref.remove('user');
  }

  @override
  Future<Resource<AuthResponse>> register(User user) {
    return authServices.register(user);
  }

  @override
  Future<void> saveUserSession(AuthResponse authResponse) async {
    sharedPref.save('user', authResponse.toJson());
  }
}
