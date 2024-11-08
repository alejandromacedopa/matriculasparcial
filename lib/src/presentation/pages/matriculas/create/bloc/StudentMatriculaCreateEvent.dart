import 'package:equatable/equatable.dart';
import 'package:matriculas/src/presentation/utils/BlocFormItem.dart';

abstract class StudentMatriculaCreateEvent extends Equatable {
  const StudentMatriculaCreateEvent();
  @override
  List<Object?> get props => [];
}

class StudentMatriculaCreateInitEvent extends StudentMatriculaCreateEvent {
  const StudentMatriculaCreateInitEvent();
  @override
  List<Object?> get props => [];
}

class CursoChanged extends StudentMatriculaCreateEvent {
  final BlocFormItem curso;
  const CursoChanged({required this.curso});
  @override
  List<Object?> get props => [curso];
}

class EstudianteChanged extends StudentMatriculaCreateEvent {
  final BlocFormItem estudiante;
  const EstudianteChanged({required this.estudiante});
  @override
  List<Object?> get props => [estudiante];
}

class NhorasChanged extends StudentMatriculaCreateEvent {
  final BlocFormItem nhoras;
  const NhorasChanged({required this.nhoras});
  @override
  List<Object?> get props => [nhoras];
}

class NcreditosChanged extends StudentMatriculaCreateEvent {
  final BlocFormItem ncreditos;
  const NcreditosChanged({required this.ncreditos});
  @override
  List<Object?> get props => [ncreditos];
}

class EstadoChanged extends StudentMatriculaCreateEvent {
  final bool estado;
  const EstadoChanged({required this.estado});
  @override
  List<Object?> get props => [estado];
}

class FormSubmit extends StudentMatriculaCreateEvent {
  const FormSubmit();
  @override
  List<Object?> get props => [];
}

class ResetForm extends StudentMatriculaCreateEvent {
  const ResetForm();
  @override
  List<Object?> get props => [];
}
