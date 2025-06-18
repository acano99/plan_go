import 'package:flutter/material.dart';
import 'package:plan_go/src/domain/services/ussd_service.dart';

class SendUssdUseCase {
  static Future<void> invoke(BuildContext context, String ussd) async {
    final colorScheme = Theme.of(context).colorScheme;

    try {
      await SendUssdService.sendUssd(ussd);
    } catch (e) {
      if (context.mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            backgroundColor: colorScheme.error,
            content: Text(
              e.toString(),
              style: TextStyle(color: colorScheme.onError),
            ),
          ),
        );
      }
    }
  }
}
