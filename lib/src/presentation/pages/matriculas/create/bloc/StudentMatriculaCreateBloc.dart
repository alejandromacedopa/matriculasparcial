import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:matriculas/src/domain/useCases/matriculas/MatriculasUseCases.dart';
import 'package:matriculas/src/domain/utils/Resource.dart';
import 'package:matriculas/src/presentation/pages/matriculas/create/bloc/StudentMatriculaCreateEvent.dart';
import 'package:matriculas/src/presentation/pages/matriculas/create/bloc/StudentMatriculaCreateState.dart';
import 'package:matriculas/src/presentation/utils/BlocFormItem.dart';

class StudentMatriculaCreateBloc
    extends Bloc<StudentMatriculaCreateEvent, StudentMatriculaCreateState> {
  MatriculasUseCases matriculasUseCases;

  StudentMatriculaCreateBloc(this.matriculasUseCases)
      : super(StudentMatriculaCreateState()) {
    on<StudentMatriculaCreateInitEvent>(_onStudentMatriculaCreateInitEven);
    on<CursoChanged>(_onCursoChanged);
    on<EstudianteChanged>(_onEstudianteChanged);
    on<NhorasChanged>(_onNhorasChanged);
    on<NcreditosChanged>(_onNcreditosChanged);
    on<EstadoChanged>(_onEstadoChanged);
    on<FormSubmit>(_onFormSubmit);
    on<ResetForm>(_onResetForm);
  }

  final formKey = GlobalKey<FormState>();

  Future<void> _onStudentMatriculaCreateInitEven(
      StudentMatriculaCreateInitEvent event,
      Emitter<StudentMatriculaCreateState> emit) async {
    emit(state.copyWith(formKey: formKey));
  }

  Future<void> _onCursoChanged(
      CursoChanged event, Emitter<StudentMatriculaCreateState> emit) async {
    emit(state.copyWith(
        curso: BlocFormItem(
            value: event.curso.value,
            error: event.curso.value.isNotEmpty ? null : 'Ingresa el nombre'),
        formKey: formKey));
  }

  Future<void> _onEstudianteChanged(EstudianteChanged event,
      Emitter<StudentMatriculaCreateState> emit) async {
    emit(state.copyWith(
        estudiante: BlocFormItem(
            value: event.estudiante.value,
            error:
                event.estudiante.value.isNotEmpty ? null : 'Ingresa el nombre'),
        formKey: formKey));
  }

  Future<void> _onNhorasChanged(
      NhorasChanged event, Emitter<StudentMatriculaCreateState> emit) async {
    emit(state.copyWith(
        nhoras: BlocFormItem(
            value: event.nhoras.value,
            error: event.nhoras.value.isNotEmpty ? null : 'Ingresa el nombre'),
        formKey: formKey));
  }

  Future<void> _onNcreditosChanged(
      NcreditosChanged event, Emitter<StudentMatriculaCreateState> emit) async {
    emit(state.copyWith(
        ncreditos: BlocFormItem(
            value: event.ncreditos.value,
            error: event.ncreditos.value.isNotEmpty
                ? null
                : 'Ingresa la descripcion'),
        formKey: formKey));
  }

  Future<void> _onEstadoChanged(
      EstadoChanged event, Emitter<StudentMatriculaCreateState> emit) async {
    emit(state.copyWith(
      estado: BlocFormItem(
        value: event.estado
            ? 'true'
            : 'false', // Lo que sea que necesites como "value"
        error: event.estado != null ? null : 'Ingresa el estado',
      ),
      formKey: formKey,
    ));
  }

  Future<void> _onFormSubmit(
      FormSubmit event, Emitter<StudentMatriculaCreateState> emit) async {
    emit(state.copyWith(response: Loading(), formKey: formKey));
    Resource response =
        await matriculasUseCases.create.run(state.toMatriculas());
    emit(state.copyWith(response: response, formKey: formKey));
  }

  Future<void> _onResetForm(
      ResetForm event, Emitter<StudentMatriculaCreateState> emit) async {
    emit(state.resetForm());
    // state.formKey?.currentState?.reset();
  }
}
