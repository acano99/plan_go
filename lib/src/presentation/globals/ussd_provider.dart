import 'package:flutter/material.dart';
import 'package:plan_go/src/domain/use_cases/send_ussd_use_case.dart';

class UssdProvider {
  final SendUssdUseCase _sendUssdUseCase;

  UssdProvider({required SendUssdUseCase sendUssdUseCase})
    : _sendUssdUseCase = sendUssdUseCase;

  Future<void> sendUssd(BuildContext context, String ussd) async =>
      await _sendUssdUseCase.invoke(context, ussd);
}
