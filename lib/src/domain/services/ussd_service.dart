import 'package:flutter/services.dart';

class SendUssdService {
  static Future<void> sendUssd(String ussdCode) async {
    try {
      final platform = MethodChannel('com.example/plan_go/ussd');
      await platform.invokeMethod('sendUssd', {'code': ussdCode});
    } on PlatformException catch (e) {
      switch (e.code) {
        case 'PERMISSION_DENIED':
          throw Exception('Permiso de llamada denegado. Por favor, otórguelo.');
        case "SECURITY_EXCEPTION":
          throw Exception(
            'Error de seguridad: ${e.message ?? 'Error desconocido'}',
          );

        case "INTENT_ERROR":
          throw Exception(
            'Error al lanzar el intent USSD: ${e.message ?? 'Error desconocido'}',
          );

        case "INVALID_ARGUMENT":
          throw Exception(
            'Argumento inválido: ${e.message ?? "El código USSD no puede estar vacío."}',
          );

        default:
          throw Exception(
            'Error desconocido desde la plataforma: ${e.code} - ${e.message}',
          );
      }
    } catch (e) {
      throw Exception(e);
    }
  }
}
