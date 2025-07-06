import 'package:get_it/get_it.dart';
import 'package:plan_go/src/data/preferencess/theme_service_preferences.dart';
import 'package:plan_go/src/domain/services/theme_service.dart';
import 'package:plan_go/src/domain/services/ussd_service.dart';
import 'package:plan_go/src/domain/use_cases/send_ussd_use_case.dart';
import 'package:plan_go/src/domain/use_cases/theme/get_theme_use_case.dart';
import 'package:plan_go/src/domain/use_cases/theme/set_theme_use_case.dart';
import 'package:shared_preferences/shared_preferences.dart';

final GetIt serviceLocator = GetIt.instance;

Future<void> setupLocator(SharedPreferences preferences) async {
  //ThemeService
  serviceLocator.registerSingleton<ThemeService>(
    ThemeServicePreferences(preferences: preferences),
  );

  // UssdService
  serviceLocator.registerSingleton<SendUssdService>(SendUssdService());

  //UseCases Theme
  serviceLocator.registerSingleton<GetThemeUseCase>(
    GetThemeUseCase(service: serviceLocator<ThemeService>()),
  );
  serviceLocator.registerSingleton<SetThemeUseCase>(
    SetThemeUseCase(service: serviceLocator<ThemeService>()),
  );

  //UseCase Ussd
  serviceLocator.registerSingleton<SendUssdUseCase>(
    SendUssdUseCase(sendUssdService: serviceLocator<SendUssdService>()),
  );
}
