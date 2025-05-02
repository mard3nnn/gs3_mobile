import 'package:flutter/material.dart';
import 'package:gs3_app/design_system/components/components.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';

import 'components/home_top_bar.dart';

class HomeFavoritesPresentation extends StatelessWidget {
  const HomeFavoritesPresentation({super.key, required this.menu});

  final String menu;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: double.infinity,
        width: double.infinity,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Colors.white,
              Color.fromRGBO(65, 110, 180, 1),
            ],
            stops: [.3, .7],
            begin: Alignment.bottomCenter,
            end: Alignment.topCenter,
          ),
        ),
        child: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(height: 70),
              HomeTopBar(
                backIcon: IconButton(
                  icon: const Icon(
                    LucideIcons.arrowLeft,
                    color: Colors.white,
                  ),
                  onPressed: () => Navigator.pop(context),
                ),
              ),
              const SizedBox(height: 30),
              AppTypography(
                title: 'Menu atual: $menu',
                fontSize: 20,
              )
            ],
          ),
        ),
      ),
    );
  }
}
