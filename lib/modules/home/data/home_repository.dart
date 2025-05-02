import 'package:gs3_app/core/http/response/app_response.dart';
import 'package:gs3_app/main.dart';
import 'package:gs3_app/modules/home/data/models/remote/home_service.dart';

import 'mapper/remote/card_list_response.dart';
import 'mapper/remote/transaction_list_response.dart';

abstract class HomeRepository {
  Future<AppResponse<CardListResponse?>> myCards();
  Future<AppResponse<List<TransactionData>>?> cardHistory({
    required String cardId,
  });
}

class HomeRepositoryImpl implements HomeRepository {
  final HomeService _service = inject<HomeService>();

  @override
  Future<AppResponse<CardListResponse?>> myCards() async {
    try {
      return await _service.myCards();
    } catch (e) {
      return AppResponse(success: false, response: null);
    }
  }

  @override
  Future<AppResponse<List<TransactionData>>?> cardHistory({
    required String cardId,
  }) async {
    try {
      final data = await _service.cardHistory(cardId: cardId);
      return AppResponse(success: true, response: data!.response!.data);
    } catch (e) {
      return AppResponse(success: false, response: null);
    }
  }
}
