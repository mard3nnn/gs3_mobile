import 'package:gs3_app/core/http/response/app_response.dart';
import 'package:gs3_app/core/vm/base_view_model.dart';
import 'package:gs3_app/main.dart';
import 'package:gs3_app/modules/home/data/home_repository.dart';
import 'package:rxdart/subjects.dart';

import '../data/mapper/remote/card_list_response.dart';
import '../data/mapper/remote/transaction_list_response.dart';

class HomeViewmodel extends BaseViewModel {
  final HomeRepository _repository = inject<HomeRepository>();

  final BehaviorSubject<List<CardData>> _listCards =
      BehaviorSubject<List<CardData>>();

  Stream<List<CardData>> get listCards => _listCards.stream;

  void setListCards(List<CardData> value) => _listCards.add(value);

  final BehaviorSubject<List<TransactionData>> _cardTransactions =
      BehaviorSubject<List<TransactionData>>();

  Stream<List<TransactionData>> get transactions => _cardTransactions.stream;

  void setCardTransactions(List<TransactionData> value) =>
      _cardTransactions.add(value);

  Future<void> myCards() async {
    setLoading(true);
    final AppResponse<CardListResponse?> data = await _repository.myCards();

    if (data.success) {
      final List<CardData> cards = data.response!.data;
      await cardHistory(cardId: cards.first.id.toString());
      setListCards(cards);
    }

    setLoading(false);
  }

  Future<void> cardHistory({required String cardId}) async {
    setCardTransactions([]);
    final AppResponse<List<TransactionData>>? data =
        await _repository.cardHistory(cardId: cardId);

    if (data!.success) {
      setCardTransactions(data.response!);
    }
  }
}
