import 'package:flutter/material.dart';

extension ContextResponsiveExtension on BuildContext {
  Size get screenSize => MediaQuery.of(this).size;

  double get screenHeight => screenSize.height;

  double get screenWidth => screenSize.width;

  double get shortestSide => screenSize.shortestSide;

  double get longestSide => screenSize.longestSide;

  bool get isTablet => shortestSide >= 600;

  double heightPct(double percent) => screenHeight * percent;

  double widthPct(double percent) => screenWidth * percent;

  double responsivePct(double percent) => shortestSide * percent;
}
