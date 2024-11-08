import 'package:matriculas/src/domain/repository/MatriculasRepository.dart';

class GetMatriculasUseCase {
  MatriculasRepository matriculasRepository;
  GetMatriculasUseCase(this.matriculasRepository);
  run() => matriculasRepository.getMatriculas();
}
