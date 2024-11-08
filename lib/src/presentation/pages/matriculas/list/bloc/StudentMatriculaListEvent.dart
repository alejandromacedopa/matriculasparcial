import 'package:equatable/equatable.dart';

abstract class StudentMatriculaListEvent extends Equatable {
  const StudentMatriculaListEvent();
  @override
  List<Object?> get props => [];
}

class GetMatriculas extends StudentMatriculaListEvent {
  const GetMatriculas();
}

class DeleteMatriculas extends StudentMatriculaListEvent {
  final int id;
  const DeleteMatriculas({required this.id});

  @override
  List<Object?> get props => [id];
}
