import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:gs3_app/modules/login/presentation/login_presentation.dart';
import 'package:gs3_app/router.dart';
import 'package:intl/intl.dart';

import 'core/di/core_di.dart';

final GetIt inject = GetIt.instance;
final router = FluroRouter();

main() async {
  Intl.defaultLocale = 'pt_BR';
  WidgetsFlutterBinding.ensureInitialized();
  defineRouter(router);

  await startModules();
  runApp(const App());
}

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'GS3 Wallet',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
        useMaterial3: true,
      ),
      home: const LoginPresentation(),
    );
  }
}
