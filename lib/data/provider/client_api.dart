import 'package:dio/dio.dart';
import 'package:dio/src/response.dart';
import 'package:hiperprof/data/provider/rest_interface.dart';

class ApiClient implements Rest {
  final Dio _dio = Dio();
  final _baseUrl = "https://hyperprof.herokuapp.com/api";

  ApiClient() {
    _dio.options.baseUrl = _baseUrl;
    _dio.options.sendTimeout = 15000;
    final header = {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
    };

    _dio.options.headers = header;
  }

  @override
  Future<Response<T>> delete<T>(String path) async {
    return await _dio.delete(path);
  }

  @override
  Future<Response<T>> get<T>(String path, {Map<String, dynamic>? query}) async {
    return await _dio.get(path, queryParameters: query);
  }

  @override
  Future<Response<T>> post<T>(String path, {required data}) async {
    return await _dio.post(path, data: data);
  }

  @override
  Future<Response<T>> put<T>(String path, {required data}) async {
    return await _dio.put(path, data: data);
  }
}
