import 'package:flutter/material.dart';

import '../../../../design_system/ds.dart';

class LoginButton extends StatelessWidget {
  const LoginButton({super.key, required this.onTap});
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => onTap(),
      child: Column(
        children: [
          Container(
            width: 100,
            height: 100,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(100),
              border: Border.all(color: Colors.white),
            ),
            child: const Icon(Icons.add, color: Colors.white),
          ),
          const SizedBox(height: 8),
          const AppTypography(
            title: 'Entrar',
            fontSize: 16,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ],
      ),
    );
  }
}
