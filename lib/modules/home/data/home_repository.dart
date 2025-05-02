import 'package:gs3_app/core/http/response/app_response.dart';
import 'package:gs3_app/main.dart';
import 'package:gs3_app/modules/home/data/models/remote/home_service.dart';

import 'mapper/remote/card_list_response.dart';

abstract class HomeRepository {
  Future<AppResponse<CardListResponse?>> myCards();
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
}
