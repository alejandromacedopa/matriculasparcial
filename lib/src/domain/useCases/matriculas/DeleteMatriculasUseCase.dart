import 'package:matriculas/src/domain/repository/MatriculasRepository.dart';

class DeleteMatriculasUseCase {
  MatriculasRepository matriculasRepository;
  DeleteMatriculasUseCase(this.matriculasRepository);
  run(int id) => matriculasRepository.delete(id);
}
