import 'dart:convert';

class PaymentCardModel {
  final String cardNumber;
  final String expiryDate;
  final String cardHolderName;
  final String cvv;
  bool isSelected;

  PaymentCardModel(
      {required this.cardNumber,
      required this.expiryDate,
      required this.cardHolderName,
      required this.cvv,
      this.isSelected = false});

  Map<String, dynamic> toMap() {
    return {
      'cardNumber': cardNumber,
      'expiryDate': expiryDate,
      'cardHolderName': cardHolderName,
      'cvv': cvv,
    };
  }

  factory PaymentCardModel.fromMap(Map<String, dynamic> map) {
    return PaymentCardModel(
      cardNumber: map['cardNumber'],
      expiryDate: map['expiryDate'],
      cardHolderName: map['cardHolderName'],
      cvv: map['cvv'],
    );
  }

  String toJson() => json.encode(toMap());

  factory PaymentCardModel.fromJson(String source) =>
      PaymentCardModel.fromMap(json.decode(source));
}
