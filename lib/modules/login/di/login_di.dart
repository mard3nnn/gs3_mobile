import 'package:gs3_app/main.dart';
import 'package:gs3_app/modules/login/vm/login_viewmodel.dart';

void startLoginModule() {
  /// Services

  /// Repositories

  /// ViewModels
  inject.registerFactory<LoginViewModel>(() => LoginViewModel());
}
