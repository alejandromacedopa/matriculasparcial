import 'package:matriculas/src/domain/models/Matriculas.dart';
import 'package:matriculas/src/domain/repository/MatriculasRepository.dart';

class UpdateMatriculasUseCase {
  MatriculasRepository matriculasRepository;
  UpdateMatriculasUseCase(this.matriculasRepository);
  run(int id, Matriculas matriculas) =>
      matriculasRepository.update(id, matriculas);
}
