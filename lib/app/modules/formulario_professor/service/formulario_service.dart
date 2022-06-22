import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:hiperprof/data/models/response_professor.dart';
import 'package:hiperprof/data/models/professor_model.dart';
import 'package:hiperprof/data/repositories/professor_repository.dart';
import 'package:hiperprof/data/storage/auth.dart';
import 'package:image_picker/image_picker.dart';

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

  Future<String> salvarImagemProfessor(
      {required XFile path, required int professorId}) async {
    try {
      final multiPardata =
          await MultipartFile.fromFile(path.path, filename: path.name);

      final form = FormData.fromMap({'foto': multiPardata});

      final response = await _professorRepository.saveFotoProfessor(
        image: form,
        professorId: professorId,
      );

      return Professor.fromJson(response.data).fotoPerfil!;
    } on DioError catch (erro, s) {
      log('Erro ao salvar foto', error: erro, stackTrace: s);

      if (erro.response != null) {
        throw erro.response!.data['message'];
      }
      throw 'Erro ao salvar foto';
    } catch (e) {
      throw 'Erro inesperado ao salvar foto';
    }
  }

  Future<Professor> editarProfessor(Professor professor) async {
    try {
      final response = await _professorRepository.save(
        data: professor.toJson(),
        id: professor.id,
      );

      final professorEditado = Professor.fromJson(response.data);

      final token = _storage.getToken()!.token;
      _storage.saveToken(
          ResponseProfessor(professor: professorEditado, token: token));

      return professorEditado;
    } on DioError catch (erro, s) {
      log('Erro ao editar professor', error: erro, stackTrace: s);

      if (erro.response != null) {
        throw erro.response!.data['message'];
      }
      throw 'Erro ao editar professor';
    } catch (e) {
      throw 'Erro inesperado editar professor';
    }
  }

  Future<void> deletarProfessor() async {
    try {
      await _professorRepository.delete();
      _storage.clearToken();
    } on DioError catch (erro, s) {
      log('Erro ao deletar professor', error: erro, stackTrace: s);

      if (erro.response != null) {
        throw erro.response!.data['message'];
      }
      throw 'Erro ao deletar professor';
    } catch (e) {
      throw 'Erro inesperado deletar professor';
    }
  }
}
