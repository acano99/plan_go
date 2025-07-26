import 'package:plan_go/src/domain/services/theme_service.dart';

class SetThemeUseCase {
  final ThemeService _service;

  SetThemeUseCase({required ThemeService service}) : _service = service;

  Future<void> invoke(SelectedTheme theme) async =>
      await _service.setTheme(theme);
}
