import 'package:gs3_app/core/http/models/user_auth_data.dart';
import 'package:gs3_app/core/http/response/app_response.dart';
import 'package:gs3_app/core/vm/base_view_model.dart';
import 'package:gs3_app/main.dart';
import 'package:gs3_app/modules/login/data/models/remote/mapper/auth_response.dart';
import 'package:rxdart/rxdart.dart';

import '../data/login_repository.dart';

class LoginViewModel extends BaseViewModel {
  final LoginRepository repository = inject<LoginRepository>();

  final BehaviorSubject<bool> _enabled = BehaviorSubject<bool>.seeded(false);

  Stream<bool> get enabled => _enabled.stream;

  void setEnabled(bool value) => _enabled.add(value);

  bool get isEnabled => _enabled.value;

  Future<bool> makeLogin({
    required String email,
    required String password,
  }) async {
    setLoading(true);

    final AppResponse<AuthResponse>? result = await repository.login(
      email: email,
      password: password,
    );

    if (result!.success) {
      _syncData(
        data: UserAuthData(
          token: result.response!.data.accessToken,
          user: result.response!.data.user,
        ),
      );
    }

    setLoading(false);

    return result.success;
  }

  void _syncData({required UserAuthData data}) {
    if (inject.isRegistered<UserAuthData>()) {
      inject.unregister<UserAuthData>();
      inject.registerSingleton<UserAuthData>(data);
    } else {
      inject.registerSingleton<UserAuthData>(data);
    }
  }
}
