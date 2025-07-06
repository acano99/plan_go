import 'package:flutter/material.dart';
import 'package:plan_go/src/domain/services/ussd_service.dart';

import '../../presentation/widgets/error_snackbar.dart';

class SendUssdUseCase {
  final SendUssdService _sendUssdService;

  SendUssdUseCase({required SendUssdService sendUssdService})
    : _sendUssdService = sendUssdService;

  Future<void> invoke(BuildContext context, String ussd) async {
    try {
      await _sendUssdService.sendUssd(ussd);
    } catch (e) {
      if (context.mounted) {
        String fullErrorMessage = e.toString();

        String cleanErrorMessage = fullErrorMessage.replaceFirst(
          RegExp(r'^Exception: '),
          '',
        );

        ScaffoldMessenger.of(
          context,
        ).showSnackBar(showErrorSnackbar(context, cleanErrorMessage));
      }
    }
  }
}
