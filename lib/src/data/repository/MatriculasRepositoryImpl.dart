import 'package:matriculas/src/data/remote/services/MatriculasService.dart';
import 'package:matriculas/src/domain/models/Matriculas.dart';
import 'package:matriculas/src/domain/repository/MatriculasRepository.dart';
import 'package:matriculas/src/domain/utils/Resource.dart';

class MatriculasRepositoryImpl implements MatriculasRepository {
  MatriculasService matriculasService;

  MatriculasRepositoryImpl(this.matriculasService);

  @override
  Future<Resource<Matriculas>> create(Matriculas matriculas) {
    return matriculasService.create(matriculas);
  }

  @override
  Future<Resource<bool>> delete(int id) {
    return matriculasService.delete(id);
  }

  @override
  Future<Resource<List<Matriculas>>> getMatriculas() {
    return matriculasService.getMatriculas();
  }

  @override
  Future<Resource<Matriculas>> update(int id, Matriculas matriculas) {
    return matriculasService.update(id, matriculas);
  }
}
