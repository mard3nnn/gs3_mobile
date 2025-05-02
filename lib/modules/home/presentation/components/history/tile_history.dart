import 'package:flutter/material.dart';
import 'package:gs3_app/modules/home/data/mapper/remote/transaction_list_response.dart';

import '../../../../../design_system/ds.dart';
import 'history_icon.dart';

class TileHistory extends StatelessWidget {
  const TileHistory({
    super.key,
    required this.transactionData,
  });

  final TransactionData transactionData;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      margin: const EdgeInsets.only(left: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          AppTypography(
            title: transactionData.dateFormatted,
            fontSize: 12,
            color: const Color.fromRGBO(40, 144, 207, 1),
            fontWeight: FontWeight.bold,
          ),
          const SizedBox(height: 8),
          Row(
            children: [
              const HistoryIcon(),
              Expanded(
                child: Container(
                  margin: const EdgeInsets.only(left: 16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      AppTypography(
                        title: transactionData.title,
                        fontSize: 12,
                        fontWeight: FontWeight.bold,
                      ),
                      AppTypography(
                        title: transactionData.createdAt,
                        fontSize: 10,
                      ),
                    ],
                  ),
                ),
              ),
              Container(
                margin: const EdgeInsets.only(right: 16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    AppTypography(
                      title: transactionData.amount,
                      fontSize: 12,
                      fontWeight: FontWeight.bold,
                    ),
                    AppTypography(
                      title: 'em ${transactionData.installments}x',
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
