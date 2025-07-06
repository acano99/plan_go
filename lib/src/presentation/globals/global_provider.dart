import 'package:flutter/cupertino.dart';
import 'package:plan_go/src/domain/services/theme_service.dart';
import 'package:plan_go/src/domain/use_cases/theme/get_theme_use_case.dart';
import 'package:plan_go/src/domain/use_cases/theme/set_theme_use_case.dart';

class GlobalProvider extends ChangeNotifier {
  SelectedTheme theme;
  final GetThemeUseCase _getThemeUseCase;
  final SetThemeUseCase _setThemeUseCase;

  GlobalProvider({
    this.theme = SelectedTheme.automatic,
    required GetThemeUseCase getThemeUseCase,
    required SetThemeUseCase setThemeUseCase,
  }) : _getThemeUseCase = getThemeUseCase,
       _setThemeUseCase = setThemeUseCase;

  Future<void> getTheme() async {
    theme = await _getThemeUseCase.invoke();
    notifyListeners();
  }

  Future<void> setTheme(SelectedTheme selectedTheme) async {
    theme = selectedTheme;
    notifyListeners();
    await _setThemeUseCase.invoke(selectedTheme);
  }
}
