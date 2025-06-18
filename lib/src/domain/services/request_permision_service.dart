import 'package:flutter/services.dart';

class RequestPermissionsService {
  static const MethodChannel _phonePermision = MethodChannel(
    'com.example/plan_go/ussd',
  );

  static Future<bool> requestPhonePermission() async =>
      await _phonePermision.invokeMethod('requestCallPermission');
}
