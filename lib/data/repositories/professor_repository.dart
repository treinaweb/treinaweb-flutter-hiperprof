import 'package:dio/dio.dart';
import 'package:hiperprof/data/provider/client_api.dart';

class ProfessorRepository {
  final ApiClient _apiClient = ApiClient();

  Future<Response<T>> getAll<T>(String? search) async {
    return await _apiClient.get('/professores', query: {'q': search});
  }

  Future<Response<T>> save<T>(
      {required Map<String, dynamic> data, int? id}) async {
    if (id == null) {
      return await _apiClient.post('/professores', data: data);
    }
    return await _apiClient.put('/professores', data: data);
  }
}
