import 'package:equatable/equatable.dart';
import 'package:matriculas/src/domain/models/Matriculas.dart';
import 'package:matriculas/src/presentation/utils/BlocFormItem.dart';

abstract class StudentMatriculaUpdateEvent extends Equatable {
  const StudentMatriculaUpdateEvent();
  @override
  List<Object?> get props => [];
}

class StudentMatriculaUpdateInitEvent extends StudentMatriculaUpdateEvent {
  final Matriculas? matriculas;
  const StudentMatriculaUpdateInitEvent({required this.matriculas});
  @override
  List<Object?> get props => [matriculas];
}

class CursoChanged extends StudentMatriculaUpdateEvent {
  final BlocFormItem curso;
  const CursoChanged({required this.curso});
  @override
  List<Object?> get props => [curso];
}

class EstudianteChanged extends StudentMatriculaUpdateEvent {
  final BlocFormItem estudiante;
  const EstudianteChanged({required this.estudiante});
  @override
  List<Object?> get props => [estudiante];
}

class NhorasChanged extends StudentMatriculaUpdateEvent {
  final BlocFormItem nhoras;
  const NhorasChanged({required this.nhoras});
  @override
  List<Object?> get props => [nhoras];
}

class NcreditosChanged extends StudentMatriculaUpdateEvent {
  final BlocFormItem ncreditos;
  const NcreditosChanged({required this.ncreditos});
  @override
  List<Object?> get props => [ncreditos];
}

class EstadoChanged extends StudentMatriculaUpdateEvent {
  final bool estado;
  const EstadoChanged({required this.estado});
  @override
  List<Object?> get props => [estado];
}

class FormSubmit extends StudentMatriculaUpdateEvent {
  const FormSubmit();
  @override
  List<Object?> get props => [];
}

class ResetForm extends StudentMatriculaUpdateEvent {
  const ResetForm();
  @override
  List<Object?> get props => [];
}
