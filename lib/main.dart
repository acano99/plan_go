import 'package:device_preview/device_preview.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:plan_go/src/config/router/router.dart';
import 'package:plan_go/src/config/theme/theme.dart';

void main() async {
  runApp(DevicePreview(enabled: !kReleaseMode, builder: (context) => MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final brightness = MediaQuery.platformBrightnessOf(context);

    return MaterialApp(
      useInheritedMediaQuery: true,
      locale: DevicePreview.locale(context),
      builder: DevicePreview.appBuilder,
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
