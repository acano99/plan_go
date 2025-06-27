import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:plan_go/src/config/router/router.dart';
import 'package:plan_go/src/config/theme/theme.dart';
import 'package:plan_go/src/domain/services/theme_service.dart';
import 'package:plan_go/src/domain/use_cases/theme/get_theme_use_case.dart';
import 'package:plan_go/src/domain/use_cases/theme/set_theme_use_case.dart';
import 'package:plan_go/src/presentation/globals/global_provider.dart';
import 'package:plan_go/src/presentation/globals/service_locator.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() async {
  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);

  final SharedPreferences prefs = await SharedPreferences.getInstance();

  await setupLocator(prefs);

  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider<GlobalProvider>(
          create: (context) => GlobalProvider(
            getThemeUseCase: serviceLocator<GetThemeUseCase>(),
            setThemeUseCase: serviceLocator<SetThemeUseCase>(),
          ),
        ),
      ],
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final brightness = MediaQuery.platformBrightnessOf(context);

    final globalProvider = context.watch<GlobalProvider>();

    final ThemeData theme = globalProvider.theme == SelectedTheme.dark
        ? MaterialTheme(TextTheme()).dark()
        : globalProvider.theme == SelectedTheme.light
        ? MaterialTheme(TextTheme()).light()
        : (globalProvider.theme == SelectedTheme.automatic &&
              brightness == Brightness.dark)
        ? MaterialTheme(TextTheme()).dark()
        : MaterialTheme(TextTheme()).light();

    FlutterNativeSplash.remove();

    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: theme,
      routes: AppRouter().getRoutes(context),
      initialRoute: AppRouter.home,
    );
  }
}
