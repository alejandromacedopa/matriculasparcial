import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:matriculas/src/domain/models/Matriculas.dart';
import 'package:matriculas/src/domain/utils/Resource.dart';
import 'package:matriculas/src/presentation/pages/matriculas/list/bloc/StudentMatriculaListBloc.dart';
import 'package:matriculas/src/presentation/pages/matriculas/list/bloc/StudentMatriculaListEvent.dart';
import 'package:matriculas/src/presentation/pages/matriculas/update/StudentMatriculaUpdateContent.dart';
import 'package:matriculas/src/presentation/pages/matriculas/update/bloc/StudentMatriculaUpdateBloc.dart';
import 'package:matriculas/src/presentation/pages/matriculas/update/bloc/StudentMatriculaUpdateEvent.dart';
import 'package:matriculas/src/presentation/pages/matriculas/update/bloc/StudentMatriculaUpdateState.dart';

class StudentMatriculaUpdatePage extends StatefulWidget {
  const StudentMatriculaUpdatePage({super.key});

  @override
  State<StudentMatriculaUpdatePage> createState() =>
      _StudentMatriculaUpdatePageState();
}

class _StudentMatriculaUpdatePageState
    extends State<StudentMatriculaUpdatePage> {
  Matriculas? matriculas;
  StudentMatriculaUpdateBloc? _bloc;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      _bloc?.add(StudentMatriculaUpdateInitEvent(matriculas: matriculas));
    });
  }

  @override
  void dispose() {
    super.dispose();
    _bloc?.add(ResetForm());
  }

  @override
  Widget build(BuildContext context) {
    _bloc = BlocProvider.of<StudentMatriculaUpdateBloc>(context);
    matriculas = ModalRoute.of(context)?.settings.arguments as Matriculas;
    return Scaffold(
      body:
          BlocListener<StudentMatriculaUpdateBloc, StudentMatriculaUpdateState>(
        listener: (context, state) {
          final responseState = state.response;
          if (responseState is Success) {
            context.read<StudentMatriculaListBloc>().add(GetMatriculas());
            Navigator.pop(context);
            Fluttertoast.showToast(
                msg: 'La categoria se actualizo correctamente',
                toastLength: Toast.LENGTH_LONG);
          } else if (responseState is Error) {
            Fluttertoast.showToast(
                msg: responseState.message, toastLength: Toast.LENGTH_LONG);
          }
        },
        child: BlocBuilder<StudentMatriculaUpdateBloc,
            StudentMatriculaUpdateState>(
          builder: (context, state) {
            return StudentMatriculaUpdateContent(_bloc, state, matriculas);
          },
        ),
      ),
    );
  }
}
