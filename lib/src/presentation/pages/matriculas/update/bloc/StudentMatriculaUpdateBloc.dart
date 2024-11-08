import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:matriculas/src/domain/useCases/matriculas/MatriculasUseCases.dart';
import 'package:matriculas/src/domain/utils/Resource.dart';
import 'package:matriculas/src/presentation/pages/matriculas/update/bloc/StudentMatriculaUpdateEvent.dart';
import 'package:matriculas/src/presentation/pages/matriculas/update/bloc/StudentMatriculaUpdateState.dart';
import 'package:matriculas/src/presentation/utils/BlocFormItem.dart';

class StudentMatriculaUpdateBloc
    extends Bloc<StudentMatriculaUpdateEvent, StudentMatriculaUpdateState> {
  MatriculasUseCases matriculasUseCases;

  StudentMatriculaUpdateBloc(this.matriculasUseCases)
      : super(StudentMatriculaUpdateState()) {
    on<StudentMatriculaUpdateInitEvent>(_onInitEvent);
    on<CursoChanged>(_onCursoChanged);
    on<EstudianteChanged>(_onEstudianteChanged);
    on<FormSubmit>(_onFormSubmit);
    on<ResetForm>(_onResetForm);
  }

  final formKey = GlobalKey<FormState>();

  Future<void> _onInitEvent(StudentMatriculaUpdateInitEvent event,
      Emitter<StudentMatriculaUpdateState> emit) async {
    emit(state.copyWith(
        id: event.matriculas?.id,
        curso: BlocFormItem(value: event.matriculas?.curso ?? ''),
        estudiante: BlocFormItem(value: event.matriculas?.estudiante ?? ''),
        formKey: formKey));
  }

  Future<void> _onCursoChanged(
      CursoChanged event, Emitter<StudentMatriculaUpdateState> emit) async {
    emit(state.copyWith(
        curso: BlocFormItem(
            value: event.curso.value,
            error: event.curso.value.isNotEmpty ? null : 'Ingresa el nombre'),
        formKey: formKey));
  }

  Future<void> _onEstudianteChanged(EstudianteChanged event,
      Emitter<StudentMatriculaUpdateState> emit) async {
    emit(state.copyWith(
        estudiante: BlocFormItem(
            value: event.estudiante.value,
            error: event.estudiante.value.isNotEmpty
                ? null
                : 'Ingresa la descripcion'),
        formKey: formKey));
  }

  Future<void> _onFormSubmit(
      FormSubmit event, Emitter<StudentMatriculaUpdateState> emit) async {
    emit(state.copyWith(response: Loading(), formKey: formKey));
    Resource response =
        await matriculasUseCases.update.run(state.id, state.toMatriculas());
    emit(state.copyWith(response: response, formKey: formKey));
  }

  Future<void> _onResetForm(
      ResetForm event, Emitter<StudentMatriculaUpdateState> emit) async {
    emit(state.resetForm());
  }
}
