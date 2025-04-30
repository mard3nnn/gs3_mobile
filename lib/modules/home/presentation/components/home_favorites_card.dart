import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../design_system/ds.dart';

class HomeFavoritesCard extends StatelessWidget {
  const HomeFavoritesCard({
    super.key,
    required this.title,
    required this.icon,
    this.onTap,
  });

  final String title;
  final String icon;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              color: const Color.fromRGBO(229, 229, 229, 1).withOpacity(.7),
            ),
            child: SvgPicture.asset(icon),
          ),
          const SizedBox(height: 4),
          AppTypography(
            title: title,
            fontSize: 8,
          )
        ],
      ),
    );
  }
}
