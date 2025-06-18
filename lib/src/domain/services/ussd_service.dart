import 'package:flutter/services.dart';

class SendUssdService {
  static Future<String> sendUssd(String ussdCode) async {
    try {
      final platform = MethodChannel('com.example/plan_go/ussd');
      final String result = await platform.invokeMethod('sendUssd', {
        'code': ussdCode,
      });
      return result;
    } catch (e) {
      return e.toString();
    }
  }
}
