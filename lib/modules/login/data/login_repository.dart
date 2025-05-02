import 'package:gs3_app/main.dart';

import '../../../core/http/response/app_response.dart';
import 'models/remote/login_service.dart';
import 'models/remote/mapper/auth_response.dart';

class LoginRepositoryImpl {
  final LoginService _service = inject<LoginService>();

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
