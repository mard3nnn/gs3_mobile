import 'package:flutter/material.dart';

import '../../../../../design_system/ds.dart';
import 'history_icon.dart';

class TileHistory extends StatelessWidget {
  const TileHistory({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      margin: const EdgeInsets.only(left: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const AppTypography(
            title: 'Hoje, 05 Set',
            fontSize: 12,
            color: Color.fromRGBO(40, 144, 207, 1),
            fontWeight: FontWeight.bold,
          ),
          const SizedBox(height: 8),
          Row(
            children: [
              const HistoryIcon(),
              Expanded(
                child: Container(
                  margin: const EdgeInsets.only(left: 16),
                  child: const Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      AppTypography(
                        title: 'Apple',
                        fontSize: 12,
                        fontWeight: FontWeight.bold,
                      ),
                      AppTypography(
                        title: '05/09 às 22:35',
                        fontSize: 10,
                      ),
                    ],
                  ),
                ),
              ),
              Container(
                margin: const EdgeInsets.only(right: 16),
                child: const Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    AppTypography(
                      title: 'R\$ 545,99',
                      fontSize: 12,
                      fontWeight: FontWeight.bold,
                    ),
                    AppTypography(
                      title: 'em 12x',
                      fontSize: 8,
                    ),
                  ],
                ),
              )
            ],
          ),
          Container(
            height: 1,
            margin: const EdgeInsets.only(bottom: 8, top: 8),
            color: const Color.fromRGBO(229, 229, 229, 1),
          )
        ],
      ),
    );
  }
}
