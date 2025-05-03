import 'package:dio/dio.dart';
import 'package:gs3_app/core/http/client.dart';
import 'package:gs3_app/core/http/response/app_response.dart';
import 'package:gs3_app/main.dart';
import 'package:gs3_app/modules/home/data/mapper/remote/transaction_list_response.dart';

import '../../mapper/remote/card_list_response.dart';
import '../../models/remote/home_service.dart';

class HomeServiceImpl implements HomeService {
  final HttpClient _client = inject<HttpClient>();

  @override
  Future<AppResponse<CardListResponse?>> myCards() async {
    try {
      final Response<Map<String, dynamic>> response = await _client.get(
        '/credit-cards/my-cards',
      );

      return AppResponse(
        success: true,
        response: CardListResponse.fromJson(response.data!),
      );
    } catch (e) {
      throw Exception('Houve um problema ao buscar os cartões!');
    }
  }

  @override
  Future<AppResponse<TransactionListResponse>?> cardHistory({
    required String cardId,
  }) async {
    try {
      final Response<Map<String, dynamic>> response = await _client.get(
        '/credit-cards/transactions/$cardId',
      );

      return AppResponse(
        success: true,
        response: TransactionListResponse.fromJson(response.data!),
      );
    } catch (e) {
      throw Exception('Houve um problema ao buscar o histórico!');
    }
  }
}
