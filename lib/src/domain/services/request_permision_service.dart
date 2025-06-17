import 'package:flutter/services.dart';

class RequestPermissionsService {
  static const MethodChannel _phonePermision = MethodChannel(
    'com.example/permissions',
  );

  static Future<bool> requestPhonePermission() async =>
      await _phonePermision.invokeMethod('requestCallPermission');
}
