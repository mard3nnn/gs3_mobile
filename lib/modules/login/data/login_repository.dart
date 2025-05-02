import 'package:gs3_app/main.dart';

import '../../../core/http/response/app_response.dart';
import 'models/remote/login_service.dart';
import 'models/remote/mapper/auth_response.dart';

abstract class LoginRepository {
  Future<AppResponse<AuthResponse>?> login({
    required String email,
    required String password,
  });
}

class LoginRepositoryImpl implements LoginRepository {
  final LoginService _service = inject<LoginService>();

  @override
  Future<AppResponse<AuthResponse>?> login({
    required String email,
    required String password,
  }) async {
    try {
      return await _service.login(email: email, password: password);
    } catch (e) {
      return AppResponse(success: false, response: null);
    }
  }
}
