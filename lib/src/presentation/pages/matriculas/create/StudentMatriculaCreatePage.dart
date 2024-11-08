import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:matriculas/src/domain/utils/Resource.dart';
import 'package:matriculas/src/presentation/pages/matriculas/create/StudentMatriculaCreateContent.dart';
import 'package:matriculas/src/presentation/pages/matriculas/create/bloc/StudentMatriculaCreateBloc.dart';
import 'package:matriculas/src/presentation/pages/matriculas/create/bloc/StudentMatriculaCreateEvent.dart';
import 'package:matriculas/src/presentation/pages/matriculas/create/bloc/StudentMatriculaCreateState.dart';
import 'package:matriculas/src/presentation/pages/matriculas/list/bloc/StudentMatriculaListBloc.dart';
import 'package:matriculas/src/presentation/pages/matriculas/list/bloc/StudentMatriculaListEvent.dart';

class StudentMatriculaCreatePage extends StatefulWidget {
  const StudentMatriculaCreatePage({super.key});

  @override
  State<StudentMatriculaCreatePage> createState() =>
      _StudentMatriculacreatepageState();
}

class _StudentMatriculacreatepageState
    extends State<StudentMatriculaCreatePage> {
  StudentMatriculaCreateBloc? _bloc;
  @override
  Widget build(BuildContext context) {
    _bloc = BlocProvider.of<StudentMatriculaCreateBloc>(context);
    return Scaffold(
      body:
          BlocListener<StudentMatriculaCreateBloc, StudentMatriculaCreateState>(
        listener: (context, state) {
          final responseState = state.response;
          if (responseState is Success) {
            context.read<StudentMatriculaListBloc>().add(GetMatriculas());
            _bloc?.add(ResetForm());
            Navigator.pop(context);
            Fluttertoast.showToast(
                msg: 'La categoria se creo correctamente',
                toastLength: Toast.LENGTH_LONG);
          } else if (responseState is Error) {
            Fluttertoast.showToast(
                msg: responseState.message, toastLength: Toast.LENGTH_LONG);
          }
        },
        child: BlocBuilder<StudentMatriculaCreateBloc,
            StudentMatriculaCreateState>(
          builder: (context, state) {
            return StudentMatriculaCreateContent(_bloc, state);
          },
        ),
      ),
    );
  }
}
