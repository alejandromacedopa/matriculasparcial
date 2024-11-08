import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:matriculas/src/domain/models/Matriculas.dart';
import 'package:matriculas/src/domain/utils/Resource.dart';
import 'package:matriculas/src/presentation/pages/matriculas/list/StudentMatriculaListItem.dart';
import 'package:matriculas/src/presentation/pages/matriculas/list/bloc/StudentMatriculaListBloc.dart';
import 'package:matriculas/src/presentation/pages/matriculas/list/bloc/StudentMatriculaListEvent.dart';
import 'package:matriculas/src/presentation/pages/matriculas/list/bloc/StudentMatriculaListState.dart';

class StudentMatriculaListPage extends StatefulWidget {
  const StudentMatriculaListPage({super.key});

  @override
  State<StudentMatriculaListPage> createState() =>
      _StudentMatriculaListPageState();
}

class _StudentMatriculaListPageState extends State<StudentMatriculaListPage> {
  StudentMatriculaListBloc? _bloc;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      _bloc?.add(GetMatriculas());
    });
  }

  @override
  Widget build(BuildContext context) {
    _bloc = BlocProvider.of<StudentMatriculaListBloc>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text('Lista de Matrículas'),
        backgroundColor: Colors.blueAccent,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pushNamed(context, 'student/matriculas/create');
        },
        backgroundColor: Colors.blueAccent,
        child: Icon(
          Icons.add,
          color: Colors.white,
        ),
      ),
      body: BlocListener<StudentMatriculaListBloc, StudentMatriculaListState>(
        listener: (context, state) {
          final responseState = state.response;
          if (responseState is Success) {
            if (responseState.data is bool) {
              _bloc?.add(GetMatriculas());
            }
          }
          if (responseState is Error) {
            Fluttertoast.showToast(
                msg: responseState.message, toastLength: Toast.LENGTH_LONG);
          }
        },
        child: BlocBuilder<StudentMatriculaListBloc, StudentMatriculaListState>(
          builder: (context, state) {
            final responseState = state.response;
            if (responseState is Success) {
              List<Matriculas> matriculas =
                  responseState.data as List<Matriculas>;
              return ListView.builder(
                itemCount: matriculas.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                    child: Card(
                      elevation: 8,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: StudentMatriculaListItem(
                        _bloc,
                        matriculas[index],
                      ),
                    ),
                  );
                },
              );
            }
            return Center(child: CircularProgressIndicator());
          },
        ),
      ),
    );
  }
}
