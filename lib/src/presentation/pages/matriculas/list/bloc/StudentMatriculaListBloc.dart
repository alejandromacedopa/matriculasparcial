import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:matriculas/src/domain/useCases/matriculas/MatriculasUseCases.dart';
import 'package:matriculas/src/domain/utils/Resource.dart';
import 'package:matriculas/src/presentation/pages/matriculas/list/bloc/StudentMatriculaListEvent.dart';
import 'package:matriculas/src/presentation/pages/matriculas/list/bloc/StudentMatriculaListState.dart';

class StudentMatriculaListBloc
    extends Bloc<StudentMatriculaListEvent, StudentMatriculaListState> {
  MatriculasUseCases matriculasUseCases;

  StudentMatriculaListBloc(this.matriculasUseCases)
      : super(StudentMatriculaListState()) {
    on<GetMatriculas>(_onGetMatriculas);
    on<DeleteMatriculas>(_onDeleteMatriculas);
  }
  Future<void> _onGetMatriculas(
      GetMatriculas event, Emitter<StudentMatriculaListState> emit) async {
    emit(state.copyWith(response: Loading()));
    Resource response = await matriculasUseCases.getMatriculas.run();
    emit(state.copyWith(response: response));
  }

  Future<void> _onDeleteMatriculas(
      DeleteMatriculas event, Emitter<StudentMatriculaListState> emit) async {
    emit(state.copyWith(response: Loading()));
    Resource response = await matriculasUseCases.delete.run(event.id);
    emit(state.copyWith(response: response));
  }
}
