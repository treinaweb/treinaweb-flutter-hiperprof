import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:hiperprof/app/modules/formulario_professor/model/response_professor.dart';
import 'package:hiperprof/data/models/professor_model.dart';
import 'package:hiperprof/data/repositories/professor_repository.dart';
import 'package:hiperprof/data/storage/auth.dart';

class FormularioService {
  final ProfessorRepository _professorRepository = ProfessorRepository();
  final Storage _storage = Storage();

  Future<Professor> cadastrarProfessor(Professor professor) async {
    try {
      final response =
          await _professorRepository.save(data: professor.toJson());
      final professorResponse = ResponseProfessor.fromJson(response.data);
      _storage.saveToken(professorResponse);
      return professorResponse.professor!;
    } on DioError catch (erro, s) {
      log('Erro ao salvar professor', error: erro, stackTrace: s);

      if (erro.response != null) {
        throw erro.response!.data['message'];
      }
      throw 'Erro ao salvar professor';
    } catch (e) {
      throw 'Erro ao salvar professor';
    }
  }
}
