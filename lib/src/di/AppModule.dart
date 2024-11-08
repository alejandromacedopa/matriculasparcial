import 'package:injectable/injectable.dart';
import 'package:matriculas/src/data/dataSource/local/SharedPref.dart';
import 'package:matriculas/src/data/remote/services/AuthServices.dart';
import 'package:matriculas/src/data/remote/services/MatriculasService.dart';
import 'package:matriculas/src/data/repository/MatriculasRepositoryimpl.dart';
import 'package:matriculas/src/domain/models/AuthResponse.dart';
import 'package:matriculas/src/domain/repository/MatriculasRepository.dart';
import 'package:matriculas/src/domain/useCases/matriculas/CreateMatriculasUseCase.dart';
import 'package:matriculas/src/domain/useCases/matriculas/DeleteMatriculasUseCase.dart';
import 'package:matriculas/src/domain/useCases/matriculas/GetMatriculasUseCase.dart';
import 'package:matriculas/src/domain/useCases/matriculas/MatriculasUseCases.dart';
import 'package:matriculas/src/domain/useCases/matriculas/UpdateMatriculasUseCase.dart';

@module
abstract class AppModule {
  @injectable
  SharedPref get sharedPref => SharedPref();

  @injectable
  Future<String> get token async {
    String token = "";
    final userSession = await sharedPref.read('user');
    if (userSession != null) {
      AuthResponse authResponse = AuthResponse.fromJson(userSession);
      token = authResponse.token;
    }
    return token;
  }

  @injectable
  AuthServices get authServices => AuthServices();

  @injectable
  MatriculasService get matriculasService => MatriculasService(token);

  @injectable
  MatriculasRepository get matriculasRepository =>
      MatriculasRepositoryImpl(matriculasService);

  @injectable
  MatriculasUseCases get matriculasUseCases => MatriculasUseCases(
      create: CreateMatriculasUseCase(matriculasRepository),
      getMatriculas: GetMatriculasUseCase(matriculasRepository),
      update: UpdateMatriculasUseCase(matriculasRepository),
      delete: DeleteMatriculasUseCase(matriculasRepository));
}
