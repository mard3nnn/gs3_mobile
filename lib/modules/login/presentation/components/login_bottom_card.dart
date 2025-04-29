import 'package:flutter/material.dart';
import 'package:gs3_app/design_system/components/typography.dart';

class LoginBottomCard extends StatelessWidget {
  const LoginBottomCard({
    super.key,
    required this.title,
    required this.icon,
    this.onTap,
  });

  final String title;
  final IconData icon;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          color: const Color.fromRGBO(230, 230, 230, 1).withOpacity(.1),
          borderRadius: BorderRadius.circular(12),
        ),
        padding: const EdgeInsets.symmetric(
          vertical: 16,
          horizontal: 32,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, color: Colors.white),
            AppTypography(
              title: title,
              textAlign: TextAlign.center,
              color: Colors.white,
              fontSize: 12,
            ),
          ],
        ),
      ),
    );
  }
}
