import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:hiperprof/data/models/aluno_model.dart';
import 'package:hiperprof/data/models/professor_model.dart';
import 'package:hiperprof/data/repositories/aluno_repository.dart';
import 'package:hiperprof/data/repositories/professor_repository.dart';

class PesquisaProfessorService {
  final ProfessorRepository _professorRepository = ProfessorRepository();
  final AlunoRepository _alunoRepository = AlunoRepository();

  Future<List<Professor>> getAllProfessores(String? search) async {
    try {
      final response = await _professorRepository.getAll(search);

      final professores = (response.data as List)
          .map((json) => Professor.fromJson(json))
          .toList();

      return professores;
    } on DioError catch (erro, s) {
      log("Erro ao buscar professores", error: erro, stackTrace: s);
      if (erro.response != null) {
        throw erro.response!.data['message'];
      }
      throw "Erro ao buscar professores";
    } catch (erro, s) {
      log("Erro ao buscar professores", error: erro, stackTrace: s);
      throw "Erro ao buscar professores";
    }
  }

  Future<void> salvarAluno(
      {required Aluno aluno, required int professorId}) async {
    try {
      await _alunoRepository.save(
          data: aluno.toJson(), professorId: professorId);
    } on DioError catch (erro, s) {
      log("Erro ao salvar aluno", error: erro, stackTrace: s);
      if (erro.response != null) {
        throw erro.response!.data['message'];
      }
      throw "Erro ao salvar aluno";
    } catch (erro, s) {
      log("Erro ao salvar aluno", error: erro, stackTrace: s);
      throw "Erro ao salvar aluno";
    }
  }
}
