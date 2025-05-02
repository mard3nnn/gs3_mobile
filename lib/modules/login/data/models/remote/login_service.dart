import 'package:gs3_app/core/http/response/app_response.dart';

import 'mapper/auth_response.dart';

abstract class LoginService {
  Future<AppResponse<AuthResponse>?> login({
    required String email,
    required String password,
  });
}
