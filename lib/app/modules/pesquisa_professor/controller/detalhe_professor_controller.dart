import 'package:flutter/cupertino.dart';
import 'package:hiperprof/app/modules/pesquisa_professor/service/pesquisa_professor_service.dart';
import 'package:hiperprof/data/models/aluno_model.dart';

class DetalheProfessorController extends ChangeNotifier {
  final Function(DetalheProfessorController) onOpenModalForm;
  final bool Function() onValidForm;
  var load = false;
  var messageErro = '';

  final nomeController = TextEditingController();
  final emailController = TextEditingController();
  final dataController = TextEditingController();

  final PesquisaProfessorService _service = PesquisaProfessorService();

  DetalheProfessorController(
      {required this.onOpenModalForm, required this.onValidForm});

  void contratarProfessor() {
    onOpenModalForm(this);
  }

  Future<void> contratar({required int professorId}) async {
    final isValid = onValidForm();

    if (isValid && !load) {
      load = true;
      messageErro = '';
      notifyListeners();
      try {
        final aluno = Aluno(
          nome: nomeController.text,
          email: emailController.text,
          data: '',
        );

        await _service.salvarAluno(aluno: aluno, professorId: professorId);
      } catch (e) {
        messageErro = e.toString();
      } finally {
        load = false;
        notifyListeners();
      }
    }
  }
}
