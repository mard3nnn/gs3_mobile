import 'package:flutter/material.dart';
import 'package:gs3_app/core/http/models/user_auth_data.dart';
import 'package:gs3_app/main.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';

import '../../../../design_system/ds.dart';

class HomeTopBar extends StatelessWidget {
  const HomeTopBar({super.key});

  UserAuthData get user => inject<UserAuthData>();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Icon(
            LucideIcons.menu,
            color: Colors.white,
          ),
          AppTypography(
            title: 'Olá, ${user.user.name}',
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 17,
          ),
          const Row(
            children: [
              Icon(LucideIcons.messageCircle300, color: Colors.white),
              SizedBox(width: 4),
              Icon(LucideIcons.bell, color: Colors.white),
            ],
          )
        ],
      ),
    );
  }
}
