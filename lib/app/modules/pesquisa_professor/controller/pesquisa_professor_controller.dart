import 'package:flutter/cupertino.dart';
import 'package:hiperprof/app/modules/pesquisa_professor/service/pesquisa_professor_service.dart';

import 'package:hiperprof/data/models/professor_model.dart';
import 'package:hiperprof/routes.dart';

class PesquisaProfessorController extends ChangeNotifier {
  final PesquisaProfessorService _service = PesquisaProfessorService();
  final Function(String route, Professor professor) onNavigatorProfessor;

  PesquisaProfessorController({required this.onNavigatorProfessor});

  void selectProfessor(Professor professor) {
    onNavigatorProfessor(Routes.DETALHE_PROFESSOR, professor);
  }

  Future<List<Professor>> getAllProfessor(String? search) async {
    try {
      return await _service.getAllProfessores(search);
    } catch (e) {
      rethrow;
    }
  }
}
