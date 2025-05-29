import 'package:flutter/material.dart';
import 'package:plan_go/src/domain/services/ussd_service.dart';

class SendUssdUseCase {
  static Future<void> invoke(BuildContext context, String ussd) async {
    try {
      await SendUssdService.sendUssd(ussd);
    } catch (e) {
      rethrow;
    }
  }
}
