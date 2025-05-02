import 'package:gs3_app/core/http/response/app_response.dart';
import 'package:gs3_app/core/vm/base_view_model.dart';
import 'package:gs3_app/main.dart';
import 'package:gs3_app/modules/home/data/home_repository.dart';

import '../data/mapper/remote/card_list_response.dart';

class HomeViewmodel extends BaseViewModel {
  final HomeRepository _repository = inject<HomeRepository>();

  Future<void> myCards() async {
    setLoading(true);
    final AppResponse<CardListResponse?> data = await _repository.myCards();

    setLoading(false);
  }
}
