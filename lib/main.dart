import 'package:flutter/material.dart';
import 'package:plan_go/src/config/router/router.dart';
import 'package:plan_go/src/config/theme/theme.dart';

void main() async {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final brightness = MediaQuery.platformBrightnessOf(context);

    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: brightness == Brightness.dark
          ? MaterialTheme(TextTheme()).dark()
          : MaterialTheme(TextTheme()).light(),
      routes: AppRouter().getRoutes(context),
      initialRoute: AppRouter.home,
    );
  }
}
