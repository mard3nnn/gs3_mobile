import 'package:flutter/material.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';

import '../../../../design_system/ds.dart';

class HomeCard extends StatelessWidget {
  const HomeCard({
    super.key,
    this.finalNumber,
    this.name,
    this.bankLimit,
    this.bestDayToBuy,
    this.changeBackground = false,
  });

  final String? finalNumber;
  final String? name;

  final double? bankLimit;
  final int? bestDayToBuy;
  final bool changeBackground;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 150,
      width: 300,
      margin: const EdgeInsets.symmetric(horizontal: 10),
      decoration: !changeBackground
          ? _decoration()
          : BoxDecoration(
              color: const Color.fromRGBO(0, 81, 83, 1),
              borderRadius: BorderRadius.circular(16),
            ),
      child: Column(
        children: [
          Row(
            children: [
              Expanded(
                child: Container(
                  margin: const EdgeInsets.only(top: 16, left: 16),
                  color: const Color.fromRGBO(217, 217, 217, 1),
                  width: 80,
                  height: 60,
                ),
              ),
              Expanded(
                flex: 2,
                child: Container(
                  padding: const EdgeInsets.only(left: 16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(height: 10),
                      AppTypography(
                        title: '∙∙∙∙ ${finalNumber ?? '∙∙∙∙'}',
                        color: Colors.white,
                        fontSize: 16,
                      ),
                      AppTypography(
                        title: name ?? '∙∙∙∙',
                        color: Colors.white.withOpacity(.5),
                        fontSize: 14,
                      ),
                    ],
                  ),
                ),
              ),
              const Icon(
                LucideIcons.eye,
                color: Color.fromRGBO(8, 158, 227, 1),
              ),
              const SizedBox(width: 16)
            ],
          ),
          Container(
            margin: const EdgeInsets.only(top: 16, bottom: 8),
            color: const Color.fromRGBO(54, 96, 161, 1),
            height: 2,
          ),
          Row(
            children: [
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.only(left: 10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const AppTypography(
                        title: 'Limite disponível',
                        fontSize: 8,
                        color: Colors.white,
                      ),
                      AppTypography(
                        title: 'R\$ ${bankLimit?.toString() ?? 0}',
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      )
                    ],
                  ),
                ),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.only(right: 10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      const AppTypography(
                        title: 'Melhor dia de compra',
                        fontSize: 8,
                        color: Colors.white,
                      ),
                      AppTypography(
                        title: bestDayToBuy?.toString() ?? '∙∙∙∙',
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      )
                    ],
                  ),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }

  BoxDecoration _decoration() => BoxDecoration(
        gradient: const LinearGradient(
          colors: [Color(0xff2259a6), Color(0xff132d55)],
          stops: [0.1, 0.9],
          begin: Alignment.centerLeft,
          end: Alignment.centerRight,
        ),
        borderRadius: BorderRadius.circular(16),
      );
}
