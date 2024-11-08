// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;
import 'package:matriculas/src/data/dataSource/local/SharedPref.dart' as _i164;
import 'package:matriculas/src/data/remote/services/AuthServices.dart' as _i952;
import 'package:matriculas/src/data/remote/services/MatriculasService.dart'
    as _i118;
import 'package:matriculas/src/di/AppModule.dart' as _i700;
import 'package:matriculas/src/domain/repository/MatriculasRepository.dart'
    as _i983;
import 'package:matriculas/src/domain/useCases/matriculas/MatriculasUseCases.dart'
    as _i524;

extension GetItInjectableX on _i174.GetIt {
// initializes the registration of main-scope dependencies inside of GetIt
  _i174.GetIt init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i526.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    final appModule = _$AppModule();
    gh.factory<_i164.SharedPref>(() => appModule.sharedPref);
    gh.factoryAsync<String>(() => appModule.token);
    gh.factory<_i952.AuthServices>(() => appModule.authServices);
    gh.factory<_i118.MatriculasService>(() => appModule.matriculasService);
    gh.factory<_i983.MatriculasRepository>(
        () => appModule.matriculasRepository);
    gh.factory<_i524.MatriculasUseCases>(() => appModule.matriculasUseCases);
    return this;
  }
}

class _$AppModule extends _i700.AppModule {}
