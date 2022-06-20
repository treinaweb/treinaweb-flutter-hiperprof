import 'package:dio/dio.dart';
import 'package:hiperprof/data/provider/client_api.dart';

class AuthRepository {
  final ApiClient _apiClient = ApiClient();

  Future<Response<T>> postLogin<T>(Map<String, dynamic> data) async {
    return await _apiClient.post('/auth/login', data: data);
  }
}
