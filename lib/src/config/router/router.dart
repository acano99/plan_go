import 'package:go_router/go_router.dart';
import 'package:plan_go/src/presentation/screens/data/data_screen.dart';
import 'package:plan_go/src/presentation/screens/settings/settings_screen.dart';
import 'package:plan_go/src/presentation/screens/sms/sms_screen.dart';
import 'package:plan_go/src/presentation/screens/start/start_screen.dart';
import 'package:plan_go/src/presentation/screens/transfer/transfer_screen.dart';
import 'package:plan_go/src/presentation/screens/voice/voice_screen.dart';

class AppRouter {
  static const String start = '/';
  static const String data = '/data';
  static const String sms = '/sms';
  static const String voice = '/voice';
  static const String settings = '/settings';
  static const String transfer = '/transfer';

  static GoRouter router() => GoRouter(
    initialLocation: start,
    routes: [
      GoRoute(name: start, path: start, builder: (_, _) => StartScreen()),
      GoRoute(
        name: transfer,
        path: transfer,
        builder: (_, _) => TransferScreen(),
      ),
      GoRoute(path: data, name: data, builder: (_, _) => DataScreen()),
      GoRoute(path: sms, name: sms, builder: (_, _) => SmsScreen()),
      GoRoute(path: voice, name: voice, builder: (_, _) => VoiceScreen()),
      GoRoute(
        path: settings,
        name: settings,
        builder: (_, _) => SettingsScreen(),
      ),
    ],
  );
}
