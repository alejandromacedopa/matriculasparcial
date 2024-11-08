import 'package:matriculas/src/domain/models/Matriculas.dart';
import 'package:matriculas/src/domain/utils/Resource.dart';

abstract class MatriculasRepository {
  Future<Resource<Matriculas>> create(Matriculas matriculas);
  Future<Resource<Matriculas>> update(int id, Matriculas matriculas);
  Future<Resource<List<Matriculas>>> getMatriculas();
  Future<Resource<bool>> delete(int id);
}
