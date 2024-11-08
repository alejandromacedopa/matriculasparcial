import 'package:flutter/material.dart';
import 'package:matriculas/src/presentation/pages/matriculas/create/bloc/StudentMatriculaCreateBloc.dart';
import 'package:matriculas/src/presentation/pages/matriculas/create/bloc/StudentMatriculaCreateEvent.dart';
import 'package:matriculas/src/presentation/pages/matriculas/create/bloc/StudentMatriculaCreateState.dart';
import 'package:matriculas/src/presentation/utils/BlocFormItem.dart';
import 'package:matriculas/src/presentation/widget/DefaultIconBack.dart';
import 'package:matriculas/src/presentation/widget/DefaultTextField.dart';

class StudentMatriculaCreateContent extends StatelessWidget {
  StudentMatriculaCreateBloc? bloc;
  StudentMatriculaCreateState state;

  StudentMatriculaCreateContent(this.bloc, this.state);

  @override
  Widget build(BuildContext context) {
    return Form(
        key: state.formKey,
        child: Stack(
          alignment: Alignment.center,
          children: [
            _imageBackground(context),
            SingleChildScrollView(
              child: Container(
                height: MediaQuery.of(context).size.height,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [_cardCategoryForm(context)],
                ),
              ),
            ),
            DefaultIconBack(left: 15, top: 50)
          ],
        ));
  }

  Widget _cardCategoryForm(BuildContext context) {
    return Container(
      width: double.infinity,
      height: MediaQuery.of(context).size.height * 0.50,
      decoration: BoxDecoration(
          color: Color.fromRGBO(255, 255, 255, 0.7),
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(35),
            topRight: Radius.circular(35),
          )),
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 35),
        child: Column(
          children: [
            _textNewCategory(),
            _textFieldCurso(),
            _textFieldEstudiante(),
            _textFieldnhoras(),
            _textFieldncreditos(),
            _fabSubmit()
          ],
        ),
      ),
    );
  }

  Widget _fabSubmit() {
    return Container(
      alignment: Alignment.centerRight,
      margin: EdgeInsets.only(top: 30),
      child: FloatingActionButton(
        onPressed: () {
          if (state.formKey!.currentState!.validate()) {
            bloc?.add(FormSubmit());
          }
        },
        backgroundColor: Colors.black,
        child: Icon(
          Icons.check,
          color: Colors.white,
        ),
      ),
    );
  }

  Widget _textNewCategory() {
    return Container(
      alignment: Alignment.centerLeft,
      margin: EdgeInsets.only(top: 35, left: 10, bottom: 10),
      child: Text(
        'NUEVA CATEGORIA',
        style: TextStyle(fontSize: 17),
      ),
    );
  }

  Widget _textFieldCurso() {
    return DefaultTextField(
      label: 'Ingrese la Matricula',
      icon: Icons.category,
      onChange: (text) {
        bloc?.add(CursoChanged(curso: BlocFormItem(value: text)));
      },
      validator: (value) {
        return state.curso.error;
      },
      color: Colors.black,
    );
  }

  Widget _textFieldEstudiante() {
    return DefaultTextField(
      label: 'Estudiante',
      icon: Icons.list,
      onChange: (text) {
        bloc?.add(EstudianteChanged(estudiante: BlocFormItem(value: text)));
      },
      validator: (value) {
        return state.estudiante.error;
      },
      color: Colors.black,
    );
  }

  Widget _textFieldnhoras() {
    return DefaultTextField(
      label: 'Ingrese Horas',
      icon: Icons.list,
      onChange: (text) {
        bloc?.add(NhorasChanged(nhoras: BlocFormItem(value: text)));
      },
      validator: (value) {
        return state.nhoras!.error;
      },
      color: Colors.black,
    );
  }

  Widget _textFieldncreditos() {
    return DefaultTextField(
      label: 'Creditos',
      icon: Icons.list,
      onChange: (text) {
        bloc?.add(NcreditosChanged(ncreditos: BlocFormItem(value: text)));
      },
      validator: (value) {
        return state.ncreditos!.error;
      },
      color: Colors.black,
    );
  }

  Widget _imageBackground(BuildContext context) {
    return Image.asset(
      'assets/img/background4.jpg',
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      fit: BoxFit.cover,
      color: Color.fromRGBO(0, 0, 0, 0.7),
      colorBlendMode: BlendMode.darken,
    );
  }
}
