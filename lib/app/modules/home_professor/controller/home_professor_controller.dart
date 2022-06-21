import 'package:flutter/cupertino.dart';
import 'package:hiperprof/app/mixins/format_data.dart';
import 'package:hiperprof/app/modules/home_professor/models/item_model.dart';
import 'package:hiperprof/app/modules/home_professor/service/home_professor_service.dart';
import 'package:hiperprof/data/models/aluno_model.dart';

class HomeProfessorController extends ChangeNotifier with FormatData {
  final HomeProfessorService _service = HomeProfessorService();
  var itens = const <ItemModel>[];

  void editarProfessor() {}

  void acessarPaginaPrincipal() {}

  Future<void> logout() async {}

  void expansionCallback(int index, bool isExpanded) {
    itens[index].isExpanded = !isExpanded;
    notifyListeners();
  }

  Future<List<Aluno>> getAllAlunos() async {
    try {
      final alunos = await _service.getAlunos();
      itens = alunos
          .map((aluno) => ItemModel(
                nome: aluno.nome,
                email: aluno.email,
                data: formatarDataStringParaBr(aluno.data),
              ))
          .toList();

      return alunos;
    } catch (e) {
      rethrow;
    }
  }
}
