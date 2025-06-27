import 'package:flutter/material.dart';
import 'package:plan_go/src/presentation/screens/consult/consultation_screen.dart';
import 'package:plan_go/src/presentation/screens/data/data_screen.dart';
import 'package:plan_go/src/presentation/screens/settings/settings_screen.dart';
import 'package:plan_go/src/presentation/screens/sms/sms_screen.dart';
import 'package:plan_go/src/presentation/screens/start/start_screen.dart';
import 'package:plan_go/src/presentation/screens/voice/voice_screen.dart';

import '../../presentation/screens/plans/home_screen.dart';

class AppRouter {
  static const String start = '/';
  static const String home = '/home';
  static const String data = '/data';
  static const String sms = '/sms';
  static const String voice = '/voice';
  static const String consultation = '/consultation';
  static const String settings = '/settings';

  Map<String, WidgetBuilder> getRoutes(BuildContext context) => {
    AppRouter.start: (context) => StartScreen(),
    AppRouter.home: (context) => HomeScreen(),
    AppRouter.consultation: (context) => ConsultationScreen(),
    AppRouter.data: (context) => DataScreen(),
    AppRouter.voice: (context) => VoiceScreen(),
    AppRouter.sms: (context) => SmsScreen(),
    AppRouter.settings: (context) => SettingsScreen(),
  };
}
