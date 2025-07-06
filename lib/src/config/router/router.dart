import 'package:flutter/material.dart';
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

  static GoRoute fadeRoute({
    required String path,
    required String name,
    required Widget child,
  }) {
    return GoRoute(
      path: path,
      name: name,
      pageBuilder: (context, state) => CustomTransitionPage(
        key: state.pageKey,
        child: child,
        transitionDuration: const Duration(milliseconds: 700),
        transitionsBuilder: (context, animation, secondaryAnimation, child) =>
            FadeTransition(opacity: animation, child: child),
      ),
    );
  }

  static GoRouter router() => GoRouter(
    initialLocation: start,
    routes: [
      fadeRoute(path: start, name: start, child: StartScreen()),
      fadeRoute(path: transfer, name: transfer, child: TransferScreen()),
      fadeRoute(path: data, name: data, child: DataScreen()),
      fadeRoute(path: sms, name: sms, child: SmsScreen()),
      fadeRoute(path: voice, name: voice, child: VoiceScreen()),
      fadeRoute(path: settings, name: settings, child: SettingsScreen()),
    ],
  );
}
