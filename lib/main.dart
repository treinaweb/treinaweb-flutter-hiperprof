import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:hiperprof/app/modules/formulario_professor/view/formulario_professor_view.dart';
import 'package:hiperprof/app/modules/home_professor/view/home_professor_view.dart';
import 'package:hiperprof/app/modules/inicial/views/inicial_view.dart';
import 'package:hiperprof/app/modules/login/views/login_view.dart';
import 'package:hiperprof/app/modules/pesquisa_professor/views/detalhe_professor_view.dart';
import 'package:hiperprof/app/modules/pesquisa_professor/views/pesquisa_professor_view.dart';
import 'package:hiperprof/data/models/professor_model.dart';
import 'package:hiperprof/routes.dart';
import 'package:hiperprof/theme/theme_data.dart';

void main() {
  GetStorage.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: CustomThemeData.ligth(),
      darkTheme: CustomThemeData.dark(),
      themeMode: ThemeMode.system,
      onGenerateRoute: (routeSettings) {
        if (routeSettings.name == Routes.PESQUISA_PROFESSOR) {
          final searchProfessor = routeSettings.arguments as String;
          return MaterialPageRoute(
              builder: (context) => PesquisaProfessorView(
                    searchProfessor: searchProfessor,
                  ));
        }

        if (routeSettings.name == Routes.FORMULARIO_PROFESSOR) {
          final professor = routeSettings.arguments as Professor?;
          return MaterialPageRoute(
              builder: (context) => FormularioProfessorView(
                    professor: professor,
                  ));
        }
      },
      routes: {
        Routes.INCIAL: (context) => const InicialView(),
        Routes.DETALHE_PROFESSOR: (context) => DetalheProfessorView(),
        Routes.LOGIN: (context) => const LoginView(),
        Routes.HOME_PROFESSOR: (context) => const HomeProfessorView(),
      },
    );
  }
}
