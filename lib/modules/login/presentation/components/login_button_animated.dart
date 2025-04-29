import 'package:flutter/material.dart';

import '../../../../design_system/ds.dart';

class LoginButtonAnimated extends StatelessWidget {
  const LoginButtonAnimated({
    super.key,
    required this.title,
    this.onTap,
    this.enabled = true,
    this.loading = false,
    this.padding,
  });

  final bool enabled;
  final bool loading;
  final String title;
  final EdgeInsetsGeometry? padding;

  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
          color: !enabled
              ? Colors.grey.withOpacity(.4)
              : const Color.fromRGBO(1, 57, 114, 1),
          borderRadius: BorderRadius.circular(8),
        ),
        padding: padding ?? const EdgeInsets.symmetric(vertical: 16),
        child: Center(
          child: loading
              ? const CircularProgressIndicator(strokeWidth: 1)
              : AppTypography(
                  title: title,
                  color: Colors.white,
                ),
        ),
      ),
    );
  }
}
