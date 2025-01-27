import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:matriculas/src/data/api/ApiConfig.dart';
import 'package:matriculas/src/domain/models/AuthResponse.dart';
import 'package:matriculas/src/domain/models/User.dart';
import 'package:matriculas/src/domain/utils/Resource.dart';

class AuthServices {
  Future<Resource<AuthResponse>> login(String email, String password) async {
    try {
      Uri url = Uri.http(ApiConfig.API_ECOMMERCE, '/auth/login');
      Map<String, String> headers = {"Content-Type": "application/json"};
      String body = json.encode({
        'email': email,
        'password': password,
      });

      final response = await http.post(url, headers: headers, body: body);
      final data = json.decode(response.body);

      if (response.statusCode == 200 || response.statusCode == 201) {
        AuthResponse authResponse = AuthResponse.fromJson(data);
        return Success(authResponse);
      } else {
        return Error(data['message']);
      }
    } catch (e) {
      print('Error $e');
      return Error(e.toString());
    }
  }

  Future<Resource<AuthResponse>> register(User user) async {
    try {
      Uri url = Uri.http(ApiConfig.API_ECOMMERCE, '/auth/register');
      Map<String, String> headers = {"Content-Type": "application/json"};
      String body = json.encode(user);

      final response = await http.post(url, headers: headers, body: body);
      final data = json.decode(response.body);

      if (response.statusCode == 200 || response.statusCode == 201) {
        AuthResponse authResponse = AuthResponse.fromJson(data);
        return Success(authResponse);
      } else {
        return Error(data['message']);
      }
    } catch (e) {
      print('Error $e');
      return Error(e.toString());
    }
  }
}
