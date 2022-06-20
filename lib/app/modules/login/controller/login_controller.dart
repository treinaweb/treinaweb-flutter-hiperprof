import 'package:hiperprof/app/modules/login/models/login_model.dart';
import 'package:hiperprof/app/modules/login/service/login_service.dart';

class LoginController {
  final LoginService _service = LoginService();

  Future<void> login() async {
    try {
      final loginModel = LoginModel(
        email: 'email',
        password: 'password',
        dispositivo: 'dispositivo',
      );

      _service.login(loginModel);
    } catch (e) {}
  }
}
