import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:matriculas/src/domain/models/Matriculas.dart';
import 'package:matriculas/src/domain/utils/Resource.dart';
import 'package:matriculas/src/presentation/utils/BlocFormItem.dart';

class StudentMatriculaCreateState extends Equatable {
  final BlocFormItem curso;
  final BlocFormItem estudiante;
  final BlocFormItem? nhoras;
  final BlocFormItem? ncreditos;
  final BlocFormItem? estado;
  final Resource? response;
  final GlobalKey<FormState>? formKey;

  StudentMatriculaCreateState({
    this.curso = const BlocFormItem(error: 'Ingrese el nombre de la categoria'),
    this.estudiante = const BlocFormItem(error: 'Ingrese la descripcion'),
    this.nhoras,
    this.ncreditos,
    this.estado,
    this.formKey,
    this.response,
  });

  toMatriculas() =>
      Matriculas(curso: curso.value, estudiante: estudiante.value);

  StudentMatriculaCreateState resetForm() {
    return StudentMatriculaCreateState(
      curso: const BlocFormItem(error: 'Ingrese el nombre de la categoria'),
      estudiante: const BlocFormItem(error: 'Ingrese la descripcion'),
      nhoras: const BlocFormItem(error: 'Ingrese la descripcion'),
      ncreditos: const BlocFormItem(error: 'Ingrese la descripcion'),
      estado: const BlocFormItem(error: 'Ingrese la descripcion'),
    );
  }

  StudentMatriculaCreateState copyWith(
      {BlocFormItem? curso,
      BlocFormItem? estudiante,
      BlocFormItem? nhoras,
      BlocFormItem? ncreditos,
      BlocFormItem? estado,
      GlobalKey<FormState>? formKey,
      Resource? response}) {
    return StudentMatriculaCreateState(
        curso: curso ?? this.curso,
        estudiante: estudiante ?? this.estudiante,
        nhoras: nhoras ?? this.nhoras,
        ncreditos: ncreditos ?? this.ncreditos,
        estado: estado ?? this.estado,
        formKey: formKey,
        response: response);
  }

  @override
  // TODO: implement props
  List<Object?> get props =>
      [curso, estudiante, nhoras, ncreditos, estado, response];
}
