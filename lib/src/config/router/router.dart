import 'package:flutter/material.dart';
import 'package:plan_go/src/presentation/screens/home/home_screen.dart';

class AppRouter {
  static const String home = '/';

  Map<String, WidgetBuilder> getRoutes(BuildContext context) => {
    AppRouter.home: (context) => HomeScreen(),
  };
}
