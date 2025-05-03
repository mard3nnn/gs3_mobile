import 'package:dio/dio.dart';
import 'package:gs3_app/core/http/client.dart';
import 'package:gs3_app/core/http/response/app_response.dart';
import 'package:gs3_app/main.dart';

import '../../models/remote/login_service.dart';
import '../../models/remote/mapper/auth_response.dart';

class LoginServiceImpl implements LoginService {
  final HttpClient _client = inject<HttpClient>();

  @override
  Future<AppResponse<AuthResponse?>> login({
    required String email,
    required String password,
  }) async {
    try {
      final Response<Map<String, dynamic>> response = await _client.post(
        '/auth/login',
        data: {'email': email, 'password': password},
      );

      return AppResponse(
        success: true,
        response: AuthResponse.fromJson(response.data!),
      );
    } catch (e) {
      throw Exception('Houve um problema ao realizar o login!');
    }
  }
}
