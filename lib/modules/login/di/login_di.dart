import 'package:gs3_app/main.dart';
import 'package:gs3_app/modules/login/data/login_repository.dart';
import 'package:gs3_app/modules/login/data/remote/service/login_service.dart';
import 'package:gs3_app/modules/login/vm/login_viewmodel.dart';

import '../data/models/remote/login_service.dart';

void startLoginModule() {
  /// Services
  inject.registerFactory<LoginService>(() => LoginServiceImpl());

  /// Repositories
  inject.registerFactory<LoginRepository>(() => LoginRepositoryImpl());

  /// ViewModels
  inject.registerFactory<LoginViewModel>(() => LoginViewModel());
}
