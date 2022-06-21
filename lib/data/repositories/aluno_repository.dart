import 'package:dio/dio.dart';
import 'package:hiperprof/data/provider/client_api.dart';

class AlunoRepository {
  final ApiClient _apiClient = ApiClient();

  Future<Response> save(
      {required Map<String, dynamic> data, required int professorId}) async {
    return await _apiClient.post(
      '/professores/$professorId/alunos',
      data: data,
    );
  }

  Future<Response<T>> getAlunos<T>() async {
    return await _apiClient.get('/professores/alunos');
  }
}
