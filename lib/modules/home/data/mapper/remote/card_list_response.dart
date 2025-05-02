class CardListResponse {
  final bool success;
  final String? message;
  final List<CardData> data;

  CardListResponse({
    required this.success,
    this.message,
    required this.data,
  });

  factory CardListResponse.fromJson(Map<String, dynamic> json) {
    return CardListResponse(
      success: json['success'],
      message: json['message'],
      data: List<CardData>.from(json['data'].map((x) => CardData.fromJson(x))),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'success': success,
      'message': message,
      'data': data.map((x) => x.toJson()).toList(),
    };
  }
}

class CardData {
  final int id;
  final int userId;
  final String number;
  final String cardName;
  final int bestPurchaseDay;
  final String limit;
  final String createdAt;
  final String updatedAt;

  CardData({
    required this.id,
    required this.userId,
    required this.number,
    required this.cardName,
    required this.bestPurchaseDay,
    required this.limit,
    required this.createdAt,
    required this.updatedAt,
  });

  factory CardData.fromJson(Map<String, dynamic> json) {
    return CardData(
      id: json['id'],
      userId: json['user_id'],
      number: json['number'],
      cardName: json['card_name'],
      bestPurchaseDay: json['best_purchase_day'],
      limit: json['formatted_limit'],
      createdAt: json['created_at'],
      updatedAt: json['updated_at'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'user_id': userId,
      'number': number,
      'card_name': cardName,
      'best_purchase_day': bestPurchaseDay,
      'limit': limit,
      'created_at': createdAt,
      'updated_at': updatedAt,
    };
  }
}
