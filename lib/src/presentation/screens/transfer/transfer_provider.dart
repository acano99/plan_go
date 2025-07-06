import 'package:flutter/material.dart';
import 'package:plan_go/src/domain/use_cases/send_ussd_use_case.dart';

class TransferProvider extends ChangeNotifier {
  int phoneNumber = 0;
  String password = "";
  int amount = 0;
  bool obscureText = true;

  final SendUssdUseCase _sendUssdUseCase;

  TransferProvider({required SendUssdUseCase sendUssdUseCase})
    : _sendUssdUseCase = sendUssdUseCase;

  void setFormsParams(String phone, String password, String amount) {
    phoneNumber = int.tryParse(phone) ?? 0;
    this.password = password;
    this.amount = int.tryParse(amount) ?? 0;
    notifyListeners();
  }

  void toggleObscureText() {
    obscureText = !obscureText;
    notifyListeners();
  }

  Future<void> makeTransfer(BuildContext context) async {
    await _sendUssdUseCase.invoke(
      context,
      '*234*1*$phoneNumber*$password*$amount#',
    );
    clearForm();
  }

  void clearForm() {
    phoneNumber = 0;
    password = "";
    amount = 0;
    notifyListeners();
  }
}
