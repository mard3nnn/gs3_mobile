import 'package:gs3_app/modules/login/data/models/remote/mapper/auth_response.dart';

class UserAuthData {
  UserAuthData({
    required this.token,
    required this.user,
    required this.permissions,
  });

  final String token;
  final User user;

  final List<String> permissions;
}
