import 'package:equatable/equatable.dart';
import 'package:flutter/widgets.dart';
import 'package:matriculas/src/domain/models/Matriculas.dart';
import 'package:matriculas/src/domain/utils/Resource.dart';
import 'package:matriculas/src/presentation/utils/BlocFormItem.dart';

class StudentMatriculaUpdateState extends Equatable {
  final int id;
  final BlocFormItem curso;
  final BlocFormItem estudiante;
  final BlocFormItem? nhoras;
  final BlocFormItem? ncreditos;
  final BlocFormItem? estado;
  final Resource? response;
  final GlobalKey<FormState>? formKey;

  // Constructor con valores predeterminados
  StudentMatriculaUpdateState({
    this.id = 0, // Valor predeterminado para `id`
    this.curso = const BlocFormItem(error: 'Ingrese el nombre de la categoria'),
    this.estudiante = const BlocFormItem(error: 'Ingrese la descripcion'),
    this.nhoras,
    this.ncreditos,
    this.estado,
    this.formKey,
    this.response,
  });

  // Método para convertir el estado a un modelo de dominio `Matriculas`
  Matriculas toMatriculas() {
    return Matriculas(
      id: id,
      curso: curso.value,
      estudiante: estudiante.value,
    );
  }

  // Resetear el formulario, creando un nuevo estado con los valores predeterminados
  StudentMatriculaUpdateState resetForm() {
    return StudentMatriculaUpdateState();
  }

  // Método copyWith para crear una nueva instancia con valores modificados
  StudentMatriculaUpdateState copyWith({
    int? id,
    BlocFormItem? curso,
    BlocFormItem? estudiante,
    BlocFormItem? nhoras,
    BlocFormItem? ncreditos,
    BlocFormItem? estado,
    GlobalKey<FormState>? formKey,
    Resource? response,
  }) {
    return StudentMatriculaUpdateState(
      id: id ?? this.id,
      curso: curso ?? this.curso,
      estudiante: estudiante ?? this.estudiante,
      nhoras: nhoras ?? this.nhoras,
      ncreditos: ncreditos ?? this.ncreditos,
      estado: estado ?? this.estado,
      formKey: formKey ?? this.formKey,
      response: response ?? this.response,
    );
  }

  @override
  // Implementar la comparación de instancias usando las propiedades relevantes
  List<Object?> get props => [
        id,
        curso,
        estudiante,
        nhoras,
        ncreditos,
        estado,
        formKey,
        response,
      ];
}
