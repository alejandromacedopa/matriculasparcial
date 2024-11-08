import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:matriculas/injection.dart';
import 'package:matriculas/src/domain/useCases/matriculas/MatriculasUseCases.dart';
import 'package:matriculas/src/presentation/pages/matriculas/create/bloc/StudentMatriculaCreateBloc.dart';
import 'package:matriculas/src/presentation/pages/matriculas/create/bloc/StudentMatriculaCreateEvent.dart';
import 'package:matriculas/src/presentation/pages/matriculas/list/bloc/StudentMatriculaListBloc.dart';
import 'package:matriculas/src/presentation/pages/matriculas/update/bloc/StudentMatriculaUpdateBloc.dart';

List<BlocProvider> blocProvider = [
  BlocProvider<StudentMatriculaListBloc>(
      create: (context) =>
          StudentMatriculaListBloc(locator<MatriculasUseCases>())),
  BlocProvider<StudentMatriculaCreateBloc>(
      create: (context) =>
          StudentMatriculaCreateBloc(locator<MatriculasUseCases>())
            ..add(StudentMatriculaCreateInitEvent())),
  BlocProvider<StudentMatriculaUpdateBloc>(
      create: (context) =>
          StudentMatriculaUpdateBloc(locator<MatriculasUseCases>())),
];
