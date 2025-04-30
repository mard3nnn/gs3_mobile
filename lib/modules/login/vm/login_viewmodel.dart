import 'package:gs3_app/core/vm/base_view_model.dart';
import 'package:rxdart/rxdart.dart';

class LoginViewModel extends BaseViewModel {
  final BehaviorSubject<bool> _enabled = BehaviorSubject<bool>.seeded(false);

  Stream<bool> get enabled => _enabled.stream;

  void setEnabled(bool value) => _enabled.add(value);

  bool get isEnabled => _enabled.value;

  Future<bool> makeLogin({
    required String cpf,
    required String password,
  }) async {
    setLoading(true);
    await Future.delayed(const Duration(seconds: 3));
    setLoading(false);

    return true;
  }
}
