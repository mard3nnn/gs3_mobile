import 'package:gs3_app/core/http/response/app_response.dart';
import 'package:gs3_app/core/vm/base_view_model.dart';
import 'package:gs3_app/main.dart';
import 'package:gs3_app/modules/home/data/home_repository.dart';
import 'package:rxdart/subjects.dart';

import '../data/mapper/remote/card_list_response.dart';

class HomeViewmodel extends BaseViewModel {
  final HomeRepository _repository = inject<HomeRepository>();

  final BehaviorSubject<List<CardData>> _listCards =
      BehaviorSubject<List<CardData>>.seeded([]);

  Stream<List<CardData>> get listCards => _listCards.stream;

  void setListCards(List<CardData> value) => _listCards.add(value);

  Future<void> myCards() async {
    setLoading(true);
    setListCards([]);
    final AppResponse<CardListResponse?> data = await _repository.myCards();

    if (data.success) {
      setListCards(data.response!.data);
    }

    setLoading(false);
  }
}
