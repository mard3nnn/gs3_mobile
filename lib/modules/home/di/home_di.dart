import 'package:gs3_app/main.dart';
import 'package:gs3_app/modules/home/data/home_repository.dart';
import 'package:gs3_app/modules/home/data/models/remote/home_service.dart';
import 'package:gs3_app/modules/home/data/remote/services/home_service.dart';

import '../vm/home_viewmodel.dart';

void startHomeModule() {
  /// Services
  inject.registerFactory<HomeService>(() => HomeServiceImpl());

  /// Repositories
  inject.registerFactory<HomeRepository>(() => HomeRepositoryImpl());

  /// ViewModels
  inject.registerFactory<HomeViewmodel>(() => HomeViewmodel());
}
