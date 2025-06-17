class CardValidator {


  static bool validateCard(
    String cardNumber,
    String expiryDate,
    String cardHolderName,
    String cvvCode,
  ) {
   

    bool isLuhnValid = isValidCardNumber(cardNumber.replaceAll(' ', ''));

    bool isExpiryValid = isValidExpiryDate(expiryDate);

    bool isCvvValid = cvvCode.length >= 3 && cvvCode.length <= 4;

    return isLuhnValid && isExpiryValid && isCvvValid;
  }

  static bool isValidCardNumber(String cardNumber) {

    String input = cardNumber.replaceAll(RegExp(r'\D'), '');

    if (input.length < 13 || input.length > 19) return false;

    int sum = 0;
    bool alternate = false;

    for (int i = input.length - 1; i >= 0; i--) {
      int digit = int.parse(input[i]);

      if (alternate) {
        digit *= 2;
        if (digit > 9) {
          digit = (digit % 10) + 1;
        }
      }

      sum += digit;
      alternate = !alternate;
    }

    return sum % 10 == 0;
  }

  static bool isValidExpiryDate(String expiryDate) {
    if (expiryDate.length != 5) return false;

    List<String> parts = expiryDate.split('/');
    if (parts.length != 2) return false;

    int? month = int.tryParse(parts[0]);
    int? year = int.tryParse('20${parts[1]}');

    if (month == null || year == null) return false;
    if (month < 1 || month > 12) return false;

    DateTime now = DateTime.now();
    DateTime expirationDate = DateTime(year, month + 1, 0);

    return expirationDate.isAfter(now);
  }
}
