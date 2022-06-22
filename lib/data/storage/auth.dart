import 'package:get_storage/get_storage.dart';
import 'package:hiperprof/data/models/response_professor.dart';

class Storage {
  final _getStorage = GetStorage();

  Future<void> saveToken(ResponseProfessor responseProfessor) async {
    final data = responseProfessor.toJson();
    await _getStorage.write('auth', responseProfessor.toJson());
  }

  ResponseProfessor? getToken() {
    final res = _getStorage.read('auth');

    if (res != null) {
      return ResponseProfessor.fromJson(res);
    }
    return null;
  }

  void clearToken() {
    _getStorage.remove('auth');
  }
}
