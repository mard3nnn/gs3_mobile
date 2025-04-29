import 'package:flutter/material.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';

class LoginConstants {
  static List<Map<String, dynamic>> bottomCards = [
    {'title': 'Solicitar\ncartão', 'icon': Icons.add_card_rounded},
    {'title': 'Acompanhar\nsolicitação', 'icon': Icons.search},
    {
      'title': 'Perguntas\nfrequentes',
      'icon': LucideIcons.messageCircleQuestion
    },
    {'title': 'Central de\natendimento', 'icon': Icons.phone},
  ];
}
