import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:hiperprof/data/models/aluno_model.dart';
import 'package:hiperprof/data/repositories/aluno_repository.dart';

class HomeProfessorService {
  final AlunoRepository _alunoRepository = AlunoRepository();

  Future<List<Aluno>> getAlunos() async {
    try {
      final response = await _alunoRepository.getAlunos();
      return response.data.map((json) => Aluno.fromJson(json)).toList();
    } on DioError catch (erro, s) {
      log('ERRO AO BUSCAR ALUNOS', error: erro, stackTrace: s);

      if (erro.response != null) {
        throw erro.response!.data['message'];
      }
      throw 'ERRO AO BUSCAR ALUNOS';
    } catch (e, s) {
      log('ERRO INESPERADO AO BUSCAR ALUNOS', error: e, stackTrace: s);
      rethrow;
    }
  }
}
