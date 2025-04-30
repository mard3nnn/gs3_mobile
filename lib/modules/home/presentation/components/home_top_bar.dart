import 'package:flutter/material.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';

import '../../../../design_system/ds.dart';

class HomeTopBar extends StatelessWidget {
  const HomeTopBar({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.symmetric(horizontal: 8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Icon(
            LucideIcons.menu,
            color: Colors.white,
          ),
          AppTypography(
            title: 'Olá, Cliente',
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 17,
          ),
          Row(
            children: [
              Icon(
                LucideIcons.messageCircle300,
                color: Colors.white,
              ),
              Icon(
                LucideIcons.bell,
                color: Colors.white,
              ),
            ],
          )
        ],
      ),
    );
  }
}
