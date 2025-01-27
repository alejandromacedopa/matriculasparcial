import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:matriculas/injection.dart';
import 'package:matriculas/src/presentation/pages/BlocProvider.dart';
import 'package:matriculas/src/presentation/pages/home/StudentHomeContent.dart';
import 'package:matriculas/src/presentation/pages/matriculas/create/StudentMatriculaCreatePage.dart';
import 'package:matriculas/src/presentation/pages/matriculas/list/StudentMatriculaListPage.dart';
import 'package:matriculas/src/presentation/pages/matriculas/update/StudentMatriculaUpdatePage.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await configureDependencias();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: blocProvider,
      child: MaterialApp(
        builder: FToastBuilder(), //activar las notificaciones de forma global
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.white),
          useMaterial3: true,
        ),
        initialRoute: 'student/home',
        routes: {
          'student/home': (BuildContext context) => StudentMatriculaListPage(),
          'student/matriculas/create': (BuildContext context) =>
              StudentMatriculaCreatePage(),
          'student/matriculas/update': (BuildContext context) =>
              StudentMatriculaUpdatePage(),
        },
      ),
    );
  }
}
