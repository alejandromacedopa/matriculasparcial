import 'package:flutter/material.dart';
import 'package:matriculas/src/domain/models/Matriculas.dart';
import 'package:matriculas/src/presentation/pages/matriculas/list/bloc/StudentMatriculaListBloc.dart';
import 'package:matriculas/src/presentation/pages/matriculas/list/bloc/StudentMatriculaListEvent.dart';

class StudentMatriculaListItem extends StatelessWidget {
  final StudentMatriculaListBloc? bloc;
  final Matriculas? matriculas;

  StudentMatriculaListItem(this.bloc, this.matriculas);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, 'admin/product/list',
            arguments: matriculas);
      },
      child: Card(
        margin: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
        elevation: 4,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
        child: ListTile(
          contentPadding: EdgeInsets.symmetric(vertical: 12, horizontal: 16),
          title: Text(
            matriculas?.curso ?? '',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 16,
              color: Colors.blueAccent,
            ),
          ),
          subtitle: Text(
            matriculas?.estudiante ?? '',
            style: TextStyle(
              fontSize: 14,
              color: Colors.grey[700],
            ),
          ),
          trailing: Wrap(
            direction: Axis.horizontal,
            spacing: 12,
            children: [
              IconButton(
                onPressed: () {
                  Navigator.pushNamed(context, 'student/matriculas/update',
                      arguments: matriculas);
                },
                icon: Icon(Icons.edit, color: Colors.blue),
              ),
              IconButton(
                onPressed: () {
                  showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return AlertDialog(
                        title: Text("Confirmar eliminación"),
                        content: Text(
                          "¿Estás seguro de que deseas eliminar esta matrícula?",
                        ),
                        actions: [
                          TextButton(
                            onPressed: () {
                              Navigator.of(context)
                                  .pop(); // Cerrar el diálogo sin eliminar
                            },
                            child: Text("Cancelar"),
                          ),
                          TextButton(
                            onPressed: () {
                              bloc?.add(DeleteMatriculas(id: matriculas!.id!));
                              Navigator.of(context)
                                  .pop(); // Cerrar el diálogo después de eliminar
                            },
                            child: Text("Eliminar"),
                          ),
                        ],
                      );
                    },
                  );
                },
                icon: Icon(Icons.delete, color: Colors.red),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
