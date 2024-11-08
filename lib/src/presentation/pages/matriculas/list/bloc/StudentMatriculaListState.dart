import 'package:equatable/equatable.dart';
import 'package:matriculas/src/domain/utils/Resource.dart';

class StudentMatriculaListState extends Equatable {
  final Resource? response;

  const StudentMatriculaListState({this.response});

  StudentMatriculaListState copyWith({Resource? response}) {
    return StudentMatriculaListState(response: response);
  }

  @override
  List<Object?> get props => [response];
}
