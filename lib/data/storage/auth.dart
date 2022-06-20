import 'package:get_storage/get_storage.dart';
import 'package:hiperprof/data/models/response_professor.dart';

class Storage {
  final _getStorage = GetStorage();

  Future<void> saveToken(ResponseProfessor responseProfessor) async {
    await _getStorage.write('auth', responseProfessor.toJson());
  }
}
