import 'package:gs3_app/core/http/client.dart';
import 'package:gs3_app/main.dart';
import 'package:gs3_app/modules/home/di/home_di.dart';

import '../../modules/login/di/login_di.dart';

Future<void> startModules() async {
  inject.registerSingleton<HttpClient>(HttpClientImpl());

  startLoginModule();
  startHomeModule();
}
