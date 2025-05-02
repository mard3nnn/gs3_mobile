import 'package:gs3_app/core/http/response/app_response.dart';
import 'package:gs3_app/modules/home/data/mapper/remote/card_list_response.dart';

abstract class HomeService {
  Future<AppResponse<CardListResponse?>> myCards();
}
