import 'package:matriculas/src/domain/useCases/matriculas/CreateMatriculasUseCase.dart';
import 'package:matriculas/src/domain/useCases/matriculas/DeleteMatriculasUseCase.dart';
import 'package:matriculas/src/domain/useCases/matriculas/GetMatriculasUseCase.dart';
import 'package:matriculas/src/domain/useCases/matriculas/UpdateMatriculasUseCase.dart';

class MatriculasUseCases {
  CreateMatriculasUseCase create;
  GetMatriculasUseCase getMatriculas;
  UpdateMatriculasUseCase update;
  DeleteMatriculasUseCase delete;

  MatriculasUseCases(
      {required this.create,
      required this.getMatriculas,
      required this.update,
      required this.delete});
}
