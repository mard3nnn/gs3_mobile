import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';
import 'package:gs3_app/modules/home/presentation/home_presentation.dart';

enum HomeRoutesPath {
  home;

  String get path {
    switch (this) {
      case HomeRoutesPath.home:
        return '/home';
    }
  }
}

class HomeRoutes {
  static Handler homeHandler = Handler(
    handlerFunc: (BuildContext? context, Map<String, dynamic> params) {
      return const HomePresentation();
    },
  );
}
