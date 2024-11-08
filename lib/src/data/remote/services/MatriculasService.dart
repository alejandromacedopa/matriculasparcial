import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:matriculas/src/data/api/ApiConfig.dart';
import 'package:matriculas/src/domain/models/Matriculas.dart';
import 'package:matriculas/src/domain/utils/ListToString.dart';
import 'package:matriculas/src/domain/utils/Resource.dart';

class MatriculasService {
  Future<String> token;
  MatriculasService(this.token);

  Future<Resource<Matriculas>> create(Matriculas matriculas) async {
    try {
      Uri url = Uri.http(ApiConfig.API_ECOMMERCE, '/matriculas');
      Map<String, String> headers = {"Content-Type": "application/json"};
      String body = json.encode(matriculas);

      final response = await http.post(url, headers: headers, body: body);
      final data = json.decode(response.body);

      if (response.statusCode == 200 || response.statusCode == 201) {
        Matriculas matriculas = Matriculas.fromJson(data);
        return Success(matriculas);
      } else {
        return Error(data['message']);
      }
    } catch (e) {
      print('Error $e');
      return Error(e.toString());
    }
  }

  Future<Resource<List<Matriculas>>> getMatriculas() async {
    try {
      Uri url = Uri.http(ApiConfig.API_ECOMMERCE, '/matriculas');
      Map<String, String> headers = {
        "Content-Type": "application/json",
        "Authorization": await token
      };
      final response = await http.get(url, headers: headers);
      final data = json.decode(response.body);
      if (response.statusCode == 200 || response.statusCode == 201) {
        List<Matriculas> matriculas = Matriculas.fromJsonList(data);
        return Success(matriculas);
      } else {
        // ERROR
        return Error(ListToString(data['message']));
      }
    } catch (e) {
      print('Error: $e');
      return Error(e.toString());
    }
  }

  Future<Resource<Matriculas>> update(int id, Matriculas matriculas) async {
    try {
      Uri url = Uri.http(ApiConfig.API_ECOMMERCE, '/matriculas/$id');
      Map<String, String> headers = {
        "Content-Type": "application/json",
        "Authorization": await token
      };
      String body = json.encode({
        'name': matriculas.curso,
        'estudiante': matriculas.estudiante,
        'nhoras': matriculas.nhoras,
        'ncreditos': matriculas.ncreditos,
        'estado': matriculas.estado,
      });
      final response = await http.put(url, headers: headers, body: body);
      final data = json.decode(response.body);
      if (response.statusCode == 200 || response.statusCode == 201) {
        Matriculas matrculasResponse = Matriculas.fromJson(data);
        return Success(matrculasResponse);
      } else {
        // ERROR
        return Error(ListToString(data['message']));
      }
    } catch (e) {
      print('Error: $e');
      return Error(e.toString());
    }
  }

  Future<Resource<bool>> delete(int id) async {
    try {
      Uri url = Uri.http(ApiConfig.API_ECOMMERCE, '/matriculas/$id');
      Map<String, String> headers = {
        "Content-Type": "application/json",
        "Authorization": await token
      };
      final response = await http.delete(url, headers: headers);
      final data = json.decode(response.body);
      if (response.statusCode == 200 || response.statusCode == 201) {
        return Success(true);
      } else {
        // ERROR
        return Error(ListToString(data['message']));
      }
    } catch (e) {
      print('Error: $e');
      return Error(e.toString());
    }
  }
}
