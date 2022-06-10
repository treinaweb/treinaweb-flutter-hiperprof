import 'package:flutter/cupertino.dart';
import 'package:hiperprof/routes.dart';

class InicialController {
  final bool Function() isValidForm;
  final Function(String route, String search) onNavigatorProfessor;
  final searchController = TextEditingController();

  InicialController(
      {required this.isValidForm, required this.onNavigatorProfessor});

  String? validateSarch(String? value) {
    if (value?.isEmpty ?? true) {
      return 'Digite o que deseja aprender';
    }

    return null;
  }

  void buscarProfessor() {
    final isValid = isValidForm();

    if (isValid) {
      onNavigatorProfessor(Routes.PESQUISA_PROFESSOR, searchController.text);
    }
  }

  void sejaProfessor() {}
  void consultarAula() {}
}
