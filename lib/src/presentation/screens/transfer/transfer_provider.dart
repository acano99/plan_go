import 'package:flutter/material.dart';
import 'package:plan_go/src/domain/use_cases/send_ussd_use_case.dart';
import 'package:plan_go/src/presentation/screens/transfer/ui_state.dart';

class TransferProvider extends ChangeNotifier {
  final UiState uiState = UiState();
  final SendUssdUseCase _sendUssdUseCase;

  TransferProvider({required SendUssdUseCase sendUssdUseCase})
    : _sendUssdUseCase = sendUssdUseCase;

  void onPhoneNumberChange(String number) {
    if (number.isNotEmpty) {
      uiState.copyWith(phoneNumber: int.tryParse(number));
      notifyListeners();
    }
  }

  void onPasswordChange(String number) {
    if (number.isNotEmpty) {
      uiState.copyWith(password: int.tryParse(number));
      notifyListeners();
    }
  }

  void onPhoneAmmountChange(String number) {
    if (number.isNotEmpty) {
      uiState.copyWith(ammount: double.tryParse(number));
      notifyListeners();
    }
  }

  Future<void> makeTransfer(
    BuildContext context,
  ) async => await _sendUssdUseCase.invoke(
    context,
    '*234*1*99${uiState.phoneNumber}*${uiState.password}*${uiState.ammount}#',
  );
}
