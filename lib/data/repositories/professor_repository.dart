import 'package:dio/dio.dart';
import 'package:hiperprof/data/provider/client_api.dart';

class ProfessorRepository {
  final ApiClient _apiClient = ApiClient();

  Future<Response<T>> getAll<T>(String? search) async {
    return await _apiClient.get('/professores', query: {'q': search});
  }
}
