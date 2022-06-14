import 'package:flutter/cupertino.dart';
import 'package:hiperprof/app/modules/pesquisa_professor/service/pesquisa_professor_service.dart';
import 'package:hiperprof/data/models/aluno_model.dart';

class DetalheProfessorController extends ChangeNotifier {
  final Function(DetalheProfessorController) onOpenModalForm;
  final PesquisaProfessorService _service = PesquisaProfessorService();

  DetalheProfessorController({required this.onOpenModalForm});

  void contratarProfessor() {
    onOpenModalForm(this);
  }

  Future<void> contratar({required int professorId}) async {
    try {
      final aluno = Aluno(nome: '', email: '', data: '');

      await _service.salvarAluno(aluno: aluno, professorId: professorId);
    } catch (e) {}
  }
}
