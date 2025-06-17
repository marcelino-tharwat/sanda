import 'package:flutter/material.dart';
import 'package:sanda/core/theming/colors.dart';

class DialogUtils {
  static void showSuccessDialog(BuildContext context, String cardNumber) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Payment Successful'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Icon(Icons.check_circle,
                  color: ColorsManager.green, size: 60),
              const SizedBox(height: 16),
              const Text(
                'Payment completed successfully.',
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 16),
              Text(
                'Card ending in ${cardNumber.length >= 4 ? cardNumber.substring(cardNumber.length - 4) : cardNumber}',
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text('OK'),
            ),
          ],
        );
      },
    );
  }

  static void showInvalidCardDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Invalid Card'),
          content: const Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(Icons.error_outline, color: Colors.red, size: 60),
              SizedBox(height: 16),
              Text(
                'The card information you entered is invalid. Please check the card number, expiration date, and CVV, then try again.',
                textAlign: TextAlign.center,
              ),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text('OK'),
            ),
          ],
        );
      },
    );
  }

  static void showCardNotRecognizedDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Card Not Recognized'),
        content: const Text(
          'This card passed basic validation but is not in our test database. Please use one of the provided test cards.',
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('OK'),
          ),
        ],
      ),
    );
  }
}
