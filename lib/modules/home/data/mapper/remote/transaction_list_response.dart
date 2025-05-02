class TransactionListResponse {
  final bool success;
  final String? message;
  final List<TransactionData> data;

  TransactionListResponse({
    required this.success,
    this.message,
    required this.data,
  });

  factory TransactionListResponse.fromJson(Map<String, dynamic> json) {
    return TransactionListResponse(
      success: json['success'],
      message: json['message'],
      data: List<TransactionData>.from(
        json['data'].map((x) => TransactionData.fromJson(x)),
      ),
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

class TransactionData {
  final int id;
  final int transactionType;
  final String title;
  final String description;
  final String amount;
  final int installments;
  final String createdAt;
  final int creditCardId;
  final String transactionTypeFormatted;
  final String dateFormatted;

  TransactionData({
    required this.id,
    required this.transactionType,
    required this.title,
    required this.description,
    required this.amount,
    required this.installments,
    required this.createdAt,
    required this.creditCardId,
    required this.transactionTypeFormatted,
    required this.dateFormatted,
  });

  factory TransactionData.fromJson(Map<String, dynamic> json) {
    return TransactionData(
      id: json['id'],
      transactionType: json['transaction_type'],
      title: json['title'],
      description: json['description'],
      amount: json['amount_formatted'],
      installments: json['installments'],
      createdAt: json['created_at_formatted'],
      creditCardId: json['credit_card_id'],
      transactionTypeFormatted: json['transaction_type_formatted'],
      dateFormatted: json['date_formatted'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'transaction_type': transactionType,
      'title': title,
      'description': description,
      'amount': amount,
      'installments': installments,
      'created_at': createdAt,
      'credit_card_id': creditCardId,
      'transaction_type_formatted': transactionTypeFormatted,
      'date_formatted': dateFormatted,
    };
  }
}
