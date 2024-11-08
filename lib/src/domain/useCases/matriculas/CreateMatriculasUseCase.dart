import 'package:matriculas/src/domain/models/Matriculas.dart';
import 'package:matriculas/src/domain/repository/MatriculasRepository.dart';

class CreateMatriculasUseCase {
  MatriculasRepository matriculasRepository;
  CreateMatriculasUseCase(this.matriculasRepository);
  run(Matriculas matriculas) => matriculasRepository.create(matriculas);
}
