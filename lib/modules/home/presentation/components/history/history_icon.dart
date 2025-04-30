import 'package:flutter/material.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';

class HistoryIcon extends StatelessWidget {
  const HistoryIcon({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          decoration: BoxDecoration(
            color: const Color.fromRGBO(229, 229, 229, 1.0).withOpacity(.5),
            borderRadius: BorderRadius.circular(12),
          ),
          padding: const EdgeInsets.all(8),
          child: const Icon(
            LucideIcons.smartphone,
            color: Color.fromRGBO(60, 106, 178, 1),
          ),
        ),
      ],
    );
  }
}
