import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';

import '../presentation/login_presentation.dart';

enum LoginRoutesPath {
  login;

  String get path {
    switch (this) {
      case LoginRoutesPath.login:
        return '/login';
    }
  }
}

class LoginRoutes {
  static Handler loginHandler = Handler(
    handlerFunc: (BuildContext? context, Map<String, dynamic> params) {
      return const LoginPresentation();
    },
  );
}
