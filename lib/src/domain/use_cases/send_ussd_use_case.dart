import 'package:flutter/material.dart';
import 'package:plan_go/src/domain/services/ussd_service.dart';

import '../../presentation/widgets/error_snackbar.dart';

class SendUssdUseCase {
  static Future<void> invoke(BuildContext context, String ussd) async {
    try {
      await SendUssdService.sendUssd(ussd);
    } catch (e) {
      if (context.mounted) {
        ScaffoldMessenger.of(
          context,
        ).showSnackBar(showErrorSnackbar(context, e.toString()));
      }
    }
  }
}
